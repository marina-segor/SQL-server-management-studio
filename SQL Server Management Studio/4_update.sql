/* UPDATE */

-- Modification de tous les services
-- nom en MAJUSCULE
-- MAJ de la date de modification
UPDATE
	service
SET
	nom = UPPER(nom),
	date_modification = GETDATE();
GO

SELECT * FROM service;
GO

UPDATE
	service
SET
	-- Permet de récupérer la date de la veille
	-- F1 sur la fonction DATEADD() pour avoir la doc
	date_modification = DATEADD(day, -1, CAST(GETDATE() AS date))
WHERE
	service_id = 10;
GO
