1-1. 테이블의 모든 컬럼 조회 (*)
SELECT * FROM departments 

1-2. 특정 컬럼(이름, 급여)만 골라서 조회
SELECT name, salary
FROM employees

2-1. 숫자 조건 필터링 (급여 5000 이상)
SELECT * FROM employees
WHERE salary >= 5000

2-2. 상태가 '진행중'인 프로젝트 조회
SELECT name, due_date 
FROM projects 
WHERE status = '진행중';

2-3. 부서가 배치되지 않은 직원 조회
SELECT name, email 
FROM employees 
WHERE department_id IS NULL