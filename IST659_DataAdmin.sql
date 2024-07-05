-- Creating database tables
-- Table 1: PlayerPOS
CREATE TABLE mlb_PlayerPOS (
	-- Columns for PlayerPOS table
	mlb_PlayerPOS_ID int identity,
	Position varchar(10) NOT NULL,
	-- Constraints for PlayerPOS table
	CONSTRAINT PK_mlb_PlayerPOS PRIMARY KEY (mlb_PlayerPOS_ID)
)
-- End creating PlayerPOS table

-- Table 2: WAR
CREATE TABLE mlb_WAR (
	-- Columns for WAR table
	mlb_WAR_ID int identity,
	WAR_2021 float,
	ProjWAR_2022 float NOT NULL,
	-- Constraints for WAR table
	CONSTRAINT PK_mlb_WAR PRIMARY KEY (mlb_WAR_ID)
)
-- End creating WAR table

-- Table 3: NewContract
CREATE TABLE mlb_NewContract (
	-- Columns for NewContract table
	mlb_NewContractID int identity,
	SigningTeamAbbr varchar(3) NOT NULL,
	TotalSalary varchar(50) NOT NULL,
	Years int NOT NULL,
	AAV varchar(50) NOT NULL,
	mlb_WAR_ID int NOT NULL,
	-- Contraints for NewContract table
	CONSTRAINT PK_mlb_NewContract PRIMARY KEY (mlb_NewContractID),
	CONSTRAINT FK1_mlb_NewContract FOREIGN KEY (mlb_WAR_ID) REFERENCES mlb_WAR(mlb_WAR_ID)
)
-- End creating NewContract table

-- Table 4: Player
CREATE TABLE mlb_Player (
	-- Columns for Player table
	mlb_PlayerID int identity,
	FirstName varchar(30) NOT NULL,
	LastName varchar (30) NOT NULL,
	Suffix varchar(10),
	Bats varchar(1) NOT NULL,
	Throws varchar(1) NOT NULL,
	Age int NOT NULL,
	ServiceTime float NOT NULL,
	mlb_PlayerPOS_ID int,
	mlb_WAR_ID int,
	mlb_NewContractID int,
	-- Constraints for Player table
	CONSTRAINT PK_mlb_Player PRIMARY KEY (mlb_PlayerID),
	CONSTRAINT FK1_mlb_Player FOREIGN KEY (mlb_PlayerPOS_ID) REFERENCES mlb_Player(mlb_PlayerID),
	CONSTRAINT FK2_mlb_Player FOREIGN KEY (mlb_WAR_ID) REFERENCES mlb_WAR(mlb_WAR_ID),
	CONSTRAINT FK3_mlb_Player FOREIGN KEY (mlb_NewContractID) REFERENCES mlb_NewContract(mlb_NewContractID)
)
-- End creating Player table

-- Table 5: Team
CREATE TABLE mlb_Team (
	-- Columns for Team table
	mlb_TeamID int identity,
	PreviousTeamAbbr varchar(3) NOT NULL,
	mlb_PlayerID int NOT NULL,
	-- Constraints for Team table
	CONSTRAINT PK_mlb_Team PRIMARY KEY (mlb_TeamID),
	CONSTRAINT FK1_mlb_Team FOREIGN KEY (mlb_PlayerID) REFERENCES mlb_Player(mlb_PlayerID)
)
-- End creating Team table

-- Table 6: QO
CREATE TABLE mlb_QO (
	-- Columns for QO table
	mlb_QO_ID int identity,
	QualifyingOffer int,
	mlb_TeamID int,
	-- Contraints for QO table
	CONSTRAINT PK_mlb_QO PRIMARY KEY (mlb_QO_ID),
	CONSTRAINT FK1_mlb_QO FOREIGN KEY (mlb_TeamID) REFERENCES mlb_Team(mlb_TeamID)
)
-- End creating QO table
-- End creating tables

-- Verifying tables
SELECT * FROM mlb_PlayerPOS
SELECT * FROM mlb_WAR
SELECT * FROM mlb_NewContract
SELECT * FROM mlb_Player
SELECT * FROM mlb_Team
SELECT * FROM mlb_QO
-- End verifying tables


