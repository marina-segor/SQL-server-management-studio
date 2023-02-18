/* DDL DATA DEFINITION LANGUAGE
	CREER ET MANIPULER DES OBJETS
*/
--Commande de création d'une base de données
CREATE DATABASE ma_base_a_moua
GO --permet de séparer les requêtes

--Affiche les bases de données présentes sur le serveur
SELECT name FROM sys.databases
GO

DROP DATABASE ma_base_a_moua --supprimer 
GO

ALTER DATABASE ma_base_a_moua COLLATE French_CI_AS
GO

--modifier nom bdd
ALTER DATABASE ma_base_a_moua MODIFY NAME = ma_bdd
GO

--Permet de selectionner une BDD
USE ma_bdd
GO 

--utilisation des crochets pr pouvoir utiliser des mots réservés
--toute table commence par une clé primaire PRIMARY KEY
-- IDENTITY permet que la table s'auto incrémente
CREATE TABLE [service] (
	service_id INT IDENTITY (1, 1) PRIMARY KEY, 
	nom VARCHAR(100) NOT NULL
);
GO

--affiche une table dans la BDD
SELECT name FROM sys.tables
GO

SELECT * FROM sys.tables
GO

CREATE TABLE salarie (
	salarie_id INT IDENTITY,
	prenom VARCHAR(100) NOT NULL,
	nom VARCHAR(100) NOT NULL,
	age INT NOT NULL,
	salaire MONEY DEFAULT 1500,
	service_id INT NOT NULL,
	PRIMARY KEY (salarie_id),
	CONSTRAINT fk_service_id FOREIGN KEY(service_id) REFERENCES service(service_id),
	CONSTRAINT chk_age_18 CHECK(age >= 18)
);
GO

-- affiche le detail d'une table de la base de données
exec sp_columns 'salarie';
GO

IF OBJECT_ID('salarie', 'U') IS NOT NULL
--supprimer une table
DROP TABLE salarie
GO

ALTER TABLE service
	ADD date_modification DATETIME
GO

EXEC sp_columns 'service';
GO

--Modification du type d'une colonne
ALTER TABLE service
	ALTER COLUMN date_modification DATE;
GO
-- suppression d'une contrainte
ALTER TABLE salarie
	DROP CONSTRAINT DF_salarie_salaire_4316F928;
GO

--Ajout d'une contrainte nommée
ALTER TABLE df_salaire_1500 
	ADD CONSTRAINT df_salaire_1500 DEFAULT 1500 FOR salaire;
GO
