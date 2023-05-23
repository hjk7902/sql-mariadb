# 1. SELECT 문장
SELECT first_name, last_name, salary
FROM   employees;

SELECT * FROM employees;

SELECT department_id, department_name, manager_id, location_id
FROM   departments;


SELECT department_name, location_id
FROM   departments;


SELECT location_id, department_name
FROM   departments;

SELECT first_name, hire_date, salary
FROM   employees;

SELECT first_name, last_name, salary, salary + 300
FROM   employees;

SELECT first_name, last_name, salary, salary+salary*0.1
FROM   employees;

SELECT first_name, department_id, commission_pct
FROM   employees;

SELECT  first_name AS 이름, salary 급여
FROM    employees;

SELECT  first_name "Employee Name",
        salary*12  "Annual Salary"
FROM    employees;


SELECT CONCAT(first_name, ' ', last_name, '''s salary is $', salary)
    AS "Employee Details"
FROM    employees;

SELECT department_id
FROM   employees;

SELECT DISTINCT department_id
FROM   employees;

SELECT _ROWID, employee_id FROM employees;

-- 2. 데이터 행 제한
SELECT first_name, job_id, department_id 
FROM   employees
WHERE  job_id='IT_PROG';

SELECT first_name, last_name, hire_date
FROM   employees
WHERE  last_name='King';


SELECT first_name, last_name, hire_date
FROM   employees
WHERE  last_name='KING';


SELECT first_name, salary, hire_date
FROM   employees
WHERE  salary >= 15000;

SELECT first_name, salary, hire_date
FROM   employees
WHERE  hire_date='2004-01-30';

SELECT first_name, salary, hire_date
FROM   employees
WHERE  first_name='Steven';

SELECT first_name, salary
FROM   employees
WHERE  salary BETWEEN 10000 AND 12000;

SELECT first_name, salary, hire_date
FROM   employees
WHERE  hire_date BETWEEN '03/01/01' AND '03/12/13';

SELECT employee_id, first_name, salary, manager_id
FROM   employees
WHERE  manager_id IN(101, 102, 103);

SELECT first_name, last_name, job_id, department_id
FROM   employees
WHERE  job_id IN('IT_PROG', 'FI_MGR', 'AD_VP');

SELECT first_name, last_name, job_id, department_id
FROM   employees
WHERE  job_id LIKE 'it%';


SELECT first_name, hire_date
FROM   employees
WHERE  hire_date LIKE '2003%';

SELECT first_name, email
FROM   employees
WHERE  email LIKE '_A%';

SELECT first_name, job_id
FROM   employees
WHERE  job_id LIKE 'SA/_M%' ESCAPE '/';

SELECT first_name, manager_id
FROM   employees
WHERE  manager_id IS NULL;

SELECT first_name, job_id, commission_pct
FROM   employees
WHERE  commission_pct IS NULL;

SELECT first_name, job_id, commission_pct
FROM   employees
WHERE  commission_pct IS NOT NULL;

SELECT first_name, job_id, salary
FROM   employees
WHERE  job_id='IT_PROG' AND salary>=5000;

SELECT first_name, job_id, salary
FROM   employees
WHERE  job_id='IT_PROG' OR salary>=5000;

SELECT first_name, department_id
FROM   employees
WHERE  department_id NOT IN(50, 60, 70, 80, 90, 100);


SELECT first_name, department_id
FROM   employees
WHERE  department_id NOT BETWEEN 50 AND 100;

SELECT first_name, job_id, salary
FROM   employees
WHERE  job_id = 'IT_PROG' 
OR     job_id = 'FI_MGR' 
AND    salary >= 6000;

SELECT first_name, job_id, salary
FROM   employees
WHERE  (job_id='IT_PROG' OR job_id='FI_MGR') 
AND    salary >= 6000;

SELECT   first_name, hire_date
FROM     employees
ORDER BY hire_date;

SELECT   first_name, hire_date
FROM     employees
ORDER BY hire_date DESC;

SELECT   first_name, salary*12 AS annsal
FROM     employees
ORDER BY annsal;