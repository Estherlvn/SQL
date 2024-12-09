<?php

// Instruction PDO pour se connecter à la base de données 'recettes'
$mysqlClient = new PDO(
	'mysql:host=LEDLEV;dbname=recettes;charset=utf8'   // Nom de l'hote + nom BDD
	'root',       // Identifiant
	''            // MDP : pas de mdp par défaut
);
?>