-- 계층형 쿼리
SELECT employee_id,
    LPAD(' ', 3*(LEVEL-1)) || first_name || ' ' || last_name,
    LEVEL
    employees
FROM employees
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id=manager_id;

SELECT employee_id,
    LPAD(' ', 3*(LEVEL-1)) || first_name || ' ' || last_name AS full_name,
    LEVEL
    employees
FROM employees
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id=manager_id
ORDER SIBLINGS BY first_name;

SELECT employee_id,
    LPAD(' ', 3*(LEVEL-1)) || first_name || ' ' || last_name,
    LEVEL
FROM employees
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id=manager_id
ORDER BY first_name;

SELECT employee_id,
    LPAD(' ', 3*(LEVEL-1)) || first_name || ' ' || last_name,
    LEVEL
FROM employees
START WITH employee_id = 113
CONNECT BY PRIOR manager_id=employee_id;

-- DML
CREATE TABLE emp1 AS SELECT * FROM employees;

SELECT COUNT(*) FROM employees;
SELECT COUNT(*) FROM emp1;

DESC departments;

INSERT INTO departments
VALUES (280, 'Data Analytics', null, 1700);

INSERT INTO departments
    (department_id, department_name, location_id)
VALUES
    (280, 'Data Analytics', 1700);
    
SELECT *
    FROM departments
    WHERE department_id=280;
    
CREATE TABLE managers AS
    SELECT employee_id, first_name, job_id, salary, hire_date
    FROM employees
    WHERE 1=2;
    
INSERT INTO managers
    (employee_id, first_name, job_id, salary, hire_date)
    SELECT employee_id, first_name, job_id, salary, hire_date
    FROM employees
    WHERE job_id LIKE '%MAN';
    
CREATE TABLE emps AS SELECT * FROM employees;

ALTER TABLE emps
    ADD (CONSTRAINT emps_emp_id_pk PRIMARY KEY(employee_id),
        CONSTRAINT emps_manager_id_fk FOREIGN KEY(manager_id)
                    REFERENCES emps(employee_id)
);

SELECT employee_id, first_name, salary
FROM emps
WHERE employee_id=103;

UPDATE emps
SET salary=salary*1.1
WHERE employee_id=103;

UPDATE emps
SET (job_id, salary, manager_id) =
    (SELECT job_id, salary, manager_id
    FROM emps
    WHERE employee_id = 108)
WHERE employee_id=109; 

CREATE TABLE emps AS SELECT * FROM employees;

ALTER TABLE emps
ADD (CONSTRAINT emps_emp_id_pk PRIMARY KEY (employee_id),
    CONSTRAINT emps_manager_fk FOREIGN KEY (manager_id)
        REFERENCES emps(employee_id)
);       

DELETE FROM emps
WHERE employee_id=104;

DELETE FROM emps
WHERE employee_id=103;

CREATE TABLE depts AS
SELECT * FROM departments;

DESC depts;

DELETE FROM emps
WHERE department_id=
    (SELECT department_id
    FROM depts
    WHERE department_name='Shipping');
    
VARIABLE emp_name VARCHAR2(50);
VARIABLE emp_sal NUMBER;
VARIABLE;

DELETE emps
WHERE employee_id=109
RETURNING first_name, salary INTO :emp_name, :emp_sal;

PRINT emp_name;

-- merge
CREATE TABLE emps_it AS SELECT * FROM employees WHERE 1=2;

INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES
    (105, 'David', 'Kim', 'DAVIDKIM', '06/03/04', 'IT_PROG');
    
MERGE INTO emps_it a
    USING (SELECT * FROM employees WHERE job_id='IT_PROG') b
    ON (a.employee_id = b.employee_id)
WHEN MATCHED THEN
    UPDATE SET
        a.phone_number = b.phone_number,
        a.hire_date = b.hire_date,
        a.job_id = b.job_id,
        a.salary = b.salary,
        a.commission_pct = b.commission_pct,
        a.manager_id = b.manager_id,
        a.department_id = b.department_id
WHEN NOT MATCHED THEN
    INSERT VALUES
    (b.employee_id, b.first_name, b.last_name, b.email,
    b.phone_number, b.hire_date, b.job_id, b.salary,
    b.commission_pct, b.manager_id, b.department_id);
    
