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