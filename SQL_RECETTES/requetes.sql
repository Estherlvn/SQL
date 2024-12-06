-- Requetes SQL Exercice "RECETTES"


-- exo1. Afficher toutes les recettes disponibles (nom de la recette, catégorie et temps de préparation) triées 
-- de façon décroissante sur la durée de réalisation.
SELECT recipe_name, category_name, preparation_time
FROM recipe
INNER JOIN category ON recipe.id_category = category.id_category -- identification table de la clé étrangère
ORDER BY preparation_time DESC;


-- exo2. En modifiant la requête précédente, faites apparaître le nombre d’ingrédients nécessaire par recette.
SELECT id_recipe, recipe_name, COUNT(ingredient.id_ingredient)
AS ingredient_count
FROM recipe
INNER JOIN ingredient
ON id_ingredient = ingredient.id_ingredient
GROUP BY id_recipe
ORDER BY id_recipe ASC;
-- A TERMINER : devrait afficher le nombre d'ingrédients PAR recette, et non pas le total de tous les ingrédients


-- 3- Afficher les recettes qui nécessitent au moins 30 min de préparation
SELECT recipe_name, preparation_time
FROM recipe
WHERE preparation_time >= 30
ORDER BY preparation_time ASC;


-- 4- Afficher les recettes dont le nom contient le mot « Salade » (peu importe où est situé le mot en question)
SELECT recipe_name
FROM recipe
WHERE recipe_name LIKE "%Salade%";


-- 5- Insérer une nouvelle recette : « Pâtes à la carbonara » dont la durée de réalisation est de 20 min avec les instructions de votre choix
INSERT INTO recipe (recipe_name, preparation_time, instructions, id_category)
VALUES ('Pâtes à la carbonara', 20, 'Faire cuire les pâtes al dente...', 2);


-- 6- Modifier le nom de la recette ayant comme identifiant id_recette = 3 (nom de la recette à votre convenance)
UPDATE recipe
SET recipe_name = 'Nouvelle Salade César'
WHERE id_recipe = 3;


-- 7- Supprimer la recette n°2 de la base de données
DELETE FROM recipe_ingredient -- supprimer les données de la clé étrangère
WHERE id_recipe = 2;
DELETE FROM recipe -- ensuite supprimer la recette
WHERE id_recipe = 2;


-- 8- Afficher le prix total de la recette n°5
-- 9- Afficher le détail de la recette n°5 (liste des ingrédients, quantités et prix)
-- 10- Ajouter un ingrédient en base de données : Poivre, unité : cuillère à café, prix : 2.5 €
-- 11- Modifier le prix de l’ingrédient n°12 (prix à votre convenance)
-- 12- Afficher le nombre de recettes par catégories : X entrées, Y plats, Z desserts
-- 13- Afficher les recettes qui contiennent l’ingrédient « Poulet »
-- 14- Mettez à jour toutes les recettes en diminuant leur temps de préparation de 5 minutes 
-- 15- Afficher les recettes qui ne nécessitent pas d’ingrédients coûtant plus de 2€ par unité de mesure
-- 16- Afficher la / les recette(s) les plus rapides à préparer
-- 17- Trouver les recettes qui ne nécessitent aucun ingrédient (par exemple la recette de la tasse d’eau 
-- chaude qui consiste à verser de l’eau chaude dans une tasse)
-- 18- Trouver les ingrédients qui sont utilisés dans au moins 3 recettes
-- 19- Ajouter un nouvel ingrédient à une recette spécifique
-- 20- Bonus : Trouver la recette la plus coûteuse de la base de données (il peut y avoir des ex aequo, il est 
-- donc exclu d’utiliser la clause LIMIT)