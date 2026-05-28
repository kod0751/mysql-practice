1-1. 부서별 직원 수 및 평균 급여 (내림차순 정렬)
SELECT 
    department_id, 
    COUNT(*) AS employee_count, 
    ROUND(AVG(salary), 0) AS average_salary
FROM employees
WHERE department_id IS NOT NULL  -- 그룹화하기 전에 부서 없는 인턴 제거
GROUP BY department_id
ORDER BY average_salary DESC;

2-1. WHERE(개별 행 필터링)와 HAVING(그룹 필터링)의 조합
-- ① 급여 4000 이상인 박민수(4500은 통과, 홍길동3000 탈락) 등을 먼저 거름 (WHERE)
-- ② 남은 직원들을 부서별로 묶음 (GROUP BY)
-- ③ 묶인 부서의 평균 급여가 5000 이상인 그룹만 남김 (HAVING)
SELECT 
    department_id, 
    ROUND(AVG(salary), 0) AS avg_salary
FROM employees
WHERE salary >= 4000
GROUP BY department_id
HAVING AVG(salary) >= 5000;

3-1. 프로젝트 상태별 집계 및 결과 필터링
SELECT 
    status, 
    COUNT(*) AS project_count, 
    MAX(progress) AS max_progress
FROM projects
GROUP BY status
HAVING COUNT(*) > 1; -- 프로젝트 수가 2개 이상인 그룹('진행중')만 남음



1. FROM         : 어떤 테이블에서 데이터를 꺼낼지 결정
2. WHERE        : 꺼낸 데이터 중 쓸모없는 행을 먼저 솎아냄
3. GROUP BY     : 남은 행들을 기준 컬럼별로 뭉침
4. HAVING       : 뭉쳐진 그룹 덩어리들 중 조건에 안 맞는 덩어리를 버림
5. SELECT       : 최종적으로 화면에 보여줄 컬럼만 선택
6. ORDER BY     : 완성된 결과 정렬