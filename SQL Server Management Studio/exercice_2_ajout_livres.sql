CREATE DATABASE correction_exercice_2;
GO

USE correction_exercice_2;
GO

-- Q1
CREATE TABLE livre (
	id INT IDENTITY,
	titre VARCHAR(150),
	auteur VARCHAR(50),
	editeur VARCHAR(50),
	date_publication DATE,
	isbn_10 VARCHAR(10),
	isbn_13 VARCHAR(15),
	CONSTRAINT pk_livre_id PRIMARY KEY(id)
);

-- Q2
INSERT INTO livre (titre, auteur, editeur, date_publication, isbn_10, isbn_13)
VALUES 
('Poil de Carrottes','Jules Renard','Livre de Poche','1999-08-25','2253160431','978-2253160434'),
('Les Fourberies de Scapin','Moli�re','Hachette Education','2016-04-13','2013949677','978-2013949675'),
('Les Cahiers de Douai','Arthur Rimbaud','Nathan','2018-05-04','2091891231','978-2091891231'),
('Cyrano de Bergerac','Edmond Rostand','Nathan','2018-05-03','2091887005','978-2091887005'),
('Dom Juan','Moli�re','Nathan','2018-08-23','2091891185','978-2091891187'),
('Le Cid','Corneille','Nathan','2017-08-24','2091887595','978-2091887593'),
('Les Fausses Confidences','Marivaux','Nathan','2020-08-20','2091512184','978-2091512181'),
('Les Fleurs du Mal','Charles Baudelaire','Nathan','2020-01-02','2091864951','978-2091864952'),
('Le rouge et le noir','Stendhal','Folio CLassique','1967-01-01','2070412393','978-2070412396'),
('Madame Bovary','Gustave Flaubert','Livre de Poche','2019-05-22','2253183466','978-2253183464'),
('La Chartreuse de Parme','Stendhal','Livre de Poche','2020-09-01','2253160687','978-2253160687'),
('La Rabouilleuse','Honor� de Balzac','Editeur ind�pendant','2020-04-12','XXXXXXXXXX','979-8636546696'),
('Illusions perdues','Honor� de Balzac','Livre de Poche','2006-08-23','2253085707','978-2253085706'),
('L''Education sentimentale','Gustave Flaubert','Livre de Poche','2002-05-16','2253010693','978-2253010692'),
('Mort sur le Nil','Agatha Christie','Livre de Poche','2014-08-20','201005640X','978-2010056406'),
('Le crime de l''Orient-Express','Agatha Christies','Livre de Poche','2014-08-20','2010009274','978-2010009273'),
('Un cadavre dans la biblioth�que','Agatha Christie','Livre de Poche','2015-06-03','2012202403','978-2012202405'),
('Le train bleu','Agatha Christie','Livre de Poche','2014-08-14','2010056450','978-2010056451'),
('Entretiens sur la multitude du monde','Jean-Claude Carri�re','Odile Jacob','2002-09-21','2738110770','978-2738110770'),
('Discours de la m�thode','Ren� Descartes','Editeur ind�pendant','2017-02-03','XXXXXXXXXX','979-8649135313'),
('La R�publique','Platon','Livre de Poche','2016-06-22','2081386690','978-2081386693'),
('Les Politiques','Aristote','Flammarion','2015-04-22','2081358778','978-2081358775'),
('Le Banquet','Platon','Flammarion','2015-04-22','2081382644','978-2081382640'),
('Le gai savoir','Platon','Editeur ind�pendant','2019-07-05','XXXXXXXXXX','979-8658807928'),
('Stop aux r�seaux sociaux ! 10 bonnes raisons de s''en m�fier et de s en lib�rer','Jaron Lanier','DE BOECK SUP','2020-03-17','2807329098','978-2807329096'),
('Transformer votre vie: 19 pistes pour am�liorer mes relations, me lib�rer de mes pens�es n�gatives et r�aliser mes r�ves !','Julie Guerri�re Pacifique','Club Positif','2020-01-22','2373181797','978-2373181791'),
('Rem�dier � l''insatisfaction: Un guide pratique pour faire face aux probl�mes de la vie quotidienne','Carlo di Portago','Editeur ind�pendant','2020-11-22','XXXXXXXXXX','979-8569448883'),
('L�ve-toi et Vends !','Nicolas Caron','Editeur ind�pendant','2017-09-28','1723716723','978-1723716720'),
('Pens�e positive et optimisme: Les deux grands principes pour r�ussir sa vie ','Christian Dubois','Editeur ind�pendant','2021-01-07','XXXXXXXXXX','979-8591746797'),
('LE GUIDE DE LA PENS�E POSITIVE: Comment ma�triser le pouvoir de la pens�e pour vivre heureux et atteindre ses objectifs','Vincent Crivelli','Editeur ind�pendant','2021-02-02','XXXXXXXXXX','979-8703516423');
GO

-- Q3
SELECT
	TOP(10)
	*
FROM
	livre
ORDER BY
	date_publication;
GO

-- Q4
SELECT
	TOP(10)
	titre,
	auteur,
	date_publication
FROM
	livre
ORDER BY
	date_publication;
GO

-- Q5
SELECT
	titre,
	auteur
FROM
	livre
WHERE
	auteur = 'Agatha Christie';
GO

-- Q6
SELECT
	titre,
	auteur
FROM
	livre
WHERE
	auteur = 'Agatha Christies';
GO

UPDATE
	livre
SET
	auteur = 'Agatha Christie'
WHERE
	auteur = 'Agatha Christies';
GO

-- Q7
INSERT INTO
	livre
	(titre, auteur, editeur, date_publication, isbn_10, isbn_13)
VALUES
	('�a �pate les filles...', 'Zep', 'Gl�nat', '2001-06-14', '2723417433', '272-341743-3123');
GO

SELECT
	TOP(1)
	*
FROM
	livre
ORDER BY
	id DESC;

-- Q8
DELETE FROM
	livre
WHERE
	auteur = 'Platon'
	AND
	titre = 'Le Banquet';
GO

SELECT
	titre,
	auteur
FROM
	livre
WHERE
	auteur = 'Platon';
GO