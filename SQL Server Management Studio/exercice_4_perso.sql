
--1. S�lectionner toutes les colonnes de la table actor
SELECT * FROM actor;
GO

--2. S�lectionner uniquement la colonne last_name de la table actorSELECT last_name FROM actor;
GO/* 3. S�lectionner uniquement les colonnes suivantes dans la table des films :
title
description
rental_duration
rental_rate
total_rental_cost (rental_duration * rental_rate)*/SELECT title,
	   [description],
	   rental_duration,
	   rental_rate
FROM   film;
GO

--1. S�lectionner tous les noms de famille distincts dans la table actor
SELECT DISTINCT last_name
FROM actor
GO

--2. S�lectionner tous les codes postaux distincts dans la table address
--3. S�lectionner tous les classements distincts dans la table film