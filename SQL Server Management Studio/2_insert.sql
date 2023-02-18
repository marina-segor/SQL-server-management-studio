/* INSERT INTO */

USE entreprise_demo;
GO

-- M�thode 1
INSERT INTO
	[service]
VALUES
('RH', NULL);
GO

-- M�thode 2
-- Pr�cision des colonnes
INSERT INTO
	-- nom table
	entreprise_demo.dbo.service
	-- noms colonnes s�par�s par des virgules
	(nom)
VALUES
	('Marketing'),
	('Comptabilit�'),
	('SAV'),
	('Informatique')
GO

-- M�thode 3
-- INSERT INTO SELECT
INSERT INTO
	service
	(nom)
SELECT
	'communication' AS nom;
GO

SELECT * FROM service;
GO