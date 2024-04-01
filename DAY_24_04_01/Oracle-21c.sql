-- ��
SELECT * FROM user_sys_privs;

SELECT * FROM user_role_privs;
-- 11g���� connect role, resource role�� ������ �־�����
-- ���Ŀ� ����

SELECT * FROM user_views;
-- text col�� Ȯ���ϸ� �������� Ȯ���� �� �ִ�.
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
-- �ſ� ������ �������̴�.
SELECT * FROM emp_details_view;
-- �ռ� �ſ� ������ ������ ������ ����� �� �ִ�.

CREATE VIEW emp_view_dept60
    AS SELECT
            employee_id, first_name, last_name, job_id, salary
        FROM
            employees
        WHERE
            department_id=60;
--View EMP_VIEW_DEPT60��(��) �����Ǿ����ϴ�.
DESC emp_view_dept60;
SELECT * FROM emp_view_dept60;

CREATE VIEW emp_dept60_salary
    AS SELECT
            employee_id AS empno,
            first_name || ' ' || last_name AS name,
            salary AS monthly_salary
        FROM employees
        WHERE department_id=60;
-- View EMP_DEPT60_SALARY��(��) �����Ǿ����ϴ�.        
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