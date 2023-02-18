USE society;
GO

SELECT * FROM sys.tables
GO

SELECT * FROM personne
GO

SELECT * FROM adresse
GO

INSERT INTO 
	personne
	(nom, prenom, telephone, email)
VALUES
	--('Aten', 'John','060606006','john.aten@pouet.com'),
	('baba', 'bubu','060655555','baba.bubu@pouet.com'),
	('Jessui', 'tonpère','060666666','jessui.tonpere@pouet.com')
GO

INSERT INTO 
	adresse
	(rue, ville, code_postal, personne_id)
VALUES
	--('labas', 'ici','13000',1),
	('delarue', 'maville','13050',3),
	('lastreet', 'maville','13050',4)
GO