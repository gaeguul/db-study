-- 학생 테이블, 동아리 테이블, 학생 동아리 테이블을 이용해서 학생을 기준으로 학생 이름/지역/가입한 동아리/동아리방을 출력

SELECT c.clubName, roomNo, s.stdName, addr
FROM stdtbl s
LEFT JOIN stdclubtbl sc
ON s.stdName=sc.stdName
LEFT JOIN clubtbl c
ON c.clubName = sc.clubName;


-- '우대리'의 상관 연락처 정보
SELECT e1.emp, e1.manager, e2.empTel
FROM emptbl e1, emptbl e2
WHERE e1.manager = e2.emp AND e1.emp='우대리';

-- 현재 재직 중인 직원의 정보를 출력
-- 출력 항목: emp_no, first_name, last_name, title
SELECT e.emp_no, e.first_name, e.last_name, t.title
FROM employees e
INNER JOIN titles t
ON e.emp_no = t.emp_no
WHERE t.to_date > current_date;

-- 현재 재직 중인 직원 정보를 출력
-- 출력항목: 직원의 기본 정보 모두, title, salary
SELECT e.emp_no, e.birth_date, e.first_name, e.last_name, e.gender, e.hire_date, t.title
FROM employees e
JOIN titles t ON e.emp_no = t.emp_no AND t.to_date > current_date
JOIN salaries s ON e.emp_no = s.emp_no AND t.to_date > current_date;

-- 현재 재직중인 직원의 정보를 출력하세요.
-- ○ 출력항목: emp_no, first_name, last_name, department
-- ○ 정렬: emp_no 오름 차순
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
JOIN titles t ON e.emp_no = t.emp_no AND t.to_date > current_date
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
ORDER BY e.emp_no;

-- 부서별 재직중인 직원의 수를 출력하세요.
-- ○ 출력 항목: 부서 번호, 부서명, 인원수
-- ○ 정렬: 부서 번호 오름차순
SELECT de.dept_no, d.dept_name, COUNT(*)
FROM employees e
JOIN titles t ON e.emp_no = t.emp_no AND t.to_date > current_date
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON d.dept_no = de.dept_no
GROUP BY de.dept_no;

