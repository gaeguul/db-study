-- 1

SELECT * FROM buytbl
INNER JOIN usertbl
ON buytbl.userID = usertbl.userID
WHERE buytbl.userID='JYP';


-- 2

SELECT usertbl.userID, name, prodName, addr, CONCAT(mobile1, mobile2) as '연락처'
FROM usertbl
LEFT OUTER JOIN buytbl
ON usertbl.userID = buytbl.userID
ORDER BY userID;

-- 3

SELECT *
FROM usertbl
WHERE mobile1 IS NOT NULL AND mobile2 IS NOT NULL;

-- 4

SELECT *
FROM usertbl
WHERE mobile1 IS NULL AND mobile2 IS NULL;