SELECT * FROM emps_it;

-- multipleset
CREATE TABLE emp_salary AS 
    SELECT employee_id, first_name, salary, commission_pct
    FROM employees;
CREATE TABLE emp_hire_date AS 
    SELECT employee_id, first_name, hire_date, department_id
    FROM employees;

INSERT ALL
    INTO emp_salary VALUES
        (employee_id, first_name, salary, commission_pct)
    INTO emp_hire_date VALUES
        (employee_id, first_name, hire_date, department_id)
    SELECT * FROM employees;
    
CREATE TABLE emp_10 AS SELECT * FROM employees WHERE 1=2;
CREATE TABLE emp_20 AS SELECT * FROM employees WHERE 1=2;

INSERT ALL
    WHEN department_id=10 THEN
        INTO emp_10 VALUES
            (employee_id, first_name, last_name, email, phone_number,
            hire_date, job_id, salary, commission_pct, manager_id,
            department_id)
    WHEN department_id=20 THEN
        INTO emp_20 VALUES
            (employee_id, first_name, last_name, email, phone_number,
            hire_date, job_id, salary, commission_pct, manager_id,
            department_id)
    SELECT * FROM employees;

SELECT * FROM emp_10;
SELECT * FROM emp_20;

CREATE TABLE emp_sal5000 AS 
    SELECT employee_id, first_name, salary
    FROM employees;
CREATE TABLE emp_sal10000 AS 
    SELECT employee_id, first_name, salary
    FROM employees;
CREATE TABLE emp_sal15000 AS 
    SELECT employee_id, first_name, salary
    FROM employees;
CREATE TABLE emp_sal20000 AS 
    SELECT employee_id, first_name, salary
    FROM employees;
CREATE TABLE emp_sal25000 AS 
    SELECT employee_id, first_name, salary
    FROM employees;

INSERT FIRST
    WHEN salary <= 5000 THEN
        INTO emp_sal5000 VALUES (employee_id, first_name, salary)
    WHEN salary <= 10000 THEN
        INTO emp_sal10000 VALUES (employee_id, first_name, salary)
    WHEN salary <= 15000 THEN
        INTO emp_sal15000 VALUES (employee_id, first_name, salary)
    WHEN salary <= 20000 THEN
        INTO emp_sal20000 VALUES (employee_id, first_name, salary)
    WHEN salary <= 25000 THEN
        INTO emp_sal15000 VALUES (employee_id, first_name, salary)
    SELECT employee_id, first_name, salary FROM employees;

CREATE TABLE sales_log (
    employee_id     NUMBER(6),
    week_id         NUMBER(2),
    week_day        VARCHAR(10),
    sales           NUMBER(8,2)
);

INSERT ALL
    INTO sales_log
        VALUES(employee_id, week_id, 'SALES_MON', sales_mon)
    INTO sales_log
        VALUES(employee_id, week_id, 'SALES_TUE', sales_tue)
    INTO sales_log
        VALUES(employee_id, week_id, 'SALES_WED', sales_wed)
    INTO sales_log
        VALUES(employee_id, week_id, 'SALES_THU', sales_thu)
    INTO sales_log
        VALUES(employee_id, week_id, 'SALES_FRI', sales_fri)
    SELECT employee_id, week_id, sales_mon, sales_tue,
        sales_wed, sales_thu, sales_fri
    FROM sales;
    
SELECT * FROM sales_log;

-- 트랜잭션
-- 0.
CREATE TABLE emp AS
    SELECT employee_id AS empno, first_name AS
    ename, salary AS sal, department_id AS deptno
    FROM employees;

-- 1.
conn hr/ hr

-- 3.
SELECT empno, ename, sal FROM emp
WHERE deptno=30;

-- 5.
UPDATE emp SET sal=sal*1.1
WHERE deptno=30;

-- 6.
SELECT empno, ename, sal FROM emp
WHERE deptno=30;

-- 9.
COMMIT;
-- 커밋을 해주고 다시 값을 수정해보면

SELECT * FROM emp WHERE empno=115;