-- Adding data
-- Adding data to the PlayerPOS table
INSERT INTO mlb_PlayerPOS
VALUES 
		('SS'), ('2B/SS'), ('CF/RF/LF'), ('SP'), ('SP'),
		('1B'), ('SP'), ('SP'), ('SS/2B'), ('SP'), ('RF/LF/DH'),
		('SS'), ('1B'), ('SP'), ('SP'), ('INF/OF'), ('3B/LF/RF'),
		('SP'), ('RF/LF/CF'), ('SS')
-- Verifying PlayerPOS data
SELECT * FROM mlb_PlayerPOS

-- Adding data to the WAR table
INSERT INTO mlb_WAR
VALUES ('6.3', '5.3'), ('6.2', '4.5'), ('5.5', '2.8'), ('5.4', '4.2'), ('4.9', '3.6'),
	   ('4.8', '4.7'), ('4.8', '3.1'), ('3.9', '3.6'), ('3.9', '2.4'), ('3.8', '3.4'),
	   ('3.7', '1.9'), ('3.7', '4.9'), ('3.4', '2.2'), ('3.4', '2.6'), ('3.4', '2.1'),
	   ('3.2', '2.1'), ('3.0', '2.3'), ('3.0', '1.4'), ('3.0', '1.9'), ('2.8', '3.8')
-- Verifying WAR data
SELECT * FROM mlb_WAR

-- Adding data to the Player table
INSERT INTO mlb_Player (FirstName, LastName, Suffix, Bats, Throws, Age, ServiceTime)
VALUES ('Carlos','Correa', NULL, 'R', 'R', '27', '6.119'),
	   ('Marcus', 'Semien', NULL, 'R', 'R', '31', '7.118'),
	   ('Starling', 'Marte', NULL, 'R', 'R', '33', '8.162'),
	   ('Max','Scherzer', NULL, 'R', 'R', '37', '13.079'),
	   ('Carlos', 'Rodon', NULL, 'L', 'L', '29', '6.168'),
	   ('Freddie', 'Freeman', NULL, 'L', 'R', '32', '11.033'),
	   ('Kevin','Gausman', NULL, 'L', 'R', '31', '7.151'),
	   ('Robbie', 'Ray', NULL, 'L', 'L', '30', '7.007'),
	   ('Javier', 'Baez', NULL, 'R', 'R', '29', '6.089'),
	   ('Eduardo','Rodriguez', 'Jr.', 'L', 'L', '29', '6.130'),
	   ('Nick', 'Castellanos', NULL, 'R', 'R', '30', '8.029'),
	   ('Corey', 'Seager', NULL, 'L', 'R', '28', '6.032'),
	   ('Brandon','Belt', NULL, 'L', 'L', '34', '10.128'),
	   ('Clayton', 'Kershaw', NULL, 'L', 'L', '34', '13.105'),
	   ('Marcus', 'Stroman', NULL, 'R', 'R', '31', '7.026'),
	   ('Chris','Taylor', NULL, 'R', 'R', '31', '6.037'),
	   ('Kris', 'Bryant', 'Jr.', 'R', 'R', '30', '6.171'),
	   ('Anthony', 'DeSclafani', NULL, 'R', 'R', '32', '7.062'),
	   ('Mark','Canha', 'Sr.', 'R', 'R', '33', '6.092'),
	   ('Trevor', 'Story', NULL, 'R', 'R', '29', '6.000')
-- Verifying Player data
SELECT * FROM mlb_Player

-- Adding data to the Team table
INSERT INTO mlb_Team (PreviousTeamAbbr, mlb_PlayerID)
VALUES ('HOU', '1'), ('TOR', '2'), ('OAK', '3'), ('LAD', '4'), ('CHW', '5'),
	   ('ATL', '6'), ('SFG', '7'), ('TOR', '8'), ('NYM', '9'), ('BOS', '10'),
	   ('CIN', '11'), ('LAD', '12'), ('SFG', '13'), ('LAD', '14'), ('NYM', '15'),
	   ('LAD', '16'), ('SFG', '17'), ('SFG', '18'), ('OAK', '19'), ('COL', '20')
