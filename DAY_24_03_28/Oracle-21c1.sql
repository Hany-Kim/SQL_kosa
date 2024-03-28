-- 2.
conn hr/ hr

-- 4.
SELECT empno, ename, sal FROM emp
WHERE deptno=30;

-- 7.
SELECT empno, ename, sal FROM emp
WHERE deptno=30;

-- 8.
UPDATE emp SET sal=sal+500
WHERE empno=115;
-- 5번에서 수행한 작업이 커밋되지 않고 8번작업이 수행되기에 수행되지 않는다.

-- 5번작업 커밋 후 다시 수행해보면
SELECT * FROM emp WHERE empno=115;
-- 값이 업데이트 되었다.

commit;
