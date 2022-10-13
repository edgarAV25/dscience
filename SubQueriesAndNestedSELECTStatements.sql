-- 1. Execute a failing query (i.e. one which gives an error) 
-- to retrieve all employees records whose salary is lower 
-- than the average salary.
SELECT * FROM EMPLOYEES WHERE SALARY < AVG(SALARY); 
-- 2. Execute a working query using a sub-select to retrieve all employees records whose 
-- salary is lower than the average salary.
SELECT * FROM EMPLOYEES WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEES);
-- 3. Execute a failing query (i.e. one which gives an error) to retrieve all employees records 
-- with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row
SELECT EMP_ID, SALARY, MAX(SALARY) FROM EMPLOYEES;
-- 4. Execute a Column Expression that retrieves all employees 
-- records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
SELECT EMP_ID, SALARY, (SELECT MAX(SALARY) AS MAX_SALARY FROM EMPLOYEES) FROM EMPLOYEES;
-- 5. Execute a Table Expression for the EMPLOYEES table 
-- that excludes columns with sensitive employee data 
-- (i.e. does not include columns: SSN, B_DATE, SEX, ADDRESS, SALARY).
select * from ( select EMP_ID, F_NAME, L_NAME, DEP_ID from employees) AS EMP4ALL;