-- Verifying Team data
SELECT * FROM mlb_Team

-- Adding data to the QO table
INSERT INTO mlb_QO (QualifyingOffer)
VALUES	('18400000'), ('18400000'), (NULL), (NULL), (NULL), 
	    ('18400000'), (NULL), ('18400000'), (NULL), 
		('18400000'), ('18400000'), ('18400000'),
		('18400000'), (NULL), (NULL), ('18400000'), (NULL),
		(NULL), (NULL), (NULL), ('18400000')
-- Verifying QO data
SELECT * FROM mlb_QO

-- Adding data to NewContract table
INSERT INTO mlb_NewContract (SigningTeamAbbr, TotalSalary, Years, AAV, mlb_WAR_ID)
VALUES ('MIN', '$105,300,000', '3', '$35,100,000', '1'),
	   ('TEX', '$175,000,000', '7', '$25,000,000', '2'),
	   ('NYM', '$78,000,000', '4', '$19,500,000', '3'),
	   ('NYM', '$130,000,000', '3', '$43,333,334', '4'),
	   ('SFG', '$44,000,000', '2', '$22,000,000', '5'),
	   ('LAD', '$162,000,000', '6', '$24,700,000', '6'),
	   ('TOR', '$110,000,000', '5', '$22,000,000', '7'),
	   ('SEA', '$115,000,000', '5', '$23,000,000', '8'),
	   ('DET', '$140,000,000', '6', '$23,333,334', '9'),
	   ('DET', '$77,000,000', '5', '$15,400,000', '10'),
	   ('PHI', '$100,000,000', '5', '$20,000,000', '11'),
	   ('TEX', '$325,000,000', '10', '$32,500,000', '12'),
	   ('SFG', '$18,400,000', '1', '$18,400,000', '13'),
	   ('LAD', '$17,000,000', '1', '$17,000,000', '14'),
	   ('CHC', '$71,000,000', '3', '$23,666,667', '15'),
	   ('LAD', '$60,000,000', '4', '$15,000,000', '16'),
	   ('COL', '$182,000,000', '7', '$26,000,000', '17'),
	   ('SFG', '$36,000,000', '3', '$12,000,000', '18'),
	   ('NYM', '$26,500,000', '2', '$13,250,000', '19'),
	   ('BOS', '$140,000,000', '6', '$23,333,334', '20')
-- Verifying NewContract data
SELECT * FROM mlb_NewContract
-- End adding data
-- Verifying added data
SELECT * FROM mlb_PlayerPOS
SELECT * FROM mlb_WAR
SELECT * FROM mlb_Player
SELECT * FROM mlb_Team
SELECT * FROM mlb_QO
SELECT * FROM mlb_NewContract
-- end verifying

-- Updating columns
-- Updating QO table
ALTER TABLE mlb_QO
ALTER COLUMN QualifyingOffer varchar(50)

TRUNCATE TABLE mlb_QO
SELECT * FROM mlb_QO

-- Adding data to the QO table
INSERT INTO mlb_QO (QualifyingOffer, mlb_TeamID)
VALUES	('offered', '5'), ('offered', '6'), ('offered', '7'), ('offered', '8'), 
		('offered', '9'), ('offered', '10'), ('offered', '11'), ('offered', '12'),
		('offered', '13'), ('offered', '14'), ('offered', '15'), ('offered', '16'),
		('offered', '17'), ('offered', '18'), ('offered', '19'), ('offered', '20'),
		('offered', '21'), ('offered', '22'), ('offered', '23'), ('offered', '24')
-- Verifying QO data
SELECT * FROM mlb_QO
-- End updating QO table

ALTER TABLE mlb_QO
ALTER COLUMN QualifyingOffer varchar(50)

TRUNCATE TABLE mlb_QO
SELECT * FROM mlb_QO

-- Adding data to the QO table
INSERT INTO mlb_QO (QualifyingOffer, mlb_TeamID)
VALUES	('offered', '5'), ('offered', '6'), ('not offered', '7'), ('not offered', '8'), 
		('not offered', '9'), ('offered', '10'), ('not offered', '11'), ('offered', '12'),
		('not offered', '13'), ('offered', '14'), ('offered', '15'), ('offered', '16'),
		('offered', '17'), ('not offered', '18'), ('not offered', '19'), ('offered', '20'),
		('not offered', '21'), ('not offered', '22'), ('not offered', '23'), ('offered', '24')
