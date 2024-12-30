-- ORDER BY : ����
-- ASC : ������ ���� (�⺻��), DESC : ������ ����
-- �׻� SELECT���� �� �������� ��ġ

SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_no
;

SELECT 
    emp_no
    , emp_nm
    , addr
FROM tb_emp
ORDER BY emp_nm DESC
;

SELECT 
    emp_no
    , emp_nm
    , addr
    , dept_cd
FROM tb_emp
ORDER BY dept_cd ASC, emp_nm DESC
;

SELECT 
    emp_no AS ���
    , emp_nm �̸�
    , dept_cd �μ��ڵ�
FROM tb_emp
ORDER BY �̸� DESC
;

SELECT 
    emp_no AS ���
    , emp_nm �̸�
    , dept_cd �μ��ڵ�
FROM tb_emp
ORDER BY 3, 1 DESC
;

SELECT 
    emp_no AS ���
    , emp_nm �̸�
    , dept_cd �μ��ڵ�
FROM tb_emp
ORDER BY �μ��ڵ�, 1 DESC
;


-- ����Ŭ������ ���Ľ� null�� ���� ū ������ ���
SELECT 
    emp_nm
    , direct_manager_emp_no
FROM tb_emp
ORDER BY direct_manager_emp_no DESC
;

SELECT   -- 5
    emp_no
    , SUM(pay_amt) ����
FROM tb_sal_his    -- 1
WHERE pay_de BETWEEN '20190101' AND '20191231'  -- 2
GROUP BY emp_no  -- 3 
HAVING AVG(pay_amt) >= 4500000  -- 4
ORDER BY 2 DESC -- 6
;











