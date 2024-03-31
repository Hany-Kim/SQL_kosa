-- 1.
SELECT employee_id, first_name, hire_date
FROM employees
WHERE employee_id=103;

-- 2.
SELECT COUNT(*) AS "60�� �μ� ����� ��"
FROM employees
WHERE department_id=60;

-- 3.
SELECT COUNT(*) AS "�� ��� ��"
FROM employees;

-- 4.
SELECT COUNT(*) AS "���ʽ��� �ִ� ����� ��"
FROM employees
WHERE commission_pct > 0;

-- 5.
SELECT COUNT(*) AS "���ʽ��� ���� ����� ��"
FROM employees
WHERE commission_pct IS NULL;

-- 6.
SELECT first_name, department_id, job_id
FROM employees
WHERE department_id=60;

-- 7.
SELECT COUNT(*) AS "80�� �μ� ����� ��"
FROM employees
WHERE department_id=80;

-- 8.
SELECT ROUND(AVG(salary), 2) AS "��� ����� �޿� ���"
FROM employees;

-- 9.
SELECT salary + (salary * nvl(commission_pct, 0)) AS "103�� ����� ���ʽ��� ������ �޿�"
FROM employees
WHERE employee_id=103;

-- 10.
SELECT first_name, salary * 1.1 AS "10%�λ�� �޿�"
FROM employees
WHERE department_id=60;

-- 11.
-- 0��
SELECT COUNT(*) AS "03�⵵ �Ի���"
FROM employees
WHERE hire_date LIKE '03/%';
-- 6��
SELECT COUNT(*) AS "13�⵵ �Ի���"
FROM employees
WHERE hire_date LIKE '13/%';

-- 12.
SELECT COUNT(*) AS "�������̵� IT_PROG�� SA_MAN�� ��� ��"
FROM employees
WHERE job_id IN('IT_PROG', 'SA_MAN');

-- 13.
SELECT COUNT(*) AS "�Ŵ��� ����(MAN �Ǵ� MGR)�� �ش��ϴ� ��� ��"
FROM employees
WHERE 
    job_id LIKE '%MAN%'
    OR
    job_id LIKE '%MGR%';

-- 14.
SELECT COUNT(*) AS "80�� �μ����� ������ SA_MAN�� ����� 20�� �μ����� �Ŵ��� ���̵� 100�� ��� ��"
FROM employees
WHERE (
    department_id=80
    AND
    job_id='SA_MAN')
    OR (
    department_id=20
    AND
    manager_id=100);
    
-- 15.
-- �Ի����� 01/01/13 -> 1000�� �� -> 03/10/10
SELECT TO_DATE('20010113','YYYYMMDD') + 1000 AS "�Ի����� 1000��° �Ǵ� ��"
FROM employees
WHERE first_name='Lex';
-- LEX �Ի��� -> 1000�� �� -> 13/10/09
SELECT hire_date + 1000 AS "�Ի����� 1000��° �Ǵ� ��"
FROM employees
WHERE first_name='Lex';

-- 16.
SELECT COUNT(*) AS "6���� �Ի��� ��� ��"
FROM employees
WHERE 
    hire_date LIKE '%/06/%';
    
-- 17.
SELECT department_id, COUNT(*) AS "��� ��"
FROM employees
GROUP BY department_id;

-- 18.
SELECT department_id, COUNT(*) AS "��� ��"
FROM employees
GROUP BY department_id
HAVING COUNT(*) >= 4;

-- 19.
SELECT job_id, COUNT(*) AS "50���μ��� ������ ��� ��"
FROM employees
WHERE department_id=50
GROUP BY job_id;

-- 20.
SELECT MIN(salary) AS "���� ���� �޿�"
FROM employees;

-- 21.
SELECT COUNT(DISTINCT manager_id) AS "������ ��� ��"
FROM employees;

-- 22.
SELECT COUNT(*) AS "�Ŵ����� ���� ��� ��"
FROM employees
WHERE manager_id IS NULL;

-- 23.
SELECT COUNT(*) AS "�̸��� John�� ��� ��"
FROM employees
WHERE first_name='John';

-- 24.
SELECT first_name AS "30�� �μ��� ���� �ֱ� �Ի��� ��", hire_date
FROM employees
WHERE department_id=30
ORDER BY hire_date DESC;

-- 25.
SELECT COUNT(*) AS "�޿� 10000�̻� ����� ��"
FROM employees
WHERE salary>=10000;

-- 26.
SELECT SYSDATE 
FROM dual;

-- 27.
SELECT TO_CHAR(salary, '$09,000') AS "103�� ����� �޿�"
FROM employees
WHERE employee_id=103;

