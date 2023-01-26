DROP DATABASE IF EXISTS revisionDb;
CREATE DATABASE revisionDb;
USE revisionDb;
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

INSERT INTO Employee(firstName, lastName, gender,
age)
VALUES('Lerato', 'Tshepo', 'Female', 30),
	('David', 'Henk', 'Male', 59),
    ('David', 'James', 'Male', 29);
    
INSERT INTO Department
VALUES(100, 'HR'),
	(DEFAULT, 'IT'),
    (DEFAULT, 'Dev');
    
INSERT INTO EmpDep
VALUES(700, 100, 1),
(DEFAULT, 101, 2),
(DEFAULT, 102, 2),
(DEFAULT, 101, 3),
(DEFAULT, 102, 3);
    
SELECT * FROM Employee;
SELECT * FROM Department;

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