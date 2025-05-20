-- 심화1: 인덱스

USE sqldb;

SELECT * FROM usertbl;

SHOW INDEX FROM usertbl;

-- 인덱스 적용하려면 우선 테이블을 분석 처리해준다
ANALYZE TABLE usertbl;

-- usertbl의 데이터 크기와 인덱스의 크기 확인
SHOW TABLE STATUS LIKE 'usertbl';

-- addr 컬럼에 대해 인덱스 만들고 목록 확인
CREATE INDEX idx_usertbl_addr ON usertbl(addr);
SHOW INDEX FROM usertbl;

-- 인덱스 적용
ANALYZE TABLE usertbl;

-- 인덱스 크기 확인
SHOW TABLE STATUS LIKE 'usertbl';

-- birthYear 컬럼에 대해 인덱스 생성
-- CREATE UNIQUE INDEX idx_usertbl_birthYear ON usertbl(birthYear);
-- 에러 발생 -> 원인: birthYear에 이미 중복된 값이 존재하므로 UNIQUE INDEX 생성이 불가능하기 때문

-- name 컬럼에 대해 인덱스 생성
CREATE INDEX idx_usertbl_name ON usertbl(name);

-- 생성된 인덱스 목록 확인
SHOW INDEX FROM usertbl;

-- name 컬럼에 대한 보조 인덱스 삭제
DROP INDEX idx_usertbl_name ON usertbl;

-- name과 birthYear 조합으로 인덱스 생성
CREATE INDEX idx_usertbl_name_birthYear ON usertbl(name, birthYear);

SHOW INDEX FROM usertbl;

-- 심화2: 사용자 관리

-- DB 생성
CREATE DATABASE scoula_db;

-- 사용자 scoula 생성 및 비밀번호 설정
CREATE USER 'scoula'@'%' IDENTIFIED BY '1234';

-- 권한 부여
GRANT ALL PRIVILEGES ON scoula_db.* TO 'scoula'@'%';

-- 변경사항 적용
FLUSH PRIVILEGES ;