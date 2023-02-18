/* SELECT */

-- SELECT [colonnes,] FROM [table]
-- '*' correspond � l'ensemble des colonnes
SELECT
	*
FROM
	service;

-- S�lectionner des colonnes pr�cises
SELECT
	nom,
	date_modification
FROM
	service;

/* FROM */

-- Pr�fixer les colonnes du nom de la table
-- (utile pour les ambiguit�s lors de jointures)
SELECT
	service.nom,
	service.date_modification
FROM
	service;

SELECT
	salarie_id,
	prenom,
	nom
FROM
	salarie;

-- S�lectionner des informations de plusieurs tables
-- /!\ pr�f�rer les jointures
SELECT
	*
FROM
	salarie, service
WHERE
	salarie.service_id = service.service_id;

/* WHERE */

SELECT
	prenom,
	nom,
	salaire
FROM
	salarie
WHERE
	salaire > 2000;
GO

SELECT
	prenom,
	age
FROM
	salarie
WHERE
	-- age >= 25 AND age <= 30
	age BETWEEN 25 AND 30;

SELECT
	prenom,
	age,
	salaire
FROM
	salarie
WHERE
	(age BETWEEN 30 AND 40)
	AND
	(salaire > 1800);

-- Permet de d�finir un nombre d'enregistrements � retourner
SELECT
	TOP(2) 
	prenom, 
	nom,
	salaire
FROM
	salarie;

/* DISTINCT */
-- Supprime les doublons par rapport � une ligne
SELECT
	DISTINCT prenom
FROM
	salarie;

-- Aucun doublon, car chaque ligne est diff�rente
SELECT
	DISTINCT prenom,
	salarie_id
FROM
	salarie;

/* ALIAS */
-- Utilisation du mot cl� AS pour l'alias
SELECT
	nom AS nom_employe, -- nom sans caract�re sp�ciaux
	prenom AS 'Pr�nom du salari�' -- utilisation des guillemets simples
FROM
	salarie;

-- L'espace apr�s un nom de colonne permet �galement de cr�er un alias
-- Possibilit� d'utiliser des alias sur des tables
SELECT
	s.nom n, -- alias avec le caract�re espace
	s.prenom p
FROM
	salarie AS s

/* OPERATEUR WHERE */
SELECT
	prenom
FROM
	salarie
WHERE
	-- Commence par la lettre m
	-- prenom LIKE 'm%';
	-- Fini par la lettre e
	-- prenom LIKE '%e'
	-- Contient la lettre l
	prenom LIKE '%l%';
GO

-- IN (liste)
SELECT
	prenom,
	service_id
FROM
	salarie
WHERE
	service_id IN (13, 18, 16);
GO

/* ORDER BY */
SELECT
	prenom,
	nom
FROM
	salarie
ORDER BY
	prenom; -- Par d�faut trie croissant : ASC

-- Trie sur plusieurs colonnes dans l'ordre sp�cifi�
SELECT
	prenom,
	nom
FROM
	salarie
ORDER BY
	prenom DESC, nom;

/* SOUS REQU�TE */

-- Sous requ�te sous forme de table
SELECT
	nom,
	prenom
FROM
	(SELECT * FROM salarie WHERE prenom like 'm%') AS nom_en_m
WHERE
	salaire > 1800;
GO

-- Utilisation d'une sous-requ�te sous forme de liste
SELECT
	*
FROM
	salarie
WHERE
	service_id IN (SELECT service_id FROM service WHERE nom LIKE '%m%');
GO

-- Utilisation d'une sous requ�te sous forme de scalaire
SELECT
	prenom,
	nom,
	salaire
FROM
	salarie
WHERE
	service_id = (SELECT service_id FROM service WHERE nom = 'SAV');

/* FONCTIONS AGGREGATIONS */
-- Compter le nombre d'enregistrements
SELECT
	COUNT(*) AS nombre_enregistrements
FROM
	salarie;

SELECT
	MAX(age) AS age_max
FROM
	salarie;

SELECT
	MIN(age) AS age_min
FROM
	salarie;

SELECT
	SUM(salaire) AS somme_salaire
FROM
	salarie;

SELECT
	AVG(salaire) AS salaire_moyen
FROM
	salarie;

-- GROUP BY permet de regrouper les enregistrements par rapport � une colonne
SELECT
	service_id,
	AVG(salaire) AS salaire_moyen_par_service,
	COUNT(*) AS personne_par_service
FROM
	salarie
GROUP BY
	service_id;

-- HAVING permet d'effectuer une condition apr�s une fonction d'aggr�gation
SELECT
	service_id,
	AVG(salaire) AS salaire_moyen_par_service,
	COUNT(*) AS personne_par_service
FROM
	salarie
GROUP BY
	service_id
HAVING
	AVG(salaire) >= 2000;

/* REQUETE CORRELEE */
SELECT
	nom,
	salaire
FROM
	salarie AS chaque_employe
WHERE
	salaire > (
	SELECT
		AVG(salaire)
	FROM
		salarie AS groupe_employe
	WHERE
		chaque_employe.service_id = groupe_employe.service_id
	)

SELECT * FROM salarie;

/* JOINTURES */
SELECT
	service.nom AS service,
	salarie.prenom,
	salarie.nom
FROM
	salarie
INNER JOIN service ON salarie.service_id = service.service_id;
GO

SELECT
	service.nom AS service,
	AVG(salaire) AS moyenne_salaire
FROM
	service
	LEFT JOIN salarie ON salarie.service_id = service.service_id
GROUP BY
	service.nom
ORDER BY
	moyenne_salaire, service
GO