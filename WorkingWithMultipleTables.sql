--Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
SELECT * FROM EMPLOYEES WHERE JOB_ID IN (SELECT JOB_IDENT FROM JOBS); 
--Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.
SELECT * FROM EMPLOYEES WHERE JOB_ID IN (SELECT JOB_IDENT FROM JOBS WHERE JOB_TITLE = 'Jr. Designer');
--Retrieve JOB information and who earn more than $70,000.
SELECT * FROM JOBS WHERE JOB_IDENT IN (SELECT JOB_ID FROM EMPLOYEES WHERE SALARY > 70000);
--Retrieve JOB information and whose birth year is after 1976.
SELECT * FROM JOBS WHERE JOB_IDENT IN(SELECT JOB_ID FROM EMPLOYEES WHERE YEAR(B_DATE) > 1976);
--Retrieve JOB information for female employees whose birth year is after 1976.
SELECT * FROM JOBS WHERE JOB_IDENT IN(SELECT JOB_ID FROM EMPLOYEES WHERE YEAR(B_DATE) > 1976 
AND SEX = 'F' );
--Accessing Multiple Tables with Implicit Joins
--Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables
SELECT * FROM EMPLOYEES,JOBS;
--Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
SELECT * FROM EMPLOYEES WHERE JOB_ID IN (SELECT JOB_IDENT FROM JOBS); 
--Redo the previous query, using shorter aliases for table names.
select * from employees E, jobs J where E.JOB_ID = J.JOB_IDENT;
--Redo the previous query, but retrieve only the Employee ID, Employee Name and Job Title.
select E.EMP_ID, E.F_NAME, J.JOB_TITLE from employees E, jobs J where E.JOB_ID = J.JOB_IDENT;