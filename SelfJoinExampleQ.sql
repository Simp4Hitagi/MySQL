DROP DATABASE IF EXISTS StaffDatabase;
CREATE DATABASE StaffDatabase;
USE StaffDatabase;
-- Example on Self or unary join
CREATE TABLE Staff(
	staffID INT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    managerID INT DEFAULT 0
);

INSERT INTO Staff
VALUES(100, 'John', 'Cena', DEFAULT),
	(101, 'Peter', 'Henk', DEFAULT),
    (102, 'Joel', 'Mukanya', 102);
SELECT *
FROM Staff;
SELECT s1.staffID, s1.firstName, s1.lastName,
s1.managerID
FROM Staff s1
INNER JOIN Staff s2
ON s1.staffID = s2.managerID;

SELECT e.firstName, e.lastName, e.gender, e.age,
d.depName
FROM Employee e
LEFT JOIN EmpDep ed
ON e.empID = ed.empID
LEFT JOIN Department d
ON d.depID = ed.depID;

