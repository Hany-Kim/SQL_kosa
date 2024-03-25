SELECT first_name, last_name, salary
FROM employees;

SELECT department_name, location_id
FROM departments;

SELECT location_id, department_name
FROM departments;

SELECT first_name, hire_date, salary
FROM employees;

SELECT first_name, last_name, salary, salary+salary*0.1
FROM employees;

SELECT first_name, department_id, commission_pct
FROM employees;

SELECT first_name AS 이름, salary 급여
FROM employees;

SELECT first_name "Employee Name",
salary*12 "Annual Salary"
FROM employees;

SELECT first_name || ' ' || last_name || '''s salary is $' || salary
AS "Employee Details"
FROM employees;

SELECT department_id
FROM employees;

SELECT DISTINCT department_id
FROM employees;

SELECT ROWID, ROWNUM, employee_id, first_name
FROM employees;


SELECT first_name, job_id, department_id
FROM employees
WHERE job_id='IT_PROG';

SELECT first_name, last_name, hire_date
FROM employees
WHERE last_name='King';

SELECT first_name, salary, hire_date
FROM employees
WHERE salary >= 15000;

SELECT first_name, salary, hire_date
FROM employees
WHERE hire_date='13/06/17';

SELECT first_name, salary, hire_date
FROM employees
WHERE first_name='Steven';

SELECT first_name, salary
FROM employees
WHERE salary BETWEEN 10000 AND 12000;

SELECT employee_id, first_name, salary, manager_id
FROM employees
WHERE manager_id IN(101,102,103);

SELECT first_name, last_name, job_id, department_id
FROM employees
WHERE job_id IN('IT_PROG', 'FI_MGR', 'AD_VP');

SELECT first_name, last_name, job_id, department_id
FROM employees
WHERE job_id LIKE 'IT%';

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '16%';

SELECT first_name, email
FROM employees
WHERE email LIKE '_A%';

SELECT first_name, job_id
FROM employees
WHERE job_id LIKE 'SA\_M%' ESCAPE '\';

SELECT first_name, manager_id
FROM employees
WHERE manager_id IS NULL;

SELECT first_name, job_id, salary
FROM employees
WHERE job_id='IT_PROG' AND salary>=5000;

SELECT first_name, job_id, salary
FROM employees
WHERE job_id='IT_PROG' OR salary>=5000;

SELECT first_name, job_id, salary
FROM employees
WHERE job_id = 'IT_PROG'
OR job_id = 'FI_MGR'
AND salary >= 6000;

SELECT first_name, hire_date
FROM employees
ORDER BY hire_date;

SELECT first_name, hire_date
FROM employees
ORDER BY hire_date DESC;

SELECT first_name, salary*12 AS annsal
FROM employees
ORDER BY annsal;

SELECT first_name, salary*12 AS annsal
FROM employees
ORDER BY 2;

-- 연습문제
SELECT * FROM employees;

-- 1.
SELECT employee_id, first_name, hire_date, salary
FROM employees;

-- 2.
SELECT first_name || ' ' || last_name AS name
FROM employees;

-- 3.
SELECT *
FROM employees
WHERE department_id='50';

-- 4.
SELECT first_name, department_id, job_id
FROM employees
WHERE department_id='50';

-- 5.
SELECT first_name, salary, (salary + 300)
FROM employees;

-- 6.
SELECT first_name, salary
FROM employees
WHERE salary>='10000';

-- 7.
SELECT first_name, job_id, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL
AND commission_pct>0;

-- 8.
SELECT first_name, hire_date, salary
FROM employees
WHERE hire_date BETWEEN '13/01/01' AND '13/12/31';

-- 9.
SELECT first_name, hire_date, salary
FROM employees
WHERE hire_date LIKE '13/%';

-- 10.
SELECT first_name, salary
FROM employees
ORDER BY salary DESC;

-- 11.
SELECT first_name, salary
FROM employees
WHERE department_id=60
ORDER BY salary DESC;

-- 12.
SELECT first_name, job_id
FROM employees
WHERE job_id='IT_PROG'
OR job_id='SA_MAN';

-- 13.
SELECT
first_name || ' ' || last_name || ' 사원의 급여는 ' || salary || '달러 입니다.'
FROM employees
WHERE first_name='Steven'
AND last_name='King';

-- 14.
SELECT first_name, job_id
FROM employees
WHERE job_id LIKE '%MAN';

-- 15.
SELECT first_name, job_id
FROM employees
WHERE job_id LIKE '%MAN'
ORDER BY job_id ASC;


-- 함수

SELECT last_name, LOWER(last_name), INITCAP(last_name), UPPER(last_name)
FROM employees;

SELECT last_name, LOWER(last_name), INITCAP(last_name), UPPER(last_name)
FROM employees
WHERE LOWER(last_name)='abel';

SELECT first_name, LENGTH(first_name), INSTR(first_name, 'a')
FROM employees;

SELECT first_name, SUBSTR(first_name, 1, 3), CONCAT(first_name, last_name)
FROM employees;

SELECT RPAD(first_name, 10, '-') AS name,
LPAD(salary, 10, '*') AS sal
FROM employees;

SELECT LTRIM('JavaSpecialist', 'Jav')
FROM dual;

SELECT LTRIM('JavaSpecialist')
FROM dual;

SELECT TRIM('JavaSpecialist')
FROM dual;

SELECT REPLACE('JavaSpecialist', 'Java', 'BigData') 
FROM dual;

SELECT REPLACE('JavaSpecialist', ' ', '') 
FROM dual;

SELECT TRANSLATE('javaspecialist', 
'abcdefghijklmnopqrstuvwxyz', 
'defghijklmnopqrstuvwxyzabc')
FROM dual;

SELECT first_name,
RPAD(SUBSTR(first_name, 1, 3), 
LENGTH(first_name), '*') AS name,
LPAD(salary, 10, '*') AS salary
FROM employees
WHERE LOWER(job_id)='it_prog';

-- 정규표현식
CREATE TABLE test_regexp (col1 VARCHAR2(10));

INSERT INTO test_regexp VALUES('ABCDE01234');
INSERT INTO test_regexp VALUES('01234ABCDE');
INSERT INTO test_regexp VALUES('abcde01234');
INSERT INTO test_regexp VALUES('01234abcde');
INSERT INTO test_regexp VALUES('1-234-5678');
INSERT INTO test_regexp VALUES('234-567890');

SELECT * FROM test_regexp;

SELECT * 
FROM test_regexp
WHERE REGEXP_LIKE(col1, '[0-9][a-z]');

SELECT * 
FROM test_regexp
WHERE REGEXP_LIKE(col1, '[0-9]{3}-[0-9]{4}$');

SELECT * 
FROM test_regexp
WHERE REGEXP_LIKE(col1, '[[:digit:]]{3}-[[:digit:]]{4}$');
