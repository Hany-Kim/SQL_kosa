-- 뷰
SELECT * FROM user_sys_privs;

SELECT * FROM user_role_privs;
-- 11g까지 connect role, resource role로 나뉘어 있었지만
-- 이후엔 다줌

SELECT * FROM user_views;
-- text col을 확인하면 쿼리문을 확인할 수 있다.
--"SELECT
--  e.employee_id,
--  e.job_id,
--  e.manager_id,
--  e.department_id,
--  d.location_id,
--  l.country_id,
--  e.first_name,
--  e.last_name,
--  e.salary,
--  e.commission_pct,
--  d.department_name,
--  j.job_title,
--  l.city,
--  l.state_province,
--  c.country_name,
--  r.region_name
--FROM
--  employees e,
--  departments d,
--  jobs j,
--  locations l,
--  countries c,
--  regions r
--WHERE e.department_id = d.department_id
--  AND d.location_id = l.location_id
--  AND l.country_id = c.country_id
--  AND c.region_id = r.region_id
--  AND j.job_id = e.job_id
--WITH READ ONLY";
-- 매우 복잡한 쿼리문이다.
SELECT * FROM emp_details_view;
-- 앞서 매우 복잡한 쿼리를 간단히 사용할 수 있다.

CREATE VIEW emp_view_dept60
    AS SELECT
            employee_id, first_name, last_name, job_id, salary
        FROM
            employees
        WHERE
            department_id=60;
--View EMP_VIEW_DEPT60이(가) 생성되었습니다.
DESC emp_view_dept60;
SELECT * FROM emp_view_dept60;

CREATE VIEW emp_dept60_salary
    AS SELECT
            employee_id AS empno,
            first_name || ' ' || last_name AS name,
            salary AS monthly_salary
        FROM employees
        WHERE department_id=60;
-- View EMP_DEPT60_SALARY이(가) 생성되었습니다.        
DESC emp_dept60_salary;
SELECT * FROM emp_dept60_salary;

CREATE OR REPLACE VIEW emp_dept60_salary
AS SELECT
    employee_id AS empno,
    first_name || ' ' || last_name AS name,
    job_id AS job,
    salary
    FROM employees
    WHERE department_id=60;
    
CREATE VIEW emp_view
AS SELECT
    e.employee_id AS id,
    e.first_name AS name,
    d.department_name AS department,
    j.job_title AS job
    FROM employees e
    LEFT JOIN departments d ON e.department_id = d.department_id
    JOIN jobs j ON e.job_id = j.job_id;
    
DROP VIEW emp_dept60_salary;

CREATE TABLE emps AS SELECT * FROM employees;

CREATE OR REPLACE VIEW emp_dept60
AS SELECT DISTINCT * FROM emps WHERE department_id=60;

CREATE OR REPLACE VIEW emp_dept60
AS SELECT
    employee_id,
    first_name || ', ' || last_name AS name,
    salary*12 AS annual_salary
FROM emps WHERE department_id=60;    

CREATE OR REPLACE VIEW emp_dept60
AS SELECT
    employee_id,
    first_name,
    last_name,
    email,
    salary
FROM emps WHERE department_id=60;  

CREATE OR REPLACE VIEW emp_dept60
AS SELECT
    employee_id, first_name, hire_date, salary, department_id
FROM emps
WHERE department_id=60
WITH CHECK OPTION CONSTRAINT emp_dept60_ck;

UPDATE emp_dept60
SET department_id=10
WHERE employee_id=105;

CREATE OR REPLACE VIEW emp_dept60
AS SELECT
    employee_id, first_name, hire_date, salary, department_id
FROM emps
WHERE department_id=60
WITH READ ONLY;

DELETE FROM emp_dept60
WHERE employee_id=105;

SELECT row_number, first_name, salary
FROM (SELECT first_name, salary,
        row_number() OVER (ORDER BY salary DESC) AS row_number
        FROM employees
        ORDER BY salary DESC)
WHERE row_number BETWEEN 1 AND 10;        

-- 13장 시퀀스, 인덱스, 동의어
SELECT * FROM emps WHERE first_name='David';

CREATE INDEX emps_first_name_idx
ON emps(first_name);

DROP INDEX emps_first_name_idx;

SELECT ic.index_name, ic.column_name,
    ix.uniqueness
FROM USER_INDEXES ix, USER_IND_COLUMNS ic
WHERE ic.index_name = ix.index_name
AND ic.table_name = 'EMPLOYEES';

CREATE BITMAP INDEX emps_comm_idx ON emps(commission_pct);

CREATE UNIQUE INDEX emps_email_idx ON emps(email);

SELECT * FROM emps WHERE email='DLEE';

CREATE INDEX emps_annsal_idx
ON emps(COALESCE(salary+salary*commission_pct, salary));

SELECT *
FROM emps
WHERE COALESCE(salary+salary*commission_pct, salary) > 10000;

CREATE UNIQUE INDEX emps_name_indx
ON emps(first_name, last_name);

SELECT *
FROM emps
WHERE first_name='Peter' AND last_name='Hall';

CREATE SYNONYM emp60
FOR emp_dept60;

DROP SYNONYM emp60;

-- 13장 연습문제
-- 1.
CREATE SEQUENCE BBS_SEQ
    INCREMENT BY 1
    START WITH 1
    CACHE 20;
    
-- 2.
CREATE INDEX idx_emp_realsal
ON  emp(COALESCE(salary + salary * commission_pct, salary));