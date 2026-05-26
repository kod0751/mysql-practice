1-1. 특정 컬럼을 지정하여 새로운 부서 추가
INSERT INTO departments (name, description, color, location) 
VALUES ('디자인팀', 'UI/UX 디자인 및 브랜드 자산 관리', 'Purple', 'Pangyo');

1-2. 외래키(department_id)를 포함한 새로운 직원 추가
INSERT INTO employees (department_id, name, email, position, is_manager, salary) 
VALUES (2, '최민지', 'minji@company.com', '주니어 개발자', FALSE, 4300);

2-1. 특정 직원의 급여 데이터 수정
UPDATE employees 
SET salary = 5500 
WHERE email = 'suyeon@company.com';

2-2. 하나의 쿼리로 여러 컬럼 동시에 수정 (쉼표로 구분)
UPDATE projects 
SET progress = 90, status = '검토중' 
WHERE name = '신규 앱 출시';

3-1. 특정 프로젝트 행 삭제
-- WHERE 절이 없으면 모든 프로젝트 데이터 증발
DELETE FROM projects 
WHERE name = '상반기 SNS 광고 캠페인';

3-2. 외래키 제약조건이 걸린 부서 삭제 테스트
DELETE FROM departments 
WHERE id = 3;

-- employees 테이블 생성 시 FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE SET NULL 로 설정했기 때문에,
-- 마케팅팀(id: 3)이 삭제되면 최수연 직원의 department_id는 자동으로 NULL로 변경