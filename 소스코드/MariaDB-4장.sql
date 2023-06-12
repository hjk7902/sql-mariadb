SELECT AVG(salary), MAX(salary), MIN(salary), SUM(salary)
FROM   employees
WHERE  job_id LIKE 'SA%';

SELECT MIN(hire_date), MAX(hire_date)
FROM   employees;

SELECT MIN(first_name), MAX(last_name)
FROM   employees;

SELECT MAX(salary) 
FROM   employees;

SELECT COUNT(*) FROM employees;

SELECT COUNT(commission_pct) 
FROM   employees;

SELECT SUM(salary) AS 합계, 
       ROUND(AVG(salary), 2) AS 평균,
       ROUND(STDDEV(salary), 2) AS 모표준편차,
       ROUND(STDDEV_SAMP(salary), 2) AS 표본표준편차,
       ROUND(VARIANCE(salary), 2) AS 분산
FROM   employees;


SELECT ROUND(AVG(salary*commission_pct), 2) AS avg_bonus
FROM   employees;

SELECT 
  ROUND(SUM(salary*commission_pct), 2) AS sum_bonus, 
  COUNT(*) count, 
  ROUND(AVG(salary*commission_pct), 2) AS avg_bonus1, 
  ROUND(SUM(salary*commission_pct)/count(*), 2) AS avg_bonus2
FROM employees;


SELECT ROUND(AVG(NVL(salary*commission_pct,0)),2)
FROM   employees;

SELECT   department_id, AVG(salary)
FROM     employees
GROUP BY department_id;


SELECT    department_id, AVG(salary)
FROM      employees
WHERE     AVG(salary) > 2000
GROUP BY  department_id;


SELECT   department_id, ROUND(AVG(salary), 2)
FROM     employees
GROUP BY department_id
HAVING   AVG(salary) > 8000;

SELECT   job_id, AVG(salary) PAYROLL
FROM     employees
WHERE    job_id NOT LIKE 'SA%'
GROUP BY job_id
HAVING   AVG(salary) > 8000
ORDER BY AVG(salary);


SELECT    department_id, job_id, SUM(salary)
FROM      employees
GROUP BY  department_id, job_id;

SELECT * FROM employees;

SELECT  department_id, COUNT(first_name)
FROM    employees;

SELECT   department_id, COUNT(first_name)
FROM     employees
GROUP BY department_id;

SELECT department_id, ROUND(AVG(salary), 2)
  FROM employees
  GROUP BY department_id
UNION ALL
SELECT job_id, ROUND(AVG(salary), 2)
  FROM employees
  GROUP BY job_id
ORDER BY 1;

SELECT   department_id, job_id, ROUND(AVG(salary),2), COUNT(*) 
FROM     employees
GROUP BY department_id, job_id WITH ROLLUP;

SELECT   department_id, job_id, ROUND(AVG(salary),2), COUNT(*) 
FROM     employees
GROUP BY department_id, job_id DESC WITH ROLLUP;

SELECT department_id, first_name
FROM   employees
GROUP  BY department_id; 

SELECT   department_id, 
  GROUP_CONCAT(first_name ORDER BY hire_date DESC SEPARATOR '-') AS names
FROM     employees
GROUP BY department_id;

SELECT   dept_id, IFNULL(job_id, 'Total') AS job_id, avg_sal, cnt
FROM (
  SELECT IFNULL(department_id, 'UnKnown') AS dept_id, job_id, 
         ROUND(AVG(salary),2) AS avg_sal, COUNT(*) AS cnt
  FROM   employees
  GROUP BY department_id, job_id DESC WITH ROLLUP
) AS t;

