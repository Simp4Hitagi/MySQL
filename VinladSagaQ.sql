DROP DATABASE IF EXISTS VinlandSagaDB;
CREATE DATABASE VinlandSagaDB;
USE VinlandSagaDB;

CREATE TABLE Heroes(ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
HfirstName VARCHAR(20), 
HlastName VARCHAR(30), 
Hage INT, Hpay INT);

CREATE TABLE Villians(ID INT NOT NULL, 
VfirstName VARCHAR(20), 
VlastName VARCHAR(30), 
Vage INT, CONSTRAINT VFKey FOREIGN KEY(ID) REFERENCES Heroes(ID),
Vpay INT);

INSERT INTO Heroes VALUES(1, 'Thorfinn', 'Tors', 16, 10002),
(DEFAULT, 'Askeladd', 'Choppyhead', 48, 3262),
(DEFAULT, 'Troll', 'OfJohm', 76, 32231),
(DEFAULT, 'Ragnar', 'Bethelthyme', 35, 6373),
(DEFAULT, 'Bjorn', 'Bethelthyme', 12, 27676);

INSERT INTO Villians VALUES(1, 'King', 'Douce', 69, 202),
(2, 'Kanut', 'FlappySkin', 14, 1512),
(3, 'Rollo', 'Drools', 82, 2112),
(4, 'Lorde', 'Inscuere', 119, 9387),
(5, 'Duede', 'Hawst', 29, 92931);

UPDATE Heroes
SET Hage = 17
WHERE ID = 1;

DELETE
FROM Villians
WHERE ID BETWEEN 1 AND 3;



SELECT * FROM Heroes;
SELECT * FROM Villians;

SELECT HfirstName, HlastName, Hage
FROM Heroes
WHERE Hage IN (
SELECT Hage
FROM Heroes
WHERE Hage BETWEEN 2 AND 4);

SELECT h.HfirstName, h.HlastName, h.Hage, h.Hpay, v.VfirstName, v.VlastName, v.Vage, v.Vpay
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

