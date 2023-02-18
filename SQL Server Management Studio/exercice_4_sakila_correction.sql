USE sakila;
GO

-------------------
-- SELECT
-------------------

--1. Sélectionner toutes les colonnes de la table actor
SELECT
	actor_id,
	first_name,
	last_name,
	last_update
FROM
	actor;
GO

--2. Sélectionner uniquement la colonne last_name de la table actor
SELECT
	last_name
FROM
	actor;
GO

/* 3. Sélectionner uniquement les colonnes suivantes dans la table des films :
title
description
rental_duration
rental_rate
total_rental_cost (rental_duration * rental_rate)*/
SELECT
	title,
	description,
	rental_duration,
	rental_rate,
	rental_duration * rental_rate AS total_rental_cost
FROM
	film;
GO

-------------------
-- DISTINCT
-------------------

--1. Sélectionner tous les noms de famille distincts dans la table actor
SELECT
	DISTINCT last_name
FROM
	actor;
GO

--2. Sélectionner tous les codes postaux distincts dans la table address

SELECT
	DISTINCT postal_code
FROM
	address;
GO

--3. Sélectionner tous les classements distincts dans la table film
SELECT
	DISTINCT rating
FROM
	film;
GO


--WHERE
-- 1. Sélectionner les colonnes title, description, rating, length dans la table film qui durent 3 heures ou plus
SELECT
	title,
	description,
	rating,
	length
FROM	
	film
WHERE
	length > 3 * 60;
GO

--2. Sélectionner les colonnes payment_id, amount, payment_date de la table payment pour les paiements
-- effectués après le 27/05/2005
SELECT
	payment_id,
	amount,
	payment_date
FROM
	payment
WHERE
	payment_date > '2005-05-27';
GO

--3.  Sélectionner les colonnes clé primaire, amount, and payment_date columns pour les paiements
-- effectués le 27/05/2005
SELECT
	payment_id, 
	amount,
	payment_date
FROM
	payment
WHERE
	CAST(payment_date AS DATE) = '2005-05-27'

--4. Sélectionner toutes les colonnes de la table customer pour les lignes dont le nom de famille commence
-- par "S" et le prénom se termine par "N"
SELECT
	first_name,
	last_name,
	SUBSTRING(last_name, 1, 1) AS first_caractere_last_name,
	SUBSTRING(first_name, LEN(first_name), 1) AS last_caractere_first_name,
	CONCAT(SUBSTRING(last_name, 1, 1), SUBSTRING(first_name, LEN(first_name), 1)) AS concat
FROM
	customer
WHERE
	last_name LIKE 'S%'
	AND
	first_name LIKE '%N';
GO

SELECT
	first_name,
	last_name
FROM
	customer
WHERE
	SUBSTRING(last_name, 1, 1) = 'S'
	AND
	SUBSTRING(first_name, LEN(first_name), 1) = 'N' 
GO

--5.  Sélectionner toutes les colonnes de la table customer pour les lignes où le client est inactif ou dont le
-- nom de famille se termine par "M"
SELECT
	*
FROM
	customer
WHERE
	active = '0'
	OR
	last_name LIKE '%M';
GO

--6. Sélectionner toutes les colonnes de la table category pour les lignes où la clé primaire est supérieure à
-- 4 et où le champ name commence par "C", "S" ou "T"
SELECT
	*
FROM
	category
WHERE
	category_id > 4
	AND
	SUBSTRING(name, 1, 1) IN ('C', 'S', 'T');
GO

-- 7.Sélectionner toutes les colonnes moins la colonne du mot de passe dans la table staff pour les lignes
-- qui contiennent un mot de passe
SELECT
	first_name,
	last_name
FROM	
	staff
WHERE
	password IS NOT NULL;
GO

-- 8. . Sélectionner toutes les colonnes moins la colonne du mot de passe dans la table staff pour les lignes
-- qui ne contiennent pas un mot de passe
SELECT
	first_name,
	last_name
FROM	
	staff
WHERE
	password IS NULL;
GO

-------------------
-- IN
-------------------

