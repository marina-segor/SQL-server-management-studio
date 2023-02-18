/*
*
* DATA DEFINITION LANGUAGE
*
*/

-- Sélectionner une instruction et appuyer sur F1 pour aller sur la documentation

-- Commande de création d'une base de données
CREATE DATABASE entreprise_demo;
GO

-- Affiche les bases de données présentent sur le serveur
SELECT name FROM sys.databases;
GO

-- Permet de supprimer une base de données
DROP DATABASE entreprise_demo;
GO

-- Modifier une base de données
ALTER DATABASE entreprise_demo COLLATE French_CI_AS;
GO

-- Modifier le nom d'une base de données
ALTER DATABASE entreprise MODIFY NAME = entreprise_demo;
GO

-- USE permet de se positionner sur une base de données
USE entreprise_demo;
GO

-- Permet de créer une table dans la base de données
-- PRIMARY KEY indique que la colonne est une clé primaire (unique, non nulle)
-- IDENTITY permet d'indiquer que la colonne s'auto-incrémente
CREATE TABLE service (
	service_id INT IDENTITY(1,1) PRIMARY KEY,
	nom VARCHAR(100) NOT NULL
);
GO

-- Affiche les tables présentent dans la base de données
SELECT name FROM sys.tables;
GO

CREATE TABLE salarie (
	salarie_id INT IDENTITY,
	prenom VARCHAR(100) NOT NULL,
	nom VARCHAR(100) NOT NULL,
	age INT NOT NULL,
	salaire MONEY DEFAULT 1500,
	service_id INT NOT NULL,
	PRIMARY KEY(salarie_id),
	-- CONSTRAINT <nom contrainte> FOREIGN KEY(<nom colonne>)
	CONSTRAINT fk_service_id FOREIGN KEY(service_id) REFERENCES service(service_id),
	CONSTRAINT chk_age_18 CHECK(age >= 18)
);
GO

-- Affiche le détail d'une table de la base de données
exec sp_columns 'salarie';
GO

-- Permet de vérifier l'existence d'un objet
IF OBJECT_ID('salarie', 'U') IS NOT NULL
	BEGIN
	DROP TABLE salarie;
	END
GO

-- Modification d'un objet table
-- Ajout d'une colonne date modification
ALTER TABLE service
	ADD date_modification DATETIME;
GO

EXEC sp_columns 'service';
GO

-- Modification du type d'une colonne
ALTER TABLE service
	ALTER COLUMN date_modification DATE;
GO

-- Suppression d'une contrainte
ALTER TABLE salarie
	DROP CONSTRAINT DF__salarie__salaire__4316F928;

-- Ajout d'une contrainte nommée
ALTER TABLE salarie
	ADD CONSTRAINT df_salaire_1500 DEFAULT 1500 FOR salaire;