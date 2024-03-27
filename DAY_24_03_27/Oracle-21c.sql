SELECT first_name, salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE first_name='Nancy');    
                
SELECT first_name, job_id, hire_date
FROM employees
WHERE job_id = (SELECT job_id
                FROM employees
                WHERE employee_id=103);

SELECT first_name, salary
FROM employees
WHERE salary > ANY (SELECT salary
                FROM employees
                WHERE first_name='David');
                
SELECT first_name, department_id, job_id
FROM employees
WHERE department_id IN (SELECT department_id
                        FROM employees
                        WHERE first_name='David');    
                        
SELECT first_name, department_id, job_id
FROM employees e
WHERE EXISTS (SELECT *
                FROM departments d
                WHERE d.manager_id=e.employee_id);
                
SELECT first_name, e.department_id,job_id
FROM departments d
JOIN employees e
ON d.manager_id=e.employee_id
ORDER BY e.department_id;

SELECT first_name, salary
FROM employees a
WHERE salary > (SELECT avg(salary)
                FROM employees b
                WHERE b.department_id=a.department_id);
                
SELECT first_name, (SELECT department_name
    FROM departments d
    WHERE d.department_id=e.department_id) department_name
FROM employees e
ORDER BY first_name;

SELECT first_name, department_name
FROM employees e
JOIN departments d ON (e.department_id=d.department_id)
ORDER BY first_name;