-- Verifying QO data
SELECT * FROM mlb_QO

-- Updating Player table
TRUNCATE TABLE mlb_Player
SELECT * FROM mlb_Player

-- Adding data to the Player table
INSERT INTO mlb_Player (FirstName, LastName, Suffix, Bats, Throws, Age, ServiceTime, mlb_PlayerPOS_ID, mlb_WAR_ID, mlb_NewContractID)
VALUES ('Carlos','Correa', NULL, 'R', 'R', '27', '6.119', '1', '1', '3'),
	   ('Marcus', 'Semien', NULL, 'R', 'R', '31', '7.118', '2', '2', '4'),
	   ('Starling', 'Marte', NULL, 'R', 'R', '33', '8.162', '3', '3', '5'),
	   ('Max','Scherzer', NULL, 'R', 'R', '37', '13.079', '4', '4', '6'),
	   ('Carlos', 'Rodon', NULL, 'L', 'L', '29', '6.168', '5', '5', '7'),
	   ('Freddie', 'Freeman', NULL, 'L', 'R', '32', '11.033', '6', '6', '8'),
	   ('Kevin','Gausman', NULL, 'L', 'R', '31', '7.151', '7', '7', '9'),
	   ('Robbie', 'Ray', NULL, 'L', 'L', '30', '7.007', '8', '8', '10'),
	   ('Javier', 'Baez', NULL, 'R', 'R', '29', '6.089', '9', '9', '11'),
	   ('Eduardo','Rodriguez', 'Jr.', 'L', 'L', '29', '6.130', '10', '10', '12'),
	   ('Nick', 'Castellanos', NULL, 'R', 'R', '30', '8.029', '11', '11', '13'),
	   ('Corey', 'Seager', NULL, 'L', 'R', '28', '6.032', '12', '12', '14'),
	   ('Brandon','Belt', NULL, 'L', 'L', '34', '10.128', '13', '13', '15'),
	   ('Clayton', 'Kershaw', NULL, 'L', 'L', '34', '13.105', '14', '14', '16'),
	   ('Marcus', 'Stroman', NULL, 'R', 'R', '31', '7.026', '15', '15', '17'),
	   ('Chris','Taylor', NULL, 'R', 'R', '31', '6.037', '16', '16', '18'),
	   ('Kris', 'Bryant', 'Jr.', 'R', 'R', '30', '6.171', '17', '17', '19'),
	   ('Anthony', 'DeSclafani', NULL, 'R', 'R', '32', '7.062', '18', '18', '20'),
	   ('Mark','Canha', 'Sr.', 'R', 'R', '33', '6.092', '19', '19', '21'),
	   ('Trevor', 'Story', NULL, 'R', 'R', '29', '6.000', '20', '20', '22')
-- Verifying Player data
SELECT * FROM mlb_Player
-- End updating Player table


-- Answering Data Questions

-- Question 1: Do players who play a certain position have higher AAVs than others?
SELECT mlb_Player.FirstName, mlb_Player.LastName, mlb_PlayerPOS.Position, mlb_NewContract.AAV
FROM mlb_Player
JOIN mlb_PlayerPOS ON mlb_Player.mlb_PlayerPOS_ID=mlb_PlayerPOS.mlb_PlayerPOS_ID
JOIN mlb_NewContract ON mlb_NewContract.mlb_NewContractID=mlb_PlayerPOS.mlb_PlayerPOS_ID
ORDER BY mlb_PlayerPOS.Position DESC

SELECT  
	mlb_PlayerPOS.Position, 
	mlb_NewContract.AAV
FROM mlb_PlayerPOS
JOIN mlb_NewContract ON mlb_PlayerPOS.mlb_PlayerPOS_ID=mlb_NewContract.mlb_NewContractID
ORDER BY mlb_PlayerPOS.Position DESC
/*
	By JOINing the Player, PlayerPOS, and NewContract tables, 

*/