--1. Sélectionner les colonnes phone et district dans la table address pour des adresses en California,
-- England, Taipei, ou West Java
SELECT 
	phone,
	district
FROM
	address
WHERE
	district IN ('California', 'England', 'Taipei', 'West Java');
GO

-- 2. Sélectionner les colonnes payment_id, amount et payment_date dans la table payment pour les
-- paiements effectués les 25/05/2005, 27/05/2005 et 29/05/2005. (Utiliser l'opérateur IN et la fonction
-- DATE, au lieu de l'opérateur AND comme dans les exercices précédents).
SELECT
	payment_id,
	amount,
	CAST(payment_date AS DATE) AS payment_date
FROM 
	payment
WHERE 
	CAST(payment_date AS DATE) IN ('2005-05-25','2005-05-27','2005-05-29');
GO

-- Sélectionner toutes les colonnes du tableau des films pour les films classés G, PG-13 ou NC-17.
SELECT
	*
FROM
	film
WHERE
	rating IN ('G','PG-13','NC-17');
GO

-------------------
-- BETWEEN
-------------------

-- Sélectionner toutes les colonnes de la table payment pour les paiements effectués entre le 25/05/2005
-- à minuit et 1 seconde avant le 26/05/2005 à minuit.
SELECT 
	* 
FROM 
	payment
WHERE 
	payment_date BETWEEN '2005-05-25 23:59:59' AND '2005-05-26 23:59:59';
GO

/*2. Sélectionner les colonnes suivantes dans la table film pour les films dont la longueur de la description
est comprise entre 100 et 120 caractères.
title
description
release_year
total_rental_cost (rental_duration * rental_rate) */
SELECT 
	title,
	description,
	release_year,
	rental_duration * rental_rate AS total_rental_cost
FROM 
	film
WHERE 
	DATALENGTH(description) BETWEEN 100 AND 120;
GO

-------------------
-- LIKE
-------------------

/* 1.Sélectionner les colonnes suivantes dans la table film pour les lignes où la description commence par
"A Thoughtful".
title
description
release year */
SELECT 
	title,
	description,
	release_year
FROM 
	film
WHERE 
	description LIKE 'A Thoughtful%';
GO

/* 2.Sélectionner les colonnes suivantes dans la table film pour les lignes où la description se termine par le
mot "Boat".
title
description
release year*/
SELECT
	title,
	description,
	release_year
FROM 
	film
WHERE 
	description LIKE '%Boat';
GO

-- 3. Sélectionner les colonnes suivantes dans la table film lorsque la description contient le mot "Database"
-- et que la durée du film est supérieure à 3 heures.
SELECT 
	*
FROM 
	film
WHERE 
	description LIKE '%Database%' 
	AND 
	length > 180;
GO

-------------------
-- TOP
-------------------

-- 1. Sélectionner toutes les colonnes de la table payment et n'incluez que les 20 premières lignes.
SELECT
	TOP(20)
	*
FROM 
	payment;
GO

/* 2. Sélectionner les colonnes payment_id, payment_date, amount de la table payment pour les lignes où le
montant du paiement est supérieur à 5 et ne sélectionner que les lignes dont l'index basé sur zéro dans
le jeu de résultats est compris entre 51 et 100.*/
SELECT
	payment_id,
	payment_date,
	amount
FROM 
	payment
WHERE
	amount > 5 
	AND 
	payment_id BETWEEN 51 AND 100;
 
/*3. Sélectionner toutes les colonnes de la table customer, en limitant les résultats à ceux dont l'indice de
base zéro est compris entre 101 et 200.*/
SELECT 
	*
FROM 
	customer
ORDER BY
	customer_id
	OFFSET 100 ROWS
	FETCH NEXT 100 ROWS ONLY;
GO

-------------------
-- ORDER BY
-------------------

 /* 1.Sélectionner toutes les colonnes de la table film et ordonner les lignes par le champ length dans l'ordre
croissant.*/
SELECT 
	*
FROM
	film
ORDER BY 
	length;
GO

/* 2. Sélectionner toutes les notes distinctes de la table des film et les ordonner par note dans l'ordre
décroissant (colonne rating).*/
SELECT 
	DISTINCT rating
FROM 
	film
ORDER BY
	rating DESC;
GO

/* 3.Sélectionner les colonnes payment_date et amount dans la table payment pour les 20 premiers
paiements, classés par montant du paiement et par ordre décroissant.*/
SELECT
	TOP(20)
	payment_date,
	amount
FROM
	payment
ORDER BY 
	amount DESC;
GO

/*4.Sélectionner les colonnes title, description, special_features, length, et rental_duration dans la table film
pour les 10 premiers films dont les séquences en coulisses durent moins de 2 heures et dont la durée
de location est comprise entre 5 et 7 jours, classés par ordre décroissant de durée.*/
SELECT
	TOP(10)
	title,
	description,
	special_features
	length,
	rental_duration
FROM
	film
WHERE 
	special_features LIKE '%Behind the Scenes%'
	AND rental_duration BETWEEN 5 AND 7
	AND length < 120
ORDER BY 
	length DESC;
GO

-------------------
-- JOIN
-------------------

/*1. Sélectionner les colonnes first_name/last_name du customer et first_name/last_name de la table actor
en effectuant une jointure gauche entre les tables customer et actor sur la colonne last_name table. (i.e.
customer.last_name = actor.last_name)
Étiquettez les colonnes de nom et prénom du client en tant que nom et prénom du client.
Étiqueter les colonnes de nom et prénom de l'acteur de façon similaire.*/
SELECT
	c.first_name AS customer_first_name,
	c.last_name AS customer_last_name,
	a.first_name AS actor_first_name,
	a.last_name AS actor_last_name
FROM 
	customer AS c
LEFT JOIN actor AS a ON c.last_name = a.last_name;
GO

/*2. Sélectionner les colonnes first_name/last_name du costumer et first_name/last_name de la table actor
en effectuant une jointure droite entre les colonnes customer et actor sur la colonne last_name de
chaque table. (i.e. customer.last_name = actor.last_name)*/
SELECT
	c.first_name AS customer_first_name,
	c.last_name AS customer_last_name,
	a.first_name AS actor_first_name,
	a.last_name AS actor_last_name
FROM 
	customer AS c
RIGHT JOIN actor AS a ON c.last_name = a.last_name;
GO

/*3. Sélectionner les colonnes first_name/last_name du costumer et first_name/last_name de la table actor
en effectuant une jointure interne (inner) entre les colonnes customer et actor sur la colonne last_name
de chaque table. (i.e. customer.last_name = actor.last_name)*/
SELECT
	c.first_name AS customer_first_name,
	c.last_name AS customer_last_name,
	a.first_name AS actor_first_name,
	a.last_name AS actor_last_name
FROM 
	customer AS c
INNER JOIN actor AS a ON c.last_name = a.last_name;
GO

/*4. Sélectionner les colonnes nom de ville et nom du pays dans la table city, en effectuant une jointure
gauche avec la table country pour obtenir la colonne nom du pays.*/
SELECT
	city.city,
	country.country
FROM 
	city
LEFT JOIN country ON city.country_id = country.country_id;
GO

/*5. Sélectionner les colonnes title, description, release_year et la langue dans la table film, puis effectuez
une jointure gauche avec la table language pour obtenir la colonne "langue".
Étiquetez la colonne langue.nom comme "langue" (par exemple, Sélectionner langue.nom
comme langue).*/
SELECT
	film.title,
	film.description,
	film.release_year,
	language.name AS language
FROM
	film
LEFT JOIN language ON film.language_id = language.language_id;
GO

/*6. Sélectionner les colonnes first_name, last_name, address, address2, city name, district, and postal code
dans la table staff, en effectuant 2 jointures gauches avec la table address puis la table city pour obtenir
les colonnes address et city related.*/
SELECT
	staff.first_name,
	staff.last_name,
	address.address,
	address.address2,
	address.district,
	address.postal_code,
	city.city
FROM 
	staff
LEFT JOIN address ON staff.address_id = address.address_id
LEFT JOIN city ON address.city_id = city.city_id;
GO
