CREATE DATABASE society;
GO

USE society;
GO

CREATE TABLE personne (
	personne_id INT IDENTITY, 
	nom VARCHAR(100) NOT NULL,
	prenom VARCHAR(100) NOT NULL,
	telephone CHAR(10) NOT NULL,
	email VARCHAR(255) NOT NULL,
	CONSTRAINT pk_personne_id PRIMARY KEY(personne_id),
	CONSTRAINT uc_telephone UNIQUE(telephone),
	CONSTRAINT uc_email UNIQUE(email),
);
GO




CREATE TABLE adresse (
	adresse_id INT IDENTITY,
	rue VARCHAR(100) NOT NULL,
	ville VARCHAR(100) NOT NULL,
	code_postal CHAR(5) NOT NULL,
	personne_id INT NOT NULL,
	CONSTRAINT pk_adresse_id PRIMARY KEY(adresse_id),
	CONSTRAINT fk_personne_id FOREIGN KEY(personne_id) REFERENCES personne(personne_id),
	
);
GO

SELECT name FROM sys.tables
GO


DROP TABLE personne
GO

DROP TABLE adresse
GO



exec sp_columns 'adresse';
GO