-- Question 2: Are older players (32+) guaranteed to have shorter NewContract lenghts?
-- First we will determine how many players are at least 32 years old.
SELECT mlb_Player.FirstName, mlb_Player.LastName, mlb_Player.Age, mlb_NewContract.Years
FROM mlb_Player
JOIN mlb_NewContract ON mlb_Player.mlb_NewContractID=mlb_NewContract.mlb_NewContractID
WHERE mlb_Player.Age >= 32
ORDER BY mlb_Player.Age DESC
-- It seems that there are 7 players that are 32 years old.
-- Now we will add the 3 year contract maximum to our WHERE statement.
SELECT mlb_Player.FirstName, mlb_Player.LastName, mlb_Player.Age, mlb_NewContract.Years
FROM mlb_Player
JOIN mlb_NewContract ON mlb_Player.mlb_NewContractID=mlb_NewContract.mlb_NewContractID
WHERE mlb_Player.Age >= 32 AND mlb_NewContract.Years < 4
ORDER BY mlb_Player.Age DESC

-- Question 3: Are players resigning with their 2021 teams?
SELECT 
	mlb_Player.FirstName, 
	mlb_Player.LastName, 
	mlb_Team.PreviousTeamAbbr,
	mlb_NewContract.SigningTeamAbbr
FROM mlb_Player
JOIN mlb_Team ON mlb_Player.mlb_PlayerID=mlb_Team.mlb_PlayerID
JOIN mlb_NewContract ON mlb_NewContract.mlb_NewContractID=mlb_Team.mlb_TeamID
WHERE mlb_Team.PreviousTeamAbbr = mlb_NewContract.SigningTeamAbbr
ORDER BY mlb_Team.PreviousTeamAbbr

-- Question 4: Do players with more service time have higher AAV than others?
-- ServiceTime in descending order
SELECT mlb_Player.FirstName, mlb_Player.LastName, mlb_Player.ServiceTime, mlb_NewContract.AAV
FROM mlb_Player
JOIN mlb_NewContract ON mlb_Player.mlb_NewContractID=mlb_NewContract.mlb_NewContractID
ORDER BY mlb_Player.ServiceTime DESC
-- AAV in descending order
SELECT mlb_Player.FirstName, mlb_Player.LastName, mlb_Player.ServiceTime, mlb_NewContract.AAV
FROM mlb_Player
JOIN mlb_NewContract ON mlb_Player.mlb_NewContractID=mlb_NewContract.mlb_NewContractID
ORDER BY mlb_NewContract.AAV DESC

/*
	By JOINing the mlb_Player and mlb_ NewContract tables, we can see that Players with more
	ServiceTime do not necessarily have higher AAVs in their NewContracts. For example, while
	Max Scherzer has both the highest ServiceTime (13.079 ) and AAV ($43,333,334), Clayton 
	Kershaw, who has the second highest ServiceTime (13.105), has the 16th highest AAV 
	($17,000,000).
*/

-- Question 5: Are teams signing players that have Qualifying Offers to long-term (4+) NewContracts?
--SELECT mlb_Player.FirstName, mlb_Player.LastName, mlb_QO.QualifyingOffer, mlb_NewContract.Years
--FROM mlb_Player
--JOIN mlb_NewContract ON 




-- Question 6: Are players with higher WAR_2021 being paid larger TotalSalaries than others?
SELECT
	mlb_Player.FirstName, 
	mlb_Player.LastName,
	mlb_WAR.WAR_2021,
	mlb_NewContract.TotalSalary
FROM mlb_Player
JOIN mlb_WAR ON mlb_Player.mlb_WAR_ID=mlb_WAR.mlb_WAR_ID
JOIN mlb_NewContract ON mlb_NewContract.mlb_WAR_ID=mlb_WAR.mlb_WAR_ID
ORDER BY mlb_WAR.WAR_2021 DESC

SELECT
	mlb_Player.FirstName, 
	mlb_Player.LastName,
	MAX(mlb_WAR.WAR_2021) as Highest_WAR,
	MAX(mlb_NewContract.TotalSalary) as Highest_TotalSalary
