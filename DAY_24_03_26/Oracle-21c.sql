SELECT * FROM employees;

SELECT ROUND(45.923,2),
ROUND(45.923,0),
ROUND(45.923,-1)
FROM dual;

SELECT TRUNC(45.923,2),
TRUNC(45.923),
TRUNC(45.923,-1)
FROM dual;

SELECT SYSDATE
FROM DUAL;

SELECT SYSTIMESTAMP
FROM DUAL;

SELECT first_name,
(SYSDATE - hire_date)/7 AS "Weeks"
FROM employees
WHERE department_id=60;

SELECT first_name, SYSDATE, hire_date,
MONTHS_BETWEEN(SYSDATE, hire_date) AS workmonth
FROM employees
WHERE first_name='Diana';

SELECT first_name, hire_date,
ADD_MONTHS(hire_date, 100)
FROM employees
WHERE first_name='Diana';

SELECT SYSDATE, NEXT_DAY(SYSDATE, '��')
FROM dual;

SELECT SYSDATE, ROUND(SYSDATE),
TRUNC(SYSDATE)
FROM dual;

SELECT TRUNC(SYSDATE, 'Month')
FROM dual;

SELECT TRUNC(SYSDATE, 'Year')
FROM dual;

SELECT ROUND(TO_DATE('17/03/16'), 'Month')
FROM dual;

SELECT TRUNC(TO_DATE('17/03/16'), 'Month')
FROM dual;

SELECT '5000' - 4000 FROM dual;
SELECT '5,000' - 4000 FROM dual;

SELECT salary + (salary * NVL(commission_pct,0))
FROM employees;

SELECT first_name,
TO_CHAR(hire_date, 'MM/YY') AS Month_Hired
FROM employees
WHERE first_name='Steven';

SELECT first_name,
TO_CHAR(hire_date, 'YYYY"��" MM"��" DD"��"') HIREDATE
FROM employees;

SELECT first_name,
TO_CHAR(hire_date,
'fmDdspth "of" Month YYYY fmHH:MI:SS AM',
'NLS_DATE_LANGUAGE=english') AS HIREDATE
FROM employees;

SELECT first_name, last_name,
TO_CHAR(salary, '$999,999') SALARY
FROM employees
WHERE first_name='David';

SELECT TO_CHAR(2000000, '$999,999') SALARY
FROM dual;

SELECT first_name, last_name,
salary*0.123456 SALARY1,
TO_CHAR(salary*0.123456, '$999,999.99') SALARY2
FROM employees
WHERE first_name='David';

SELECT '$5,500.00' - 4000
FROM dual;

SELECT to_number('$5,500.00', '$99,999.99') - 4000
FROM dual;

SELECT first_name, hire_date
FROM employees
WHERE hire_date=TO_DATE('2013/06/17', 'YYYY/MM/DD');

SELECT first_name,
salary + salary * NVL(commission_pct, 0) AS ann_sal
FROM employees;

SELECT first_name,
NVL2(commission_pct, salary+(salary*commission_pct), salary) ann_sal
FROM employees;

SELECT first_name,
COALESCE(salary + (salary*commission_pct), salary) AS ann_sal
FROM employees;

SELECT first_name, COALESCE(salary * commission_pct, 0) AS bonus
FROM employees
WHERE LNNVL(salary*commission_pct >= 650);

SELECT job_id, salary,
DECODE(job_id, 'IT_PROG', salary*1.10,
'FI_MGR', salary*1.15,
'FI_ACCOUNT', salary*1.20, salary)
AS revised_salary
FROM employees;

SELECT job_id, salary,
CASE job_id WHEN 'IT_PROG' THEN salary*1.10
WHEN 'FI_MGR' THEN salary*1.15
WHEN 'FI_ACCOUNT' THEN salary*1.20
ELSE salary
END AS REVISED_SALARY
FROM employees;

SELECT job_id, salary,
CASE WHEN job_id='IT_PROG' THEN salary*1.10
WHEN job_id='FI_MGR' THEN salary*1.15
WHEN job_id='FI_ACCOUNT' THEN salary*1.20
ELSE salary
END AS revised_salary
FROM employees;

SELECT
TO_CHAR(LAST_DAY(TO_DATE('01', 'MM')), 'dd') AS "1",
TO_CHAR(LAST_DAY(TO_DATE('02', 'MM')), 'dd') AS "2",
TO_CHAR(LAST_DAY(TO_DATE('03', 'MM')), 'dd') AS "3",
TO_CHAR(LAST_DAY(TO_DATE('04', 'MM')), 'dd') AS "4",
TO_CHAR(LAST_DAY(TO_DATE('05', 'MM')), 'dd') AS "5",
TO_CHAR(LAST_DAY(TO_DATE('06', 'MM')), 'dd') AS "6",
TO_CHAR(LAST_DAY(TO_DATE('07', 'MM')), 'dd') AS "7",
TO_CHAR(LAST_DAY(TO_DATE('08', 'MM')), 'dd') AS "8",
TO_CHAR(LAST_DAY(TO_DATE('09', 'MM')), 'dd') AS "9",
TO_CHAR(LAST_DAY(TO_DATE('10', 'MM')), 'dd') AS "10",
TO_CHAR(LAST_DAY(TO_DATE('11', 'MM')), 'dd') AS "11",
TO_CHAR(LAST_DAY(TO_DATE('12', 'MM')), 'dd') AS "12"
FROM dual;

