-- 1.
SELECT employee_id, first_name, hire_date
FROM employees
WHERE employee_id=103;

-- 2.
SELECT COUNT(*) AS "60번 부서 사원의 수"
FROM employees
WHERE department_id=60;

-- 3.
SELECT COUNT(*) AS "총 사원 수"
FROM employees;

-- 4.
SELECT COUNT(*) AS "보너스가 있는 사원의 수"
FROM employees
WHERE commission_pct > 0;

-- 5.
SELECT COUNT(*) AS "보너스가 없는 사원의 수"
FROM employees
WHERE commission_pct IS NULL;

-- 6.
SELECT first_name, department_id, job_id
FROM employees
WHERE department_id=60;

-- 7.
SELECT COUNT(*) AS "80번 부서 사원의 수"
FROM employees
WHERE department_id=80;

-- 8.
SELECT ROUND(AVG(salary), 2) AS "모든 사원의 급여 평균"
FROM employees;

-- 9.
SELECT salary + (salary * nvl(commission_pct, 0)) AS "103번 사원의 보너스를 포함한 급여"
FROM employees
WHERE employee_id=103;

-- 10.
SELECT first_name, salary * 1.1 AS "10%인상된 급여"
FROM employees
WHERE department_id=60;

-- 11.
-- 0명
SELECT COUNT(*) AS "03년도 입사자"
FROM employees
WHERE hire_date LIKE '03/%';
-- 6명
SELECT COUNT(*) AS "13년도 입사자"
FROM employees
WHERE hire_date LIKE '13/%';

-- 12.
SELECT COUNT(*) AS "직무아이디가 IT_PROG나 SA_MAN인 사원 수"
FROM employees
WHERE job_id IN('IT_PROG', 'SA_MAN');

-- 13.
SELECT COUNT(*) AS "매니저 직무(MAN 또는 MGR)에 해당하는 사원 수"
FROM employees
WHERE 
    job_id LIKE '%MAN%'
    OR
    job_id LIKE '%MGR%';

-- 14.
SELECT COUNT(*) AS "80번 부서에서 직무가 SA_MAN인 사원과 20번 부서에서 매니저 아이디가 100인 사원 수"
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
-- 입사일이 01/01/13 -> 1000일 후 -> 03/10/10
SELECT TO_DATE('20010113','YYYYMMDD') + 1000 AS "입사한지 1000일째 되는 날"
FROM employees
WHERE first_name='Lex';
-- LEX 입사일 -> 1000일 후 -> 13/10/09
SELECT hire_date + 1000 AS "입사한지 1000일째 되는 날"
FROM employees
WHERE first_name='Lex';

-- 16.
SELECT COUNT(*) AS "6월에 입사한 사원 수"
FROM employees
WHERE 
    hire_date LIKE '%/06/%';
    
-- 17.
SELECT department_id, COUNT(*) AS "사원 수"
FROM employees
GROUP BY department_id;

-- 18.
SELECT department_id, COUNT(*) AS "사원 수"
FROM employees
GROUP BY department_id
HAVING COUNT(*) >= 4;

-- 19.
SELECT job_id, COUNT(*) AS "50번부서의 직무별 사원 수"
FROM employees
WHERE department_id=50
GROUP BY job_id;

-- 20.
SELECT MIN(salary) AS "가장 작은 급여"
FROM employees;

-- 21.
SELECT COUNT(DISTINCT manager_id) AS "관리자 사원 수"
FROM employees;

-- 22.
SELECT COUNT(*) AS "매니저가 없는 사원 수"
FROM employees
WHERE manager_id IS NULL;

-- 23.
SELECT COUNT(*) AS "이름이 John인 사원 수"
FROM employees
WHERE first_name='John';

-- 24.
SELECT first_name AS "30번 부서의 가장 최근 입사자 순", hire_date
FROM employees
WHERE department_id=30
ORDER BY hire_date DESC;

-- 25.
SELECT COUNT(*) AS "급여 10000이상 사원의 수"
FROM employees
WHERE salary>=10000;

-- 26.
SELECT SYSDATE 
FROM dual;

-- 27.
SELECT TO_CHAR(salary, '$09,000') AS "103번 사원의 급여"
FROM employees
WHERE employee_id=103;

-- 28.
SELECT ROUND(AVG(salary * nvl(commission_pct, 0)), 2) AS "모든 사원의 보너스 평균"
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
SELECT COUNT(DISTINCT department_id) AS "매니저가 있는 부서의 수"
FROM employees
WHERE manager_id IS NOT NULL;

-- 35.
SELECT COUNT(DISTINCT department_id) AS "사원들이 근무하는 부서의 수"
FROM employees;

-- 36.
SELECT first_name, hire_date
FROM employees
WHERE 
    job_id='SH_CLERK'
    AND
    salary<3000;
    
-- 37.
-- xxx.xxx.xxxx에 해당하는 전화번호 없음
-- xx.xxxx.xxxxxx or x.xxx.xxx.xxxx 뿐임
-- xx.xxxx.xxxxxx 인경우 => 35
SELECT COUNT(*)
FROM employees
WHERE phone_number LIKE '__.____.______';
-- x.xxx.xxx.xxxx 인경우 => 72
SELECT COUNT(*)
FROM employees
WHERE phone_number LIKE '_.___.___.____';


-- 38.
SELECT department_id
FROM departments
WHERE department_name='Sales';

-- 39.
-- David Austin 없음
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
-- 05/06년도 입사자 수 0명
SELECT COUNT(*) AS "05/06년도 입사자 수"
FROM employees
WHERE hire_date
    BETWEEN
        '05/01/01'
        AND
        '06/12/31';
-- 15/16년도 입사자 수 0명
SELECT COUNT(*) AS "15/16년도 입사자 수"
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
SELECT COUNT(*) AS "매니저가 없는 사원을 매니저로 둔 사원 수"
FROM employees
WHERE manager_id=
    (SELECT employee_id
    FROM employees
    WHERE manager_id IS NULL);
    
-- 45.
SELECT COUNT(*) AS "'IT_PROG'직무 사원의 급여 평균보다 낮은 급여를 받는 사원 수"
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