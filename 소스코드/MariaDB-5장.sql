SELECT first_name, department_name
FROM   employees, departments;

SELECT first_name, employees.department_id, department_name
FROM   employees, departments; 

SELECT e.first_name, e.department_id, d.department_name
FROM   employees e, departments d; 

SELECT e.first_name, e.department_id, d.department_name
FROM   employees e, departments d
WHERE  e.department_id=d.department_id; 

SELECT e.first_name, e.salary, m.first_name, m.salary
FROM employees e, employees m
WHERE e.manager_id=m.employee_id AND e.salary>m.salary;

SELECT e.first_name AS employee_name, 
       m.first_name AS manager_name
FROM   employees e, employees m
WHERE  e.manager_id=m.employee_id AND e.employee_id=103;

SELECT  e.first_name, e.salary, j.job_title
FROM    employees e, jobs j
WHERE   e.salary
BETWEEN j.min_salary AND j.max_salary
ORDER BY e.first_name;

DESC jobs;

SELECT e.employee_id, e.first_name, e.hire_date,
       j.start_date, j.end_date, j.job_id, j.department_id
FROM   employees e, job_history j
WHERE  e.employee_id = j.employee_id
ORDER BY j.employee_id; 

SELECT first_name, job_title
FROM employees 
NATURAL JOIN jobs;

SELECT first_name, department_name
FROM employees
NATURAL JOIN departments;

SELECT first_name, department_name
FROM   employees 
JOIN   departments 
USING (department_id);

SELECT department_name, street_address, city, state_province
FROM   departments d
JOIN   locations l
ON     d.location_id = l.location_id;


SELECT department_name, first_name
FROM departments d
JOIN employees e ON d.manager_id=e.employee_id;

SELECT e.first_name, d.department_name, 
   CONCAT(l.street_address, ', ', l.city, ', ', l.state_province)
    AS address
FROM  employees   e 
JOIN  departments d  ON  e.department_id=d.department_id
JOIN  locations   l  ON  d.location_id=l.location_id;

SELECT employee_id, department_name
FROM  employees 
CROSS JOIN departments;