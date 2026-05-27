1-1. 최댓값과 최솟값 구하기
SELECT 
    MAX(salary) AS max_salary, 
    MIN(salary) AS min_salary 
FROM employees;

2-1. 소수점 처리 함수 비교
-- ROUND(값, 1)은 소수점 둘째 자리에서 반올림하여 첫째 자리까지 남깁니다. (정수로 만들려면 ROUND(값, 0) 또는 그냥 ROUND(값))
SELECT 
    ROUND(AVG(salary), 1) AS round_salary,
    CEIL(AVG(salary)) AS ceil_salary,
    FLOOR(AVG(salary)) AS floor_salary
FROM employees;

3-1. COALESCE(컬럼, 기본값) 사용하기
--  COALESCE는 나열된 인자 중 NULL이 아닌 첫 번째 값을 반환하는 아주 강력한 함수입니다.
SELECT name, COALESCE(department_id, 0) AS department_id
FROM employees;

4-1. CASE WHEN 구문을 활용한 조건별 데이터 매핑
SELECT name, progress,
    CASE 
        WHEN progress >= 90 THEN '안정'
        WHEN progress >= 50 THEN '보통'
        ELSE '위험'
    END AS risk_level
FROM projects;


1. 통계 화면을 만들 때 소수점 컨트롤은 필수! 상황에 따라 ROUND, CEIL, FLOOR를 골라 쓰자.
2. DB의 NULL이 프론트엔드로 그대로 넘어가면 undefined 오류를 뿜을 수 있으니 COALESCE로 미리 0이나 기본값 처리를 해주면 안전하다.
3. CASE WHEN을 쓰면 백엔드나 프론트엔드에서 노가다로 바꿀 필요 없이 DB 레벨에서 카테고리화(안정/위험 등)가 가능하다.