FROM mlb_Player
JOIN mlb_WAR ON mlb_Player.mlb_WAR_ID=mlb_WAR.mlb_WAR_ID
JOIN mlb_NewContract ON mlb_NewContract.mlb_WAR_ID=mlb_WAR.mlb_WAR_ID
GROUP BY mlb_Player.FirstName, mlb_Player.LastName, mlb_WAR.WAR_2021, mlb_NewContract.TotalSalary
ORDER BY mlb_NewContract.TotalSalary DESC

SELECT
	mlb_WAR.WAR_2021,
	mlb_NewContract.TotalSalary
FROM mlb_WAR
JOIN mlb_NewContract ON mlb_NewContract.mlb_WAR_ID=mlb_WAR.mlb_WAR_ID
ORDER BY mlb_WAR.WAR_2021 DESC


-- Question 5: How many Starting Pitchers (SP) received NewContracts of 5 years or more?
-- First, me must see how many SP are in our database.
SELECT
	mlb_PlayerPOS.Position,
	COUNT(*) as headcount
FROM mlb_PlayerPOS
WHERE mlb_PlayerPOS.Position = 'SP'
GROUP BY mlb_PlayerPOS.Position
ORDER BY headcount DESC
-- We see that there are 8 SPs. 
-- Now, we will see how many SPs received NewContracts of 5 years or more.
SELECT
	mlb_Player.FirstName,
	mlb_Player.LastName,
	mlb_PlayerPOS.Position,
	mlb_NewContract.Years
FROM mlb_Player
JOIN mlb_PlayerPOS ON mlb_Player.mlb_PlayerPOS_ID=mlb_PlayerPOS.mlb_PlayerPOS_ID
JOIN mlb_NewContract ON mlb_NewContract.mlb_NewContractID=mlb_PlayerPOS.mlb_PlayerPOS_ID
WHERE mlb_PlayerPOS.Position = 'SP' AND mlb_NewContract.Years >= 5
GROUP BY mlb_Player.FirstName, mlb_Player.LastName, mlb_PlayerPOS.Position, mlb_NewContract.Years


-- Question 6: Are players aged 32 and older receiving qualifying offers?
-- All players aged 32 and older.
SELECT 
	mlb_Player.FirstName, 
	mlb_Player.LastName,
	mlb_Player.Age,
	mlb_QO.QualifyingOffer
FROM mlb_Player
JOIN mlb_QO ON mlb_Player.mlb_PlayerID=mlb_QO.mlb_QO_ID
WHERE mlb_Player.Age >= 32
ORDER BY mlb_Player.Age DESC

-- Players 32+ and were offered a QO.
SELECT 
	mlb_Player.FirstName, 
	mlb_Player.LastName,
	mlb_Player.Age,
	mlb_QO.QualifyingOffer
FROM mlb_Player
JOIN mlb_QO ON mlb_Player.mlb_PlayerID=mlb_QO.mlb_QO_ID
WHERE mlb_Player.Age >= 32 AND mlb_QO.QualifyingOffer = 'offered'
ORDER BY mlb_Player.Age DESC

-- Question 1: Do players with higher ProjWAR_2022 receiving higher AAV than others?
-- Question 1: How many players will have an average ProjWAR_2022?
-- First we will find the average ProjWAR_2022.
SELECT
	AVG(mlb_WAR.ProjWAR_2022) as avg_ProjWAR
FROM mlb_WAR
-- The average ProjWAR_2022 is 3.14.
-- Next, we will discover how many players have a ProjWAR_2022 of average or better.
SELECT
	COUNT(mlb_WAR.ProjWAR_2022) as total_ProjWAR_2022
FROM mlb_WAR
WHERE mlb_WAR.ProjWAR_2022 >= 3.14
-- Lastly, we will list players who have a ProjWAR_2022 >= 3.14.
SELECT
	mlb_Player.FirstName,
	mlb_Player.LastName,
	mlb_WAR.ProjWAR_2022
FROM mlb_Player
JOIN mlb_WAR ON mlb_Player.mlb_WAR_ID=mlb_WAR.mlb_WAR_ID
WHERE mlb_WAR.ProjWAR_2022 >= 3.14
ORDER BY mlb_WAR.ProjWAR_2022 DESC