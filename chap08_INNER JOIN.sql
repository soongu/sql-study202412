-- JOIN ON (ANSI ǥ�� ����)
-- 1. FROM�� ��, WHERE �� ��
-- 2. JOIN Ű���� �ڿ��� ������ ���̺���� ���
-- 3. ON Ű���� �ڿ��� ���� ������ ���
-- 4. ���� ���� ������(ON��) �Ϲ� ���� ������ (WHERE��)�� �и��ؼ� �ۼ��ϴ� ���
-- 5. ON���� �̿��ϸ� JOIN ������ �������̳� ���������� ���� �߰� ������ ����


SELECT 
    E.emp_no
    , E.emp_nm
    , E.addr
    , E.dept_cd
    , D.dept_nm
FROM tb_emp E, tb_dept D
WHERE E.dept_cd = D.dept_cd
    AND E.addr LIKE '%����%'
    AND E.emp_nm LIKE '��%'
;

SELECT 
    E.emp_no
    , E.emp_nm
    , E.addr
    , E.dept_cd
    , D.dept_nm
FROM tb_emp E 
JOIN tb_dept D
ON E.dept_cd = D.dept_cd
WHERE E.addr LIKE '%����%'
    AND E.emp_nm LIKE '��%'
;


SELECT 
    E.emp_no
    , E.emp_nm
    , D.dept_nm
    , EC.certi_cd
    , C.certi_nm
    , C.issue_insti_nm
    , EC.acqu_de
FROM tb_emp_certi EC 
INNER JOIN tb_emp E 
ON EC.emp_no = E.emp_no
INNER JOIN tb_certi C
ON EC.certi_cd = C.certi_cd
JOIN tb_dept D
ON E.dept_cd = D.dept_cd
WHERE D.dept_cd IN (100004, 100006)
    AND EC.acqu_de >= '20180101'
;


-- 1980���� ������� ���, �����, �μ���, 
-- �ڰ�����, ������� ��ȸ
SELECT
    E.emp_no
    , E.emp_nm
    , E.birth_de
    , D.dept_nm
    , C.certi_nm
    , EC.acqu_de
FROM tb_emp E, tb_dept D, tb_emp_certi EC, tb_certi C
WHERE E.dept_cd = D.dept_cd
    AND E.emp_no = EC.emp_no
    AND EC.certi_cd = C.certi_cd
    AND E.birth_de BETWEEN '19800101' AND '19891231'
;

SELECT
    E.emp_no
    , E.emp_nm
    , E.birth_de
    , D.dept_nm
    , C.certi_nm
    , EC.acqu_de
FROM tb_emp E 
JOIN tb_dept D
ON E.dept_cd = D.dept_cd
JOIN tb_emp_certi EC 
ON E.emp_no = EC.emp_no
JOIN tb_certi C
ON EC.certi_cd = C.certi_cd
WHERE E.birth_de BETWEEN '19800101' AND '19891231'
;






-- INNER ������ �� ���̺� ���� 
-- ���������Ͱ� �ִ� ��쿡�� ���
-- � ���θ�ȸ���� �Ѱǵ� �ֹ����� ���� ���
-- INNER JOIN������ �ش� ȸ���� ��ȸ���� ����


-- SELECT [DISTINCT] { ���̸� .... } 
-- FROM  ���̺� �Ǵ� �� �̸�
-- JOIN  ���̺� �Ǵ� �� �̸�
-- ON    ���� ����
-- WHERE ��ȸ ����
-- GROUP BY  ���� �׷�ȭ
-- HAVING    �׷�ȭ ����
-- ORDER BY  ������ �� [ASC | DESC];


-- # NATURAL JOIN
-- 1. NATURAL JOIN�� ������ �̸��� ���� �÷��鿡 ���� �ڵ����� ���������� �����ϴ� ����Դϴ�.
-- 2. ��, �ڵ����� 2�� �̻��� ���̺��� ���� �̸��� ���� �÷��� ã�� INNER������ �����մϴ�.
-- 3. �� �� ���εǴ� ���� �̸��� �÷��� ������ Ÿ���� ���ƾ� �ϸ�, 
--    ALIAS�� ���̺���� �ڵ� ���� �÷� �տ� ǥ���ϸ� �ȵ˴ϴ�.
-- 4. SELECT * ������ ����ϸ�, ���� �÷��� ���տ��� �ѹ��� ǥ��˴ϴ�.
-- 5. ���� �÷��� n�� �̻��̸� ���� ������ n���� ó���˴ϴ�.

-- ��� ���̺�� �μ� ���̺��� ���� (���, �����, �μ��ڵ�, �μ���)
SELECT 
    E.emp_no
    , E.emp_nm
    , dept_cd
    , D.dept_nm
FROM tb_emp E
NATURAL JOIN tb_dept D
;

SELECT 
    *
FROM tb_emp E
NATURAL JOIN tb_dept D
-- ON E.dept_cd = D.dept_cd
;


-- # USING�� ����
-- 1. NATURAL���ο����� �ڵ����� �̸��� Ÿ���� ��ġ�ϴ� ��� �÷��� ����
--    ������ �Ͼ���� USING�� ����ϸ� ���ϴ� �÷��� ���ؼ��� ������ ���������� 
--    �ο��� �� �ֽ��ϴ�.
-- 2. USING�������� ���� �÷��� ���� ALIAS�� ���̺���� ǥ���Ͻø� �ȵ˴ϴ�.
SELECT 
    E.emp_no
    , E.emp_nm
    , dept_cd
    , D.dept_nm
FROM tb_emp E
JOIN tb_dept D
USING (dept_cd)
;


SELECT 
    *
FROM test_a
CROSS JOIN test_b
;





SELECT 
    tb_emp.emp_no
    , tb_emp.emp_nm
    , tb_emp.dept_cd
    , tb_dept.dept_nm
FROM tb_emp
JOIN tb_dept
ON (tb_emp.dept_cd = tb_dept.dept_cd)
;