-- 28.
SELECT ROUND(AVG(salary * nvl(commission_pct, 0)), 2) AS "��� ����� ���ʽ� ���"
FROM employees;

-- 29.
SELECT first_name, hire_date, job_id
FROM employees
WHERE 
    hire_date LIKE '%/05/%'
    AND
    job_id LIKE '%MAN';
    
-- 30.
SELECT RPAD(first_name, 3, ' ')
FROM employees
WHERE job_id='IT_PROG'
ORDER BY first_name ASC;

-- 31.
SELECT COUNT(*)
FROM employees
WHERE salary
    BETWEEN 
        5000
        AND
        10000;

-- 32.
SELECT DISTINCT job_id
FROM employees
WHERE manager_id=108;

-- 33.
SELECT first_name, job_id, salary
FROM employees
WHERE department_id=10;

-- 34.
SELECT COUNT(DISTINCT department_id) AS "�Ŵ����� �ִ� �μ��� ��"
FROM employees
WHERE manager_id IS NOT NULL;

-- 35.
SELECT COUNT(DISTINCT department_id) AS "������� �ٹ��ϴ� �μ��� ��"
FROM employees;

-- 36.
SELECT first_name, hire_date
FROM employees
WHERE 
    job_id='SH_CLERK'
    AND
    salary<3000;
    
-- 37.
-- xxx.xxx.xxxx�� �ش��ϴ� ��ȭ��ȣ ����
-- xx.xxxx.xxxxxx or x.xxx.xxx.xxxx ����
-- xx.xxxx.xxxxxx �ΰ�� => 35
SELECT COUNT(*)
FROM employees
WHERE phone_number LIKE '__.____.______';
-- x.xxx.xxx.xxxx �ΰ�� => 72
SELECT COUNT(*)
FROM employees
WHERE phone_number LIKE '_.___.___.____';


-- 38.
SELECT department_id
FROM departments
WHERE department_name='Sales';

-- 39.
-- David Austin ����
SELECT email
FROM employees
WHERE 
    first_name='David'
    AND
    last_name='Austin';
    
SELECT email
FROM employees
WHERE 
    first_name='David'
    AND
    last_name='Lee';

-- 40.
-- 05/06�⵵ �Ի��� �� 0��
SELECT COUNT(*) AS "05/06�⵵ �Ի��� ��"
FROM employees
WHERE hire_date
    BETWEEN
        '05/01/01'
        AND
        '06/12/31';
-- 15/16�⵵ �Ի��� �� 0��
SELECT COUNT(*) AS "15/16�⵵ �Ի��� ��"
FROM employees
WHERE hire_date
    BETWEEN
        '15/01/01'
        AND
        '16/12/31';
        
-- 41.
SELECT employee_id, first_name, hire_date
FROM employees
WHERE department_id IS NULL;

-- 42.
SELECT first_name, hire_date
FROM employees
WHERE hire_date=
    (SELECT MAX(hire_date) 
    FROM employees);
    
-- 43.
SELECT first_name, hire_date
FROM employees
WHERE hire_date=
    (SELECT MIN(hire_date)
    FROM employees);
    
-- 44.
SELECT COUNT(*) AS "�Ŵ����� ���� ����� �Ŵ����� �� ��� ��"
FROM employees
WHERE manager_id=
    (SELECT employee_id
    FROM employees
    WHERE manager_id IS NULL);
    
-- 45.
SELECT COUNT(*) AS "'IT_PROG'���� ����� �޿� ��պ��� ���� �޿��� �޴� ��� ��"
FROM employees
WHERE salary<
    (SELECT AVG(salary)
    FROM employees
    WHERE job_id='IT_PROG');
    
-- 46.
SELECT l.city
FROM locations l INNER JOIN departments d
ON l.location_id=d.location_id
WHERE d.department_name LIKE 'IT';

-- 47.
SELECT DISTINCT pe.first_name
FROM employees pe
    INNER JOIN employees ce
    INNER JOIN departments d
    ON ce.department_id=d.department_id
    ON pe.employee_id=ce.manager_id
WHERE d.department_name='IT'
    AND pe.department_id=ce.department_id;    

-- 48.
SELECT pe.first_name
FROM employees ce 
INNER JOIN employees pe
ON ce.manager_id=pe.employee_id
WHERE ce.employee_id=104;

-- 49.
SELECT first_name
FROM employees
WHERE salary=
    (SELECT MIN(salary)
    FROM employees);
    
-- 50.
SELECT e.employee_id, e.first_name, e.department_id
FROM employees e 
INNER JOIN departments d
ON e.department_id=d.department_id
WHERE d.department_name='IT';