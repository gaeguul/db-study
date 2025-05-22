-- tabledb DB 삭제
DROP DATABASE IF EXISTS tabledb;

-- tabledb DB 생성
CREATE DATABASE tabledb;

USE tabledb;

CREATE TABLE usertbl(
                        userID CHAR(8) NOT NULL PRIMARY KEY,
                        name VARCHAR(8) NOT NULL,
                        birthYear INT NOT NULL ,
                        addr CHAR(2) NOT NULL ,
                        mobile1 CHAR(3) NULL ,
                        mobile2 CHAR(8) NULL ,
                        height SMALLINT NULL ,
                        mDate DATE NULL
);

CREATE TABLE buytbl(
                       num int NOT NULL PRIMARY KEY AUTO_INCREMENT,
                       userID char(8) NOT NULL ,
                       prodName char(6) NOT NULL ,
                       groupName char(4) NULL ,
                       price int NOT NULL ,
                       amount smallint NOT NULL ,
                       FOREIGN KEY(userID) REFERENCES usertbl(userID)
);

-- 회원 테이블에 데이터 입력
INSERT INTO usertbl VALUES ('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES ('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES ( 'KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');


-- 구매 테이블에 데이터 입력
INSERT INTO buytbl VALUES(NULL, 'KBS', '운동화', NULL, 30, 2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);

-- userID 값이 존재하지 않아서 아래 INSERT 구문은 에러 발생
-- INSERT INTO buytbl VALUES('KBS', '운동화', NULL, 30, 2);
-- INSERT INTO buytbl VALUES('KBS', '노트북', '전자', 1000, 1);

-- userID값이 usertbl에 존재하지 않아서 에러 발생
-- INSERT INTO buytbl VALUES('JYP', '모니터', '전자', 200, 1);

-- usertbl 정의
DROP TABLE IF EXISTS usertbl2;

CREATE TABLE usertbl2(
                         userID char(8) NOT NULL ,
                         name varchar(10) NOT NULL ,
                         birthYear int NOT NULL,
                         CONSTRAINT PRIMARY KEY PK_usertbl_userid(userID)
);


-- prodtbl 정의
DROP TABLE IF EXISTS prodtbl;

CREATE TABLE prodtbl(
                        prodCode char(3) NOT NULL ,
                        prodID char(4) NOT NULL ,
                        prodDate datetime NOT NULL ,
                        proCur char(10) NULL ,
                        CONSTRAINT  PRIMARY KEY PK_prodtbl_prodcode_prodid (prodCode, prodID)
);

CREATE VIEW v_usertbl_buytbl
AS
SELECT u.userID as userid, u.name, b.prodName, u.addr, concat(u.mobile1, u.mobile2) as '연락처'
FROM usertbl u
         INNER JOIN buytbl b
                    ON u.userID = b.userID;

SELECT *
FROM v_usertbl_buytbl
WHERE  name='김범수';