-- 기존 테이블이 있다면 삭제 (초기화용)
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

-- 1. 부서 테이블 생성
CREATE TABLE departments (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    color VARCHAR(50) NOT NULL,
    location VARCHAR(255)
);

-- 2. 직원 테이블 생성 (부서 ID 외래키 포함)
CREATE TABLE employees (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    department_id BIGINT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    position VARCHAR(255),
    is_manager BOOLEAN DEFAULT FALSE,
    salary INT NOT NULL, -- 최적화 연습을 위해 급여 컬럼 추가
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE SET NULL
);

-- 3. 프로젝트 테이블 생성
CREATE TABLE projects (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    department_id BIGINT NOT NULL,
    name VARCHAR(255) NOT NULL,
    progress INT DEFAULT 0 CHECK (progress >= 0 AND progress <= 100),
    status VARCHAR(50),
    due_date DATE,
    FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE CASCADE
);

-- 연습용 데이터 삽입
INSERT INTO departments (name, description, color, location) VALUES
('인사팀', '인재 채용 및 관리', 'Blue', 'Seoul'),
('개발팀', '서비스 개발 및 유지보수', 'Green', 'Pangyo'),
('마케팅팀', '브랜드 홍보 및 광고', 'Red', 'Seoul');

INSERT INTO employees (department_id, name, email, position, is_manager, salary) VALUES
(1, '김철수', 'chul@company.com', '팀장', TRUE, 6000),
(2, '이영희', 'young@company.com', '수석 개발자', TRUE, 8000),
(2, '박민수', 'min@company.com', '주니어 개발자', FALSE, 4500),
(3, '최수연', 'suyeon@company.com', '매니저', FALSE, 5000),
(NULL, '홍길동', 'gildong@company.com', '인턴', FALSE, 3000); -- 부서가 없는 직원

INSERT INTO projects (department_id, name, progress, status, due_date) VALUES
(2, '신규 앱 출시', 75, '진행중', '2026-08-31'),
(2, 'DB 마이그레이션', 100, '완료', '2026-04-30'),
(3, '상반기 SNS 광고 캠페인', 40, '진행중', '2026-06-15');

