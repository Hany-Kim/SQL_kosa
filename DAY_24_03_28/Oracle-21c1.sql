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
-- 5������ ������ �۾��� Ŀ�Ե��� �ʰ� 8���۾��� ����Ǳ⿡ ������� �ʴ´�.

-- 5���۾� Ŀ�� �� �ٽ� �����غ���
SELECT * FROM emp WHERE empno=115;
-- ���� ������Ʈ �Ǿ���.

commit;
