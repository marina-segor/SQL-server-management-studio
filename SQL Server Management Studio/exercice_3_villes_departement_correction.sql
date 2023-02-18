USE correction_exercice_3;
GO

SELECT TOP(10) * FROM villes_france_free; GO
SELECT TOP(10) * FROM departement; GO

-- Q1 Obtenir la liste des 10 villes les plus peuplées en 2012 
SELECT
	TOP(10)
	villes.ville_nom AS VILLE,
	villes.ville_population_2012 AS POPULATION_2012
FROM
	villes_france_free AS villes
ORDER BY
	POPULATION_2012 DESC;
GO

-- Q2 Obtenir la liste des 50 villes ayant la plus faible superficie
SELECT
	TOP(50)
	villes.ville_nom AS VILLE,
	villes.ville_surface AS SUPERFICIE
FROM
	villes_france_free AS villes
ORDER BY
	SUPERFICIE;
GO

-- Q3 Obtenir la liste des départements d’outre-mer, c’est-à-dire ceux dont le numéro de département commençant par “97”
SELECT
	departement_code AS CODE,
	departement.departement_nom_uppercase AS DEPARTEMENT
FROM
	departement
WHERE
	departement_code LIKE '97%'
ORDER BY
	CODE;
GO

-- Q4 Obtenir le nom des 10 villes les plus peuplées en 2012, ainsi que le nom du département associé
SELECT
	TOP(10)
	departement.departement_nom_uppercase AS DEPARTEMENT,
	villes.ville_nom AS VILLE,
	villes.ville_population_2012 AS POPULATION_2012
FROM
	villes_france_free AS villes
LEFT JOIN departement ON villes.ville_departement = departement.departement_code
ORDER BY
	POPULATION_2012 DESC;
GO

-- Q5 Obtenir la liste du nom de chaque département, associé à son code et du nombre de commune au sein de ces 
-- départements, en triant afin d’obtenir en priorité les départements qui possèdent le plus de communes
SELECT
	villes.ville_departement AS CODE,
	departement.departement_nom_uppercase AS DEPARTEMENT,
	COUNT(*) AS NB_COMMUNES
FROM
	villes_france_free AS villes
LEFT JOIN departement ON villes.ville_departement = departement.departement_code
GROUP BY
	villes.ville_departement, departement.departement_nom_uppercase
ORDER BY
	NB_COMMUNES DESC;
GO

-- Q6 Obtenir la liste des 10 plus grands départements, en termes de superficie
SELECT
	departement.departement_code AS CODE,
	departement.departement_nom_uppercase AS DEPARTEMENT,
	SUM(villes.ville_surface) AS SUPERFICIE
FROM
	departement
RIGHT JOIN villes_france_free AS villes ON villes.ville_departement = departement.departement_code
GROUP BY
	departement.departement_code, departement.departement_nom_uppercase
ORDER BY
	SUPERFICIE DESC;
GO

-- Q7 Compter le nombre de villes dont le nom commence par “Saint”
SELECT
	COUNT(*) AS 'Villes commençant par Saint'
FROM
	villes_france_free AS villes
WHERE
	villes.ville_nom LIKE 'Saint%';
GO

-- Q8 Obtenir la liste des villes qui ont un nom existants plusieurs fois, et trier afin d’obtenir en premier celles dont le nom est le 
-- plus souvent utilisé par plusieurs communes
SELECT
	villes.ville_nom AS ville,
	COUNT(*) AS occurence
FROM
	villes_france_free AS villes
GROUP BY
	villes.ville_nom
HAVING
	COUNT(*) > 1
ORDER BY
	occurence DESC;
GO

-- Q9 Obtenir en une seule requête SQL la liste des villes dont la superficie est supérieure à la superficie moyenne
SELECT
	villes.ville_nom AS VILLE,
	villes.ville_surface AS SURFACE
FROM
	villes_france_free AS villes
WHERE
	villes.ville_surface > (
	SELECT 
		AVG(villesbis.ville_surface)
	FROM 
		villes_france_free AS villesbis
	)
ORDER BY
	SURFACE DESC;
GO

-- Q10 Obtenir la liste des départements qui possèdent plus de 2 millions d’habitants
SELECT
	departement.departement_nom_uppercase AS DEPARTEMENT,
	SUM(villes.ville_population_2012) AS POPULATION_2012
FROM
	villes_france_free AS villes
LEFT JOIN departement ON villes.ville_departement = departement.departement_code
GROUP BY
	departement.departement_nom_uppercase
HAVING
	SUM(villes.ville_population_2012) > 2000000
ORDER BY
	POPULATION_2012;
GO

-- Q11 Remplacez les tirets par un espace vide, pour toutes les villes commençant par “SAINT-” (dans la colonne qui contient les 
-- noms en majuscule) 

UPDATE
	villes_france_free
SET
	ville_nom = REPLACE(ville_nom, '-', ' ')
WHERE
	ville_nom LIKE 'SAINT-%';
GO
