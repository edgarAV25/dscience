ALTER TABLE CHICAGO_PUBLIC_SCHOOLS ALTER COLUMN LEADERS_ICON SET DATA TYPE VARCHAR(10);
DROP PROCEDURE UPDATE_LEADERS_SCORE;
--#SET TERMINATOR @
CREATE PROCEDURE UPDATE_LEADERS_SCORE( 
    IN SCHOOL_ID_ INTEGER, IN LEADERS_SCORE_ INTEGER )     -- ( { IN/OUT type } { parameter-name } { data-type }, ... )

LANGUAGE SQL                                                -- Language used in this routine
MODIFIES SQL DATA                                           -- This routine will only write/modify data in the table

BEGIN 

        UPDATE CHICAGO_PUBLIC_SCHOOLS
        SET LEADERS_SCORE = LEADERS_SCORE_::VARCHAR(3)
        WHERE SCHOOL_ID = SCHOOL_ID_;
        
        IF LEADERS_SCORE_ > 0 AND LEADERS_SCORE_ < 19 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS 
        SET LEADERS_ICON = 'Very Weak'
        WHERE SCHOOL_ID = SCHOOL_ID;
        COMMIT WORK;
        
        ELSEIF LEADERS_SCORE_ > 20 AND LEADERS_SCORE_ < 39 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS 
        SET LEADERS_ICON = 'Weak'
        WHERE SCHOOL_ID = SCHOOL_ID;
        COMMIT WORK;
        
        ELSEIF LEADERS_SCORE_ > 40 AND LEADERS_SCORE_ < 59 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS 
        SET LEADERS_ICON = 'AVERAGE'
        WHERE SCHOOL_ID = SCHOOL_ID;
        COMMIT WORK;
        
        ELSEIF LEADERS_SCORE_ > 60 AND LEADERS_SCORE_ < 79 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS 
        SET LEADERS_ICON = 'Strong'
        WHERE SCHOOL_ID = SCHOOL_ID;
        COMMIT WORK;
        
        ELSEIF LEADERS_SCORE_ > 80 AND LEADERS_SCORE_ < 99 THEN
        UPDATE CHICAGO_PUBLIC_SCHOOLS 
        SET LEADERS_ICON = 'Very Strong'
        WHERE SCHOOL_ID = SCHOOL_ID;
        COMMIT WORK;
        
        ELSE
        ROLLBACK WORK;
        END IF;
    
END
@
-- Routine termination character  


