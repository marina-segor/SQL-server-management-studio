/* INSERT INTO */

USE entreprise_demo;
GO

-- Méthode 1
INSERT INTO
	[service]
VALUES
('RH', NULL);
GO

-- Méthode 2
-- Précision des colonnes
INSERT INTO
	-- nom table
	entreprise_demo.dbo.service
	-- noms colonnes séparés par des virgules
	(nom)
VALUES
	('Marketing'),
	('Comptabilité'),
	('SAV'),
	('Informatique')
GO

-- Méthode 3
-- INSERT INTO SELECT
INSERT INTO
	service
	(nom)
SELECT
	'communication' AS nom;
GO

SELECT * FROM service;
GO