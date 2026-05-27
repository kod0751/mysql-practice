1-1. CONCAT을 활용한 이름과 직급 결합
SELECT CONCAT(name, ' (', position, ')') AS full_position 
FROM employees;

2-1. SUBSTRING(컬럼, 시작위치, 길이)로 3글자만 추출 (SQL은 인덱스가 1부터 시작합니다)
SELECT name, SUBSTRING(email, 1, 3) AS email_short 
FROM employees;

2-2. SUBSTRING_INDEX(컬럼, 구분자, 횟수)로 이메일 ID만 분리
-- 구분자 기준으로 1을 주면 왼쪽 첫 번째 덩어리를 가져옵니다.
SELECT name, email, SUBSTRING_INDEX(email, '@', 1) AS email_id 
FROM employees;

3-1. REPLACE(컬럼, 바꿀문자, 새로운문자)
SELECT name, location, REPLACE(location, 'Pangyo', '판교') AS location_kor 
FROM departments;

4-1. CHAR_LENGTH를 활용한 문자열 길이 측정
-- LENGTH()는 바이트 수를 세서 한글이 깨질 수 있으므로, 글자 수를 셀 때는 CHAR_LENGTH()가 안전합니다.
SELECT name, CHAR_LENGTH(name) AS name_length 
FROM departments;

4-2. UPPER 함수로 대문자 변환
SELECT name, UPPER(email) AS upper_email 
FROM employees;



1. JS의 `+` 연산이나 템플릿 리터럴(``) 역할은 SQL에서 CONCAT() 함수가 대신한다.
2. 자바스크립트는 배열/문자열 인덱스가 0부터 시작하지만, SQL은 1부터 시작하므로 헷갈리지 말자.
3. 이메일 ID 추출 등 특정 구분자로 자를 때는 SUBSTRING_INDEX()가 엄청나게 유용하다.