DROP DATABASE IF EXISTS ShonenAnimeDB;
CREATE DATABASE ShonenAnimeDB;
USE ShonenAnimeDB;

CREATE TABLE Anime(ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT, 
Anime_Name VARCHAR(50) NOT NULL,
Genre VARCHAR(70) NOT NULL CONSTRAINT CHECK (Genre != 'Yaoi'), 
Main_Character VARCHAR(50),
Char_DOB DATE UNIQUE,
Age INT NOT NULL,
Annual_Income INT
);

-- DESC Anime;

INSERT INTO Anime VALUE(1, 'Devilman Crybaby', 'Psychological', 'Akira', '2003-03-09', 17, 690000),
(DEFAULT, 'Naruto', 'Adventure', 'Naruto', '2001-12-23', 16, 690420),
(DEFAULT, 'Vinland Saga', 'Action', 'Thorfinn', '1345-07-12', 18, 12690420),
(DEFAULT, 'Beastars', 'Slice Of Life', 'Legoshi', '1999-05-01', 20, 2790190),
(DEFAULT, 'Fruits Basket', 'Romance', 'Toru', '2003-08-03', 16, 193237230)
;

SELECT * FROM Anime;




