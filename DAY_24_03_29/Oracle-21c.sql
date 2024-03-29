-- ������ ������ ����
-- ���̺� �����ϱ�
CREATE TABLE dept (
    deptno  NUMBER(2),
    dname   VARCHAR2(14),
    loc     VARCHAR2(13) );
    
CREATE TABLE emp (
    empno   number(4,0),
    ename   varchar2(10),
    job     varchar2(9),
    mgr     number(4,0),
    hiredate    date,
    sal     number(7,2),
    comm    number(7,2),
    deptno  number(2,0)
);

-- Ȯ��
desc dept;
desc emp;

--����
CREATE TABLE emp2 AS SELECT * FROM employees;
SELECT COUNT(*) FROM emp2;


-- ���̺� ���� ����
CREATE TABLE emp_dept50
    AS
        SELECT employee_id, first_name, salary*12 AS ann_sal, hire_date
        FROM employees
        WHERE department_id=50;

ALTER TABLE emp_dept50
ADD (job VARCHAR2(10));

ALTER TABLE emp_dept50
MODIFY (first_name VARCHAR2(30));

ALTER TABLE emp_dept50
MODIFY (first_name VARCHAR2(10));

ALTER TABLE emp_dept50
DROP COLUMN job;

DESC emp_dept50;

ALTER TABLE emp_dept50
RENAME COLUMN job TO job_id;

DESC emp_dept50;

ALTER TABLE emp_dept50 SET UNUSED (first_name);

DESC emp_dept50;

ALTER TABLE emp_dept50 DROP UNUSED COLUMNS;

DESC emp_dept50;

-- ���̺� ����
CREATE TABLE employees_dept50
    AS
        SELECT employee_id, first_name, salary*12 AS ann_sal, hire_date
        FROM employees
        WHERE department_id=50;

-- �����Ǳ������� ��ȸ����
DESC employees_dept50;        

DROP TABLE employees_dept50;

-- �����Ǹ� ����
DESC employees_dept50;        

-- ���̺� ����
-- ��ȸ
SELECT * FROM emp2;

TRUNCATE TABLE emp2;

-- ������ �߸�
SELECT * FROM emp2;

-- ��������
-- 1.
CREATE TABLE member (
    id   varchar2(15),
    name   varchar2(20),
    password     varchar2(20),
    phone_number     varchar2(15),
    email    varchar2(100)
);

-- 2.
INSERT INTO member
VALUES ('user123','�����','a1234567890','011-234-5678','user@user.com');

SELECT * FROM member;

-- 3.
SELECT * FROM member WHERE id='user123';

-- 4.
UPDATE member
SET name='ȫ�浿', 
    password='a1234', 
    phone_number='011-222-3333', 
    email='user@user.co.kr'
WHERE id='user123';    

SELECT * FROM member WHERE id='user123';

-- 5.
DELETE member
WHERE id='user123'
    AND password='a1234';

SELECT * FROM member 
WHERE id='user123'
    AND password='a1234';
    
-- 6.
INSERT INTO member
VALUES ('user123','�����','a1234567890','011-234-5678','user@user.com');

SELECT * FROM member;

TRUNCATE TABLE member;

SELECT * FROM member;

-- 7.
DESC member;

DROP TABLE member;

DESC member;

COMMIT;

-- ����
-- 1.
DROP TABLE emp;

-- 2.
CREATE TABLE emp 
    AS 
        SELECT * 
        FROM employees;

-- 3.
SELECT * 
FROM emp
WHERE department_id=60;

-- 4.
DELETE emp
WHERE department_id=60;

-- 5.
SAVEPOINT A;

-- 6.
SELECT * FROM emp WHERE job_id='SA_MAN';
UPDATE emp
SET salary=salary+salary*0.1 --salary*1.1
WHERE job_id='SA_MAN';

-- 7.
ROLLBACK TO A;
-- �Ǵ�
ROLLBACK;

-- 8.
ROLLBACK;

-- 9.
SELECT COUNT(*) FROM emp;

-- 10.
SELECT * FROM emp WHERE job_id='IT_PROG';
UPDATE emp
SET salary=salary+salary*0.2 -- salary*1.2
WHERE job_id='IT_PROG';

-- 11.
SELECT first_name, job_id, hire_date, salary 
FROM emp
WHERE salary>=15000;

-- 12.
COMMIT;

-- DDL����
-- 1.
CREATE TABLE customer (
    cust_id   varchar2(20),
    cust_name   varchar2(20),
    age     NUMBER(3),
    email    varchar2(20)
);

-- 2.
INSERT INTO customer
VALUES('user','ȫ�浿',20,'hong@hong.com');

-- 3.
ALTER TABLE customer
ADD (address VARCHAR2(100));

-- 4.
ALTER TABLE customer
MODIFY (email VARCHAR2(50));

DESC customer;

-- �ý��ۿ��� �����ϴ� ��� ���̺� ������ ��ȸ�ϴ� ���
SELECT * FROM user_constraints;

