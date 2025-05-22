-- 심화1

use tabledb;

DROP TABLE if EXISTS buytbl;

DROP TABLE IF EXISTS usertbl;

CREATE TABLE usertbl(
    userID char(8) NOT NULL PRIMARY KEY ,
    name varchar(10) NOT NULL ,
    birthYear int NOT NULL
);

CREATE TABLE buytbl(
    num int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    userID char(8) NOT NULL ,
    prodName char(6) NOT NULL ,
    CONSTRAINT FK_buytbl_prodname FOREIGN KEY(userID) REFERENCES usertbl(userID)
);

DROP TABLE if EXISTS buytbl;

DROP TABLE IF EXISTS usertbl;

CREATE TABLE usertbl(
    userID char(8) NOT NULL PRIMARY KEY ,
    name varchar(10) NOT NULL ,
    birthYear int NOT NULL,
    email char(30) NULL UNIQUE
);

DROP TABLE IF EXISTS usertbl;

CREATE TABLE usertbl(
    userID char(8) NOT NULL PRIMARY KEY ,
    name varchar(10) NOT NULL ,
    birthYear int CHECK ( birthYear >= 1900 AND birthYear <= 2023),
    mobile char(3) NOT NULL
);

DROP TABLE IF EXISTS usertbl;

CREATE TABLE usertbl(
    userID char(8) NOT NULL PRIMARY KEY ,
    name varchar(10) NOT NULL ,
    birthYear int DEFAULT -1,
    addr char(2) NULL ,
    mobile1 char(3) NULL ,
    mobile2 char(8) NULL ,
    height smallint NULL DEFAULT 170,
    mDate date NULL
);

INSERT INTO usertbl VALUES('1','홍길동',2000, DEFAULT, NULL,NULL,DEFAULT,NULL);

ALTER TABLE usertbl DROP COLUMN mobile1;

ALTER TABLE usertbl CHANGE COLUMN name uName varchar(20) NOT NULL ;

ALTER TABLE usertbl DROP PRIMARY KEY ;



-- 심화2

use employees;

DROP VIEW v_employees_info;

CREATE VIEW v_employees_info
as
SELECT e.emp_no, e.birth_date, e.first_name, e.last_name, e.gender,e.hire_date,
       t.title,t.from_date as t_from,
       t.to_date as t_to,
       s.salary,
       s.from_date as s_from,
       s.to_date as s_to
FROM employees e
inner JOIN titles t on e.emp_no=t.emp_no
INNER JOIN salaries s on s.emp_no = e.emp_no;

-- 직원 정보를 출력하는 EMPLOYEES_INFO 뷰
SELECT *
from v_employees_info;

-- 재직자의 현재 정보만 출력
SELECT *
from v_employees_info
where current_date >= v_employees_info.t_from AND current_date < v_employees_info.t_to;


drop VIEW if EXISTS v_emp_dept_info;

-- 부서 정보를 출력하는 EMP_DEPT_INFO 뷰
CREATE VIEW v_emp_dept_info
AS
SELECT e.emp_no, d.dept_no, d.dept_name, de.from_date, de.to_date
FROM employees e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no;

SELECT *
FROM v_emp_dept_info;



-- 현재 재직자의 부서 정보 출력
SELECT *
FROM v_emp_dept_info
where current_date >= v_emp_dept_info.from_date AND current_date < v_emp_dept_info.to_date;