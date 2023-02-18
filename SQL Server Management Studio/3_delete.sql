/*
* DELETE 
*/

USE entreprise_demo;
GO

SELECT * FROM service;

-- DELETE FROM sans la clause WHERE
-- Supprime l'ensemble des enregistrements
DELETE FROM
	service;
GO

-- Clause DELETE FROM
-- utilisation de la clause where pour ajouter des conditions
DELETE FROM
	service
WHERE
	service_id = 3;
GO

DELETE FROM
	service
WHERE
	nom = 'Marketing';
GO

DELETE FROM
	service
WHERE
	service_id = 9
	OR
	nom = 'communication';