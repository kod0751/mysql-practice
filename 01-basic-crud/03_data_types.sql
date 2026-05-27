[MySQL 핵심 데이터 타입 요약]
1. 숫자형: INT (일반 정수, 약 -21억~21억), BIGINT (대용량 정수/PK용), DECIMAL (소수점 정밀 계산)
2. 문자형: VARCHAR(N) (가변 길이 문자열/최대 N자), TEXT (길이를 알 수 없는 대용량 본문)
3. 날짜형: DATE (YYYY-MM-DD), TIMESTAMP (시간대 반영 일시), DATETIME (절대적 일시)
4. 논리형: BOOLEAN (실제로는 TINYINT(1)로 매핑되어 0 또는 1로 저장됨)

1-1. 테이블 구조 조회를 통해 데이터 타입 확인하기
DESC departments;

2-1. 원래 쓰던 대로 TRUE 조건을 주어 매니저 조회
SELECT name, is_manager FROM employees WHERE is_manager = TRUE;

2-2. 1이라는 숫자를 대입해도 똑같이 조회되는지 확인 (BOOLEAN의 실체 확인)
SELECT name, is_manager FROM employees WHERE is_manager = 1;

2-3. 반대로 매니저가 아닌 사람(FALSE = 0) 조회
SELECT name, is_manager FROM employees WHERE is_manager = 0;

3-1. 오늘 날짜(DATE 형식)와 현재 시간(TIMESTAMP/DATETIME 형식) 출력해보기
SELECT CURDATE() AS '오늘날짜(DATE)', NOW() AS '현재시간(TIMESTAMP)';

3-2. 날짜 비교 연산 실습: 마감일(due_date)이 현재 시간 이후인(남은) 프로젝트 조회
SELECT name, due_date FROM projects WHERE due_date > CURDATE();



1. JS의 'string'은 SQL에서 길이 제한이 있다면 VARCHAR(N), 제한이 없다면 TEXT를 쓴다.
2. JS의 'number'는 정수 크기에 따라 INT, BIGINT로 나뉘며, PK(id)에는 주로 대용량 BIGINT를 쓴다.
3. MySQL의 BOOLEAN은 겉모습일 뿐, 실제 서랍에는 0과 1(TINYINT)로 저장된다.
4. 날짜를 다룰 때는 단순 날짜(DATE)인지, 타임존이 포함된 등록일시(TIMESTAMP)인지 구분이 필요하다.