-- ���� ����
CREATE TABLE emp4 (
    empno   NUMBER(4)   CONSTRAINT  emp4_empno_pk   PRIMARY KEY,
    ename   VARCHAR2(10)    NOT NULL,
    sal     NUMBER(7,2) CONSTRAINT  emp4_sal_ch     CHECK(sal<=10000),
    deptno  NUMBER(2)   CONSTRAINT  emp4_deptno_dept_deptid_fk
                        REFERENCES  departments(department_id)
);

CREATE TABLE emp5 (
    empno   NUMBER(4),
    ename   VARCHAR2(10) NOT NULL,
    sal     NUMBER(7,2),
    deptno  NUMBER(2),
    CONSTRAINT  emp5_empno_pk   PRIMARY KEY (empno),
    CONSTRAINT  emp5_sal_ck     CHECK(sal<=10000),
    CONSTRAINT  emp5_deptno_dept_deptid_fk
        FOREIGN KEY (deptno) REFERENCES departments(department_id)
);

ALTER TABLE emp5 DISABLE CONSTRAINT emp5_sal_ck;

SELECT * FROM emp5;
ALTER TABLE emp5
ADD (nickname VARCHAR2(10));

INSERT INTO emp5 VALUES (9999, 'KING', 20000, 10, 'KING');

ALTER TABLE emp5
ENABLE VALIDATE CONSTRAINT emp5_sal_ck;

ALTER TABLE emp5
ENABLE NOVALIDATE CONSTRAINT emp5_sal_ck;

-- �Խñ��� ������ �� �ִ� ���̺� �ۼ�
-- �ۼ���, ����, ��¥/�ð�,  ����, ��ȸ��, ��й�ȣ, ���α۹�ȣ, �۹�ȣ
-- �۹�ȣ,    �ۼ���,         ����,             ����,         ��й�ȣ,       ��¥/�ð�,  ��ȸ��,    ���α۹�ȣ
-- ����,      ����,          ����,             ����,           ����,        ��¥/�ð�,    ����,      ����
-- NUMBER, VARCHAR2(50), VARCHAR2(1000), VARCHAR2(4000), VARCHAR2(30), timestamp, NUMBER(6), NUMBER
-- PK : �۹�ȣ, UK : . , CK : . , FK: ���α۹�ȣ->�۹�ȣ
-- NN : �۹�ȣ, �ۼ���, ����, ��й�ȣ, ��¥/�ð�

CREATE TABLE board (
    bid         NUMBER          PRIMARY KEY,
    writer      VARCHAR2(50)    NOT NULL,
    title       VARCHAR2(1000)  NOT NULL,
    contents    VARCHAR2(4000),
    password    VARCHAR2(30),
    writedate   TIMESTAMP,
    readcount   NUMBER(6)       DEFAULT 0,
    master_bid  NUMBER,
        CONSTRAINT bid_master_bid_fk FOREIGN KEY (master_bid) 
        REFERENCES board(bid)
);

-- �Խñ� �ۼ�
INSERT INTO board
    (bid, writer, title, contents, password, writedate, readcount, master_bid)
VALUES
    ((SELECT nvl(MAX(bid),0) + 1 FROM board) -- <- ���������� bid���� �ڵ����� �����ϰԲ� ����, ��ü bid�� �ִ밪 + 1, ������ �ۼ��� ���� ���ٸ� null�� �����⿡ null�� 0���� ��ȯ����
    , '������1', '00�Խ��� ����1', '�ۼ� ����1', '0000', systimestamp, 0, null);

SELECT * FROM board;



-- �Խñ� ��ȸ
    -- ��ȸ�� �Խ����� ��Ͽ��� ������, �ش� �Խñ��� bid�Է� �� ���� bid�� �Խ����� ã��
SELECT bid, writer, title, contents, writedate FROM board
WHERE bid=&board_id; -- <-- &������ : ��ȸ�� ���� | &&:������ : ������ ����ִ� ���� �����Ǵ� ����

    -- ��ȸ�� ī��Ʈ
UPDATE board
SET readcount=readcount+1
WHERE bid=&board_id;

    -- ������Ʈ �� �ٷ� commit
COMMIT;

    -- Ȯ��
SELECT * FROM board
WHERE bid=&board_id;




-- �Խñ� ����
    -- ������ bid�Է� �� ���� bid�� �Խ����� ã��
SELECT * FROM board
WHERE bid=&delete_bid;

    -- ����
DELETE board
WHERE 
        bid=&delete_bid
    AND 
        password=&pass;

COMMIT;

    -- Ȯ��
SELECT * FROM board
WHERE bid=&delete_bid;

SELECT * FROM board;



-- �Խñ� ����
    -- ������ bid�Է� �� ���� bid�� �Խ����� ã��
    -- ��й�ȣ �����ϰ�
    -- �����ϱ�
UPDATE board
SET bid=bid,
    writer=writer,
    title=title,
    contents=&input_contents,
    password=password,
    writedate=systimestamp,
    readcount=readcount,
    master_bid=master_bid
WHERE
        bid=&update_board_id
    AND 
        password=&pass;

    -- Ȯ��
SELECT * FROM board
WHERE bid=&board_id;
COMMIT;

-- ÷������