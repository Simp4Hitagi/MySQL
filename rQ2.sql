DROP DATABASE IF EXISTS revisionDb;
CREATE DATABASE revisionDb;
USE revisionDb;
SHOW TABLES;
SHOW CREATE TABLE Salary;
-- Create table
CREATE TABLE Employee(
	empID INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50),
    gender VARCHAR(30)
    DEFAULT 'Please specify your gender.',
    age INT CONSTRAINT chkAge CHECK(age > 17)
);
-- Department table
CREATE TABLE Department(
	depID INT PRIMARY KEY AUTO_INCREMENT,
    depName VARCHAR(15)
);
-- Create a salary table and set up a foreign key between the employee and salary tables.
CREATE TABLE Salary(
	salaryId INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(10,2),
    bonus DOUBLE,
    empID INT,
    CONSTRAINT employee_salary FOREIGN KEY(empID)
    REFERENCES Employee(empID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
-- Bridge table (Employee and department)
CREATE TABLE EmpDep(
	edID INT PRIMARY KEY AUTO_INCREMENT,
    depID INT,
    empID INT
);
-- Alter a table
ALTER TABLE EmpDep
ADD CONSTRAINT dep_bridge FOREIGN KEY(depID)
REFERENCES department(depID)
ON DELETE CASCADE
ON UPDATE CASCADE,
ADD CONSTRAINT emp_bridge FOREIGN KEY(empID)
REFERENCES Employee(empID)
ON DELETE CASCADE
ON UPDATE CASCADE;
/*
citizenship VARCHAR(50)
CONSTRAINT chkCit CHECK(citizenship IN('South Africa', 'France', 'Congo'))
*/
-- INSERT values
INSERT INTO Employee(firstName, lastName, gender,
age)
VALUES('Lerato', 'Tshepo', 'Female', 30),
	('David', 'Henk', 'Male', 59),
    ('David', 'James', 'Male', 29);
INSERT INTO EmpDep
VALUES(700, 100, 1),
	(DEFAULT, 101, 2),
    (DEFAULT, 102, 2),
    (DEFAULT, 101, 3),
    (DEFAULT, 102, 3);
INSERT INTO Department
VALUES(100, 'HR'),
	(DEFAULT, 'IT'),
    (DEFAULT, 'Dev');
SELECT *
FROM Employee;
SELECT *
FROM EmpDep;
SELECT *
FROM Department;
-- Left Join
SELECT e.firstName, e.lastName, e.gender, e.age,
d.depName
FROM Employee e
LEFT JOIN EmpDep ed
ON e.empID = ed.empID
LEFT JOIN Department d
ON d.depID = ed.depID;
SELECT * FROM Employee;
-- Insert new record into the employee table
INSERT INTO Employee
VALUES(DEFAULT, 'Joel', 'Mukanya', 'Male', 39);
SELECT e.firstName, e.lastName, e.gender, e.age,
d.depName
FROM Employee e
INNER JOIN EmpDep ed
USING(empID)
INNER JOIN Department d
USING(depID);
-- DELETE FROM EmpDep
-- WHERE edID BETWEEN 702 AND 702;
-- Inner Join
SELECT e.firstName, e.lastName, e.gender,
e.age, d.depName
FROM Employee e
INNER JOIN EmpDep ed
ON e.empID = ed.empID
INNER JOIN Department d
ON ed.depID = d.depID;
/*
Different types of joins
========================
LEFT JOIN: It will return all records from the left table, including values that are shared by all tables.
RIGHT JOIN: It will return all records from the right table, including values that are shared by all tables.
INNER JOIN: It will return records that have common values in both tables.
FULL JOIN: It will return all records.
SELF or Unary JOIN: joining the table on its own.
Cross or cartesian Join: Its output will be all rows
from the first table multiplied by rows from
the second table.
*/
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
-- Insert data into salary table
DESC Salary;
SELECT *
FROM Employee;
INSERT INTO Salary(amount, bonus, empID)
VALUES(40000, 3000, 1),
	(30000, 2500, 2),
    (35000, 5000, 3);
-- INNER JOIN (Employee and Salary)
SELECT e.firstName, e.lastName, e.gender,
e.age, CONCAT('R',s.amount) AS Salary,
CONCAT('R', FORMAT(s.bonus, 2)) Bonus
FROM Employee e
INNER JOIN Salary s
USING(empID);
SELECT * FROM EmpDep;
-- USE hospitaldb;
-- DROP PROCEDURE IF EXISTS spDentists;
-- DELIMITER //
-- CREATE PROCEDURE spDentists()
-- BEGIN
-- 	SELECT id, firstName, lastname, dentistAge, contactNumb, practiceNumb
--     FROM dentists;
-- END //
-- Run procedure by using CALL keyword
-- CALL spDentists;
-- DESC dentists;
-- DROP PROCEDURE IF EXISTS spNewRecords;
-- DELIMITER //
-- CREATE PROCEDURE spNewRecords(IN id VARCHAR(10), IN firstName VARCHAR(30), IN lastName VARCHAR(30),
-- IN dentistAge INT, IN contactNumb VARCHAR(10), IN practiceNumb VARCHAR(11) )
-- BEGIN
-- 	INSERT INTO dentists
--     VALUES(id, firstName, lastName, dentistAge, contactNumb, practiceNumb);
-- END //
-- Trigger notification
-- DELIMITER //
-- CREATE TRIGGER trNotifyUser
-- BEFORE INSERT
-- ON employee FOR EACH ROW
-- BEGIN
-- 	SELECT "About to add a new record" AS "Message before inserting data";
-- END //
-- Run the below procedure
-- CALL spNewRecords('JH56982314', 'Matthew', 'Thomas', 30, 0785412566, 18574122575);
--  SELECT *
--  FROM employee;
-- EOMPdb