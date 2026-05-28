1-1. 직원 테이블과 부서 테이블 INNER JOIN
-- 테이블 이름 뒤에 한 칸 띄우고 'e'나 'd'를 적으면 별칭(Alias)이 되어 코드가 간결해집니다.
SELECT 
    e.name AS employee_name, 
    e.position, 
    d.name AS department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id;

2-1. 모든 직원을 보장하는 LEFT JOIN
SELECT 
    e.name AS employee_name, 
    d.name AS department_name,
    d.location
FROM employees e
LEFT JOIN departments d ON e.department_id = d.id;

3-1. 모든 부서를 보장하는 RIGHT JOIN (직원 기준 오른쪽인 departments 기준)
SELECT 
    d.name AS department_name, 
    e.name AS employee_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.id;



1. INNER JOIN : 양쪽 테이블에 모두 매칭되는 데이터가 있을 때만 합쳐서 반환 (교집합)
2. LEFT JOIN  : 왼쪽 테이블 데이터를 기준으로 삼아 오른쪽 테이블을 붙임. 매칭 안 되면 NULL
3. RIGHT JOIN : 오른쪽 테이블 데이터를 기준으로 삼아 왼쪽 테이블을 붙임. 매칭 안 되면 NULL
4. 프론트엔드 UI 화면에서 '부서가 없는 유저'나 '직원이 없는 신설 부서'를 다 튕겨내지 않고 자연스럽게 보여주려면 INNER JOIN 대신 LEFT/RIGHT JOIN을 써서 NULL 값을 핸들링해야 한다/