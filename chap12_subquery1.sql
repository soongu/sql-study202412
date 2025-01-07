
-- ���� �� ��������
-- ���������� ��ȸ����� 0�� �Ǵ� 1���� ��������

-- �μ��ڵ尡 100004���� �μ��� ������� ��ȸ
SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
WHERE dept_cd = '100004'
;

-- �̳��� ���� �μ��� ��ü ��������� ��ȸ
SELECT 
  dept_cd
FROM tb_emp
WHERE emp_nm = '�̳���'
;

SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
WHERE dept_cd = (
            SELECT 
              dept_cd
            FROM tb_emp
            WHERE emp_nm = '�̳���'
)
;


/*
    ����̸��� �̰����� ����� 2���̹Ƿ�
    �� �������������� �������� �ƴ� �������� ���ϵ�
    ���� ������ �������� (=, <, <=, >, >=, !=, <>)
    �� ����� �� ����
*/
SELECT 
    emp_no
    , emp_nm
    , dept_cd
FROM tb_emp
WHERE dept_cd = (
            SELECT 
              dept_cd
            FROM tb_emp
            WHERE emp_nm = '�̰���'
)
;


-- 20200525�� ���� �޿��׼��� ȸ�� ��ü�� 
-- 20200525�� ��ü ��� �޿����� ���� ������� ����
-- (���, �̸�, �޿�������, �����޿��׼�)�� ��ȸ
SELECT 
    E.emp_no
    , E.emp_nm
    , H.pay_de
    , H.pay_amt
FROM tb_emp E
LEFT JOIN tb_sal_his H
ON E.emp_no = H.emp_no
WHERE H.pay_de = '20200525'
    AND H.pay_amt >= (
            SELECT AVG(pay_amt)
            FROM tb_sal_his
            WHERE pay_de = '20200525'
    )
ORDER BY E.emp_no
;


-- # ������ ��������
-- ���������� ��ȸ �Ǽ��� 0�� �̻��� ��
-- ## ������ ������
-- 1. IN : ���������� �������� �������� ����߿� �ϳ��� ��ġ�ϸ� ��
--    ex )  salary IN (200, 300, 400)
--            250 ->  200, 300, 400 �߿� �����Ƿ� false
-- 2. ANY, SOME : ���������� �������� ���������� �˻���� �� �ϳ� �̻� ��ġ�ϸ� ��
--    ex )  salary > ANY (200, 300, 400)
--            250 ->  200���� ũ�Ƿ� true
-- 3. ALL : ���������� �������� ���������� �˻������ ��� ��ġ�ϸ� ��
--    ex )  salary > ALL (200, 300, 400)
--            250 ->  200���ٴ� ũ���� 300, 400���ٴ� ũ�� �����Ƿ� false
-- 4. EXISTS : ���������� �������� ���������� ��� �� 
--				�����ϴ� ���� �ϳ��� �����ϸ� ��


-- �ѱ������ͺ��̽���������� �߱��� �ڰ����� ������ �ִ�
-- ����� �����ȣ�� ����̸��� �ش� ����� �ѱ������ͺ��̽���������� 
-- �߱��� �ڰ��� ������ ��ȸ

SELECT
    E.emp_no
    , E.emp_nm
    , COUNT(EC.certi_cd) AS count 
FROM tb_emp E
JOIN tb_emp_certi EC
ON E.emp_no = EC.emp_no
WHERE certi_cd IN (
    SELECT 
        certi_cd
    FROM tb_certi
    WHERE issue_insti_nm = '�ѱ������ͺ��̽������'
)
GROUP BY E.emp_no, E.emp_nm
;

SELECT 
    certi_cd
FROM tb_certi
WHERE issue_insti_nm = '�ѱ������ͺ��̽������'
;














