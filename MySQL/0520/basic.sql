use sqldb;

DROP TABLE IF EXISTS tbl1;

CREATE TABLE tbl1(
    a int PRIMARY KEY ,
    b int,
    c int
);

SHOW INDEX FROM tbl1;

DROP TABLE IF EXISTS tbl2;

CREATE TABLE tbl2(
    a int PRIMARY KEY ,
    b int UNIQUE ,
    c int UNIQUE ,
    d int
);

SHOW INDEX FROM tbl2;

DROP TABLE IF EXISTS  tbl3;

CREATE TABLE tbl3(
    a int UNIQUE ,
    b int UNIQUE ,
    c int UNIQUE ,
    d int
);

SHOW INDEX FROM tbl3;

DROP TABLE IF EXISTS  tbl4;

CREATE TABLE tbl4(
     a int UNIQUE NOT NULL ,
     b int UNIQUE ,
     c int UNIQUE ,
     d int
);

SHOW INDEX FROM tbl4;

DROP TABLE IF EXISTS  tbl5;

CREATE TABLE tbl5(
     a int UNIQUE NOT NULL ,
     b int UNIQUE ,
     c int UNIQUE ,
     d int PRIMARY KEY
);

SHOW INDEX FROM tbl5;

DROP DATABASE IF EXISTS testdb;

CREATE DATABASE testdb;

USE testdb;

DROP TABLE IF EXISTS usertbl;

CREATE TABLE usertbl(
    userID char(8) NOT NULL PRIMARY KEY ,
    name varchar(10) NOT NULL ,
    birthYear int NOT NULL ,
    addr nchar(2) NOT NULL
);

INSERT INTO usertbl VALUES ('LSG', '이승기', 1987, '서울');
INSERT INTO usertbl VALUES ('KBS', '김범수', 1979, '경남');
INSERT INTO usertbl VALUES ('KKH', '김경호', 1971, '전남');
INSERT INTO usertbl VALUES ('JYP', '조용필', 1950, '경기');
INSERT INTO usertbl VALUES ('S나', '성시경', 1979, '서울');

SHOW INDEX FROM usertbl;

-- usertbl에서 PRIMARY KEY 제약조건을 제거
ALTER TABLE usertbl
DROP PRIMARY KEY ;

-- name 컬럼에 pk_name이라는 제약조건명으로 기본키 설정
ALTER TABLE usertbl
ADD CONSTRAINT pk_name PRIMARY KEY (name);

-- 클러스터형 인덱스 확인
SHOW INDEX FROM usertbl;
