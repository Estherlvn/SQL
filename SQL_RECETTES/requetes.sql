-- Requetes SQL Exercice "RECETTES"


-- exo1. Afficher toutes les recettes disponibles (nom de la recette, catégorie et temps de préparation) triées 
-- de façon décroissante sur la durée de réalisation.
SELECT recipe_name, category_name, preparation_time
FROM recipe
INNER JOIN category ON recipe.id_category = category.id_category -- identification table de la clé étrangère
ORDER BY preparation_time DESC;


-- exo2. En modifiant la requête précédente, faites apparaître le nombre d’ingrédients nécessaire par recette.
SELECT r.id_recipe, r.recipe_name, COUNT(ri.id_ingredient) AS ingredient_count
FROM recipe r
INNER JOIN recipe_ingredient ri ON r.id_recipe = ri.id_recipe
GROUP BY r.id_recipe
ORDER BY ingredient_count DESC;


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
SELECT id_recipe , SUM(quantity * price )
FROM recipe_ingredient ri
INNER JOIN ingredient ing
ON ing.id_ingredient = ri.id_ingredient
WHERE id_recipe = 5;


-- 9- Afficher le détail de la recette n°5 (liste des ingrédients, quantités et prix)
SELECT id_recipe , ingredient_name, quantity, price
FROM recipe_ingredient ri
INNER JOIN ingredient ing
ON ing.id_ingredient = ri.id_ingredient
WHERE id_recipe = 5;


-- 10- Ajouter un ingrédient en base de données : Poivre, unité : cuillère à café, prix : 2.5 €
INSERT INTO ingredient (ingredient_name, price)
VALUES ('Poivre', 2.5);


-- 11- Modifier le prix de l’ingrédient n°12 (prix à votre convenance)
UPDATE ingredient
SET price 15
WHERE id_ingredient = 12;


-- 12- Afficher le nombre de recettes par catégories : X entrées, Y plats, Z desserts
SELECT category.category_name,
COUNT(recipe.id_recipe) AS recipes_number
FROM recipe
INNER JOIN category ON recipe.id_category = category.id_category
GROUP BY category_name;


-- 13- Afficher les recettes qui contiennent l’ingrédient « Poulet »
SELECT r.recipe_name
FROM recipe r
INNER JOIN recipe_ingredient ri ON r.id_recipe = ri.id_recipe
INNER JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
WHERE i.ingredient_name = "Poulet";


-- 14- Mettez à jour toutes les recettes en diminuant leur temps de préparation de 5 minutes 
UPDATE recipe
SET preparation_time = preparation_time - 5;


-- 15- Afficher les recettes qui ne nécessitent pas d’ingrédients coûtant plus de 2€ par unité de mesure
SELECT r.recipe_name
FROM recipe r
INNER JOIN recipe_ingredient ri ON r.id_recipe = ri.id_recipe
INNER JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
GROUP BY recipe_name
HAVING MIN(i.price) <= 2;


-- 16- Afficher la / les recette(s) les plus rapides à préparer
SELECT recipe_name, preparation_time
FROM recipe
WHERE preparation_time = (
    SELECT MIN(preparation_time)
    FROM recipe
);


-- 17- Trouver les recettes qui ne nécessitent aucun ingrédient
SELECT r.recipe_name
FROM recipe r
LEFT JOIN recipe_ingredient ri ON r.id_recipe = ri.id_recipe
WHERE ri.id_ingredient IS NULL;

-- Avec la clause NOT IN
SELECT r.recipe_name
FROM recipe r
WHERE r.id_recipe NOT IN (
    SELECT ri.id_recipe
    FROM recipe_ingredient ri
    INNER JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
    WHERE i.price > 2
);


-- 18- Trouver les ingrédients qui sont utilisés dans au moins 3 recettes
SELECT i.ingredient_name, COUNT(ri.id_recipe) AS recipe_count
FROM ingredient i
INNER JOIN recipe_ingredient ri ON i.id_ingredient = ri.id_ingredient
GROUP BY ingredient_name
HAVING COUNT(ri.id_recipe) >= 3;


-- 19- Ajouter un nouvel ingrédient à une recette spécifique
INSERT INTO recipe_ingredient (quantity, unity, id_ingredient, id_recipe)
VALUES (10, 'g', 17, 1);


-- 20- Bonus : Trouver la recette la plus coûteuse de la base de données (il peut y avoir des ex aequo, il est 
-- donc exclu d’utiliser la clause LIMIT)
SELECT r.recipe_name, SUM(ri.quantity * i.price) AS total_cost
FROM recipe r
INNER JOIN recipe_ingredient ri ON r.id_recipe = ri.id_recipe
INNER JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
GROUP BY r.id_recipe, r.recipe_name
HAVING SUM(ri.quantity * i.price) = (
    SELECT MAX(total_cost)
    FROM (
        SELECT SUM(ri.quantity * i.price) AS total_cost
        FROM recipe_ingredient ri
        INNER JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
        GROUP BY id_recipe
    ) AS costs
);

-- Avec HAVING + ALL
SELECT r.recipe_name
FROM recipe r
INNER JOIN recipe_ingredient ri ON r.id_recipe = ri.id_recipe
INNER JOIN ingredient i ON ri.id_ingredient = i.id_ingredient
GROUP BY r.id_recipe, r.recipe_name
HAVING MAX(i.price) <= 2;


-----END