SELECT employee_id, first_name, department_id || ''
FROM employees
WHERE department_id=10
UNION
SELECT employee_id, first_name, job_id
FROM employees
WHERE job_id='IT_PROG';

SELECT employee_id, first_name
FROM employees
WHERE hire_date LIKE '14%'
UNION
SELECT employee_id, first_name
FROM employees
WHERE department_id=20;

SELECT employee_id, first_name
FROM employees
WHERE hire_date LIKE '14%'
UNION ALL
SELECT employee_id, first_name
FROM employees
WHERE department_id=20;

SELECT employee_id, first_name
FROM employees
WHERE hire_date LIKE '14%'
INTERSECT
SELECT employee_id, first_name
FROM employees
WHERE department_id=20;

SELECT employee_id, first_name
FROM employees
WHERE hire_date LIKE '14%'
MINUS
SELECT employee_id, first_name
FROM employees
WHERE department_id=20;

SELECT department_id, job_id, round(avg(salary), 2)
FROM employees
GROUP BY department_id, job_id;

SELECT TO_CHAR(department_id), round(avg(salary), 2)
FROM employees
GROUP BY department_id
UNION ALL
SELECT job_id, round(avg(salary), 2)
FROM employees
GROUP BY job_id;

SELECT AVG(salary), MAX(salary), MIN(salary), SUM(salary)
FROM employees
WHERE job_id LIKE 'SA%';

SELECT MIN(hire_date), MAX(hire_date)
FROM employees;

SELECT MIN(first_name), MAX(last_name)
FROM employees;

SELECT MAX(salary)
FROM employees;

SELECT COUNT(*) FROM employees;

SELECT COUNT(commission_pct)
FROM employees;

SELECT SUM(salary) AS �հ�,
ROUND(AVG(salary), 2) AS ���,
ROUND(STDDEV(salary), 2) AS ǥ������,
ROUND(VARIANCE(salary), 2) AS �л�
FROM employees;

SELECT ROUND(AVG(salary*commission_pct),2) AS avg_bonus
FROM employees;

SELECT
ROUND(SUM(salary*commission_pct), 2) AS sum_bonus,
COUNT(*) count,
ROUND(AVG(salary*commission_pct), 2) AS avg_bonus1,
ROUND(SUM(salary*commission_pct)/count(*), 2) AS avg_bonus2
FROM employees;

SELECT AVG(NVL(salary*commission_pct,0))
FROM employees;

SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id;

SELECT department_id, job_id, SUM(salary)
FROM employees
GROUP BY department_id, job_id;

SELECT department_id, COUNT(first_name)
FROM employees;

SELECT department_id, AVG(salary)
FROM employees
WHERE AVG(salary) > 2000
GROUP BY department_id;

SELECT department_id, ROUND(AVG(salary), 2)
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 8000;

SELECT job_id, AVG(salary) PAYROLL
FROM employees
WHERE job_id NOT LIKE 'SA%'
GROUP BY job_id
HAVING AVG(salary) > 8000
ORDER BY AVG(salary);

SELECT department_id, job_id, ROUND(AVG(salary), 2)
FROM employees
GROUP BY GROUPING SETS (department_id, job_id)
ORDER BY department_id, job_id;

SELECT department_id, job_id, manager_id,
ROUND(AVG(salary), 2) AS avg_sal
FROM employees
GROUP BY
GROUPING SETS ((department_id, job_id),
(job_id, manager_id))
ORDER BY department_id, job_id, manager_id;

SELECT department_id, job_id, ROUND(AVG(salary), 2), COUNT(*)
FROM employees
GROUP BY ROLLUP(department_id, job_id)
ORDER BY department_id, job_id;

SELECT department_id, job_id, ROUND(AVG(salary), 2), COUNT(*)
FROM employees
GROUP BY CUBE(department_id, job_id)
ORDER BY department_id, job_id;

SELECT
    DECODE(GROUPING(department_id), 1, '�Ұ�',
            TO_CHAR(department_id)) AS �μ�,
    DECODE(GROUPING(job_id), 1, '�Ұ�', job_id) AS ����,
    ROUND(AVG(salary), 2) AS ���,
    COUNT(*) AS ����Ǽ� 
FROM employees
GROUP BY CUBE(department_id, job_id)
ORDER BY �μ�, ����;

SELECT
    DECODE(GROUPING_ID(department_id, job_id),
            2, '�Ұ�', 3, '�հ�',
            TO_CHAR(department_id)) AS �μ���ȣ,
    DECODE(GROUPING_ID(department_id, job_id), 
            1, '�Ұ�', 3, '�հ�',
            job_id) AS ����,
    GROUPING_ID(department_id, job_id) AS GID,
    ROUND(AVG(salary), 2) AS ���,
    COUNT(*) AS ����Ǽ�
FROM
    employees
GROUP BY CUBE(department_id, job_id)
ORDER BY �μ���ȣ, ����;
    