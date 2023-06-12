SELECT job_id, round(avg(salary),2) AS average 
FROM employees 
GROUP BY job_id;

SELECT department_id, count(*) 
FROM employees
GROUP BY department_id;


SELECT department_id, job_id, count(*) 
FROM employees 
GROUP BY department_id, job_id;


SELECT 
  department_id, 
  round(STDDEV(salary), 2) 
FROM employees
GROUP BY department_id;

SELECT department_id, count(*) 
FROM employees 
GROUP BY department_id 
HAVING count(*) >= 4;

SELECT job_id, count(*) 
FROM employees 
WHERE department_id=50 
GROUP BY job_id;


SELECT job_id, count(*) 
FROM employees 
WHERE department_id=50 
GROUP BY job_id 
HAVING count(*) <= 10;


SELECT 
    TO_CHAR(hire_date, 'YYYY') AS 입사년도,
    ROUND(AVG(salary)) AS 급여평균,
    COUNT(*) AS 사원수
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY 1;


SELECT 
    TO_CHAR(hire_date, 'YYYY') AS 입사년도,
    TO_CHAR(hire_date, 'MM') AS 입사월,
    ROUND(AVG(salary)) AS 급여평균,
    COUNT(*) AS 사원수
FROM employees
GROUP BY TO_CHAR(hire_date, 'YYYY'), TO_CHAR(hire_date, 'MM') WITH ROLLUP;