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

3-1. 개발팀(2)이면서 급여가 5000 이상인 직원 (AND)
SELECT name, salary 
FROM employees 
WHERE department_id = 2 AND salary >= 5000;

3-2. 급여가 4000 이상 6000 이하인 직원 (BETWEEN)
SELECT name, salary 
FROM employees 
WHERE salary BETWEEN 4000 AND 6000;

3-3. 직급이 '팀장'이거나 '수석 개발자'인 직원 (OR)
SELECT name, position 
FROM employees 
WHERE position = '팀장' OR position = '수석 개발자';

4-1. company.com 이메일을 사용하는 직원 조회
SELECT name, email 
FROM employees 
WHERE email LIKE '%company.com';

4-2. 이름에 '앱'이 포함된 프로젝트 조회
SELECT * FROM projects 
WHERE name LIKE '%앱%';

5-1. 급여 높은 순 정렬 (내림차순)
SELECT name, salary 
FROM employees 
ORDER BY salary DESC;

5-2. 진행도 낮은 순(오름차순), 진행도 같으면 마감일 최신순(내림차순) 정렬
SELECT name, progress, due_date 
FROM projects 
ORDER BY progress ASC, due_date DESC;