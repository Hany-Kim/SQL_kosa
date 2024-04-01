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