DROP DATABASE IF EXISTS VinlandSagaDB;
CREATE DATABASE VinlandSagaDB;
USE VinlandSagaDB;

CREATE TABLE Heroes(ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
HfirstName VARCHAR(20), 
HlastName VARCHAR(30), 
Hage INT, Hpay INT, Hdate DATE);

CREATE TABLE Villians(ID INT NOT NULL, 
VfirstName VARCHAR(20), 
VlastName VARCHAR(30), 
Vage INT, CONSTRAINT VFKey FOREIGN KEY(ID) REFERENCES Heroes(ID),
Vpay INT, Vdate DATE);

INSERT INTO Heroes VALUES(1, 'Thorfinn', 'Tors', 16, 10002, '2022-03-15'),
(DEFAULT, 'Askeladd', 'Choppyhead', 48, 3262, '2023-04-23'),
(DEFAULT, 'Troll', 'OfJohm', 76, 32231, '2022-02-20'),
(DEFAULT, 'Ragnar', 'Bethelthyme', 35, 6373, '2032-03-31'),
(DEFAULT, 'Bjorn', 'Bethelthyme', 12, 27676, '1999-12-25');

INSERT INTO Villians VALUES(1, 'King', 'Douce', 69, 202, '2003-09-08'),
(2, 'Kanut', 'FlappySkin', 14, 1512, '2023-01-26'),
(3, 'Rollo', 'Drools', 82, 2112, '1832-07-07'),
(4, 'Lorde', 'Inscuere', 119, 9387, '1783-12-04'),
(5, 'Duede', 'Hawst', 29, 92931, '2001-02-21');

UPDATE Heroes
SET Hage = 17
WHERE ID = 1;

-- DELETE
-- FROM Villians
-- WHERE ID BETWEEN 1 AND 3;



SELECT * FROM Heroes;
SELECT * FROM Villians;

SELECT HfirstName, HlastName, Hage
FROM Heroes
WHERE Hage IN (
SELECT Hage
FROM Heroes
WHERE Hage BETWEEN 2 AND 4);

SELECT h.HfirstName, h.HlastName, h.Hage, h.Hpay, h.Hdate , v.VfirstName, v.VlastName, v.Vage, v.Vpay, v.Vdate
FROM Heroes h
INNER JOIN Villians v
ON h.ID = v.ID;

SELECT *
FROM Heroes
WHERE HfirstName LIKE '%';

SELECT COUNT(*) 'Number of Ragnar'
FROM Heroes
WHERE HfirstName = 'Ragnar';

SELECT MAX(v.Vage) 'Age'
FROM Villians v
INNER JOIN Heroes h
USING(ID);

-- SELECT CONCAT('R', FORMAT(00000,00,  'v.Vpay'))'Pay'
SELECT CONCAT('R', FORMAT(v.Vpay, 2)) 'Pay'
FROM Villians v
INNER JOIN Heroes 
USING(ID);
-- MAKING SQL MODE LESS STRICT
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

SELECT SUM(v.Vpay) 'Total'
FROM Villians v
INNER JOIN Heroes h
USING(ID);

CREATE INDEX idx_HfirstName
ON Heroes(HfirstName);

CREATE VIEW HandV AS
	SELECT h.HfirstName, h.HlastName, h.Hage,
	v.Vpay, v.Vdate
	FROM Heroes h
	INNER JOIN Villians v
	USING(ID);
SELECT *
FROM Handv;


SELECT h.HfirstName, h.HlastName, h.Hage, h.Hdate,
CONCAT('R', FORMAT(v.Vpay, 2)) 'Villians Pay'
FROM Heroes h
LEFT JOIN Villians v
USING (ID);


    

