
SELECT * FROM tb_sal_his;

-- ���� �Լ� (������ �Լ�)
-- ���� ���� ��� �ѹ��� �Լ��� ����
SELECT
    COUNT(*) "���� Ƚ��",
    SUM(pay_amt) "���� �Ѿ�",
    AVG(pay_amt) "��� ���޾�",
    MIN(pay_amt) "�ִ� ���޾�",
    MAX(pay_amt) "�ּ� ���޾�"
FROM tb_sal_his
;

-- �����Լ��� ó���� null�� ������
SELECT 
    COUNT(direct_manager_emp_no)
FROM tb_emp
;

SELECT 
    COUNT(*)
FROM tb_emp
WHERE emp_nm LIKE '��%'
;

SELECT
    MIN(birth_de) "�ֿ����� ����",
    MAX(birth_de) "�ֿ����� ����"
FROM tb_emp
;

-- �� ����� ���� �μ��� ������� ����
-- ȸ�� ��ü�� ������ ���ϸ��� �μ����� ������ ������ �˰� ����
-- GROUP BY
-- �� �׷캰�� �����Լ��� ���� ����

SELECT 
    emp_no,
    emp_nm,
    birth_de,
    dept_cd
FROM tb_emp
ORDER BY dept_cd
;

SELECT
    dept_cd,
    COUNT(*) "�μ��� �ο� ��",
    MIN(birth_de) "�μ��� �ֿ����� ����"
FROM tb_emp
GROUP BY dept_cd
ORDER BY dept_cd
;

SELECT
    emp_no,
    TO_CHAR(SUM(pay_amt), 'L999,999,999') "����� �ѱ޿���",
    TO_CHAR(ROUND(AVG(pay_amt), 2), 'L999,999,999.99') "����� �޿����",
    COUNT(*) "����� ���� Ƚ��",
    TO_CHAR(MAX(pay_amt), 'L999,999,999') "�ְ� ���ɾ�"
FROM tb_sal_his
GROUP BY emp_no
ORDER BY emp_no
;


CREATE TABLE TABLE_A27 (
    TABKEY NUMBER(3) PRIMARY KEY,
    COLA NUMBER(3),
    COLB VARCHAR2(3),
    COLC NUMBER(3)
);

INSERT INTO TABLE_A27
VALUES (1, null, '��', null);

INSERT INTO TABLE_A27
VALUES (2, 1, '��', 5);

INSERT INTO TABLE_A27
VALUES (3, null, '��', 2);

INSERT INTO TABLE_A27
VALUES (4, 3, '��', 0);

INSERT INTO TABLE_A27
VALUES (5, null, null, 3);

INSERT INTO TABLE_A27
VALUES (6, 5, '��', 0);

INSERT INTO TABLE_A27
VALUES (7, null, '��', null);


SELECT 
    COLB,
    MAX(COLA),
    MIN(COLA),
    SUM(COLA + COLC)
FROM TABLE_A27
GROUP BY COLB;



SELECT 
    emp_no
    , emp_nm
    , dept_cd
    , COUNT(*)
FROM tb_emp
;


SELECT 
    emp_no
FROM tb_emp;

SELECT 
    COUNT(*)
FROM tb_emp;

-- GROUP BY������ ����� �÷��� ���̷�Ʈ�� SELECT���� ��밡��
-- �� �̿� �÷��� �����Լ��� ������� ������ ��� �Ұ�
SELECT 
    dept_cd,
    COUNT(*)
FROM tb_emp
GROUP BY dept_cd
;

SELECT 
    dept_cd,
    sex_cd,
    COUNT(*)
FROM tb_emp
GROUP BY sex_cd, dept_cd
ORDER BY dept_cd
;


-- �޿� �̷� ���̺��� 
-- ������� 2019�⿡ �߻���
-- �޿� ��վ�, �ּ����޾�, �ִ����޾� ��ȸ

-- WHERE : ���� �� ���͸�
SELECT 
    emp_no
    , AVG(pay_amt)
    , MIN(pay_amt)
    , MAX(pay_amt)
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
ORDER BY emp_no
;

-- �޿� �̷� ���̺��� 
-- ��ձ޿��� 400���� �̻��� 
-- ������� �޿��Ѿװ� �޿������ ��ȸ

-- HAVING : ���� �� ���͸�
SELECT 
    emp_no
    , SUM(pay_amt)
    , AVG(pay_amt)
FROM tb_sal_his
WHERE pay_de BETWEEN '20190101' AND '20191231'
GROUP BY emp_no
HAVING AVG(pay_amt) >= 4500000
;

-- �μ����� ���� ������ �������, �������� �������, �μ��� �� ��� ���� ��ȸ
-- �׷��� �μ��� ����� 1���� �μ��� ������ ��ȸ�ϰ� ���� ����.

SELECT 
    dept_cd AS dc,
    MAX(birth_de),
    MIN(birth_de),
    COUNT(*) cnt
FROM tb_emp
GROUP BY dept_cd
HAVING COUNT(*) > 1
ORDER BY dept_cd
;





