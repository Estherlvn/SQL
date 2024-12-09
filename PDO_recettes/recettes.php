<?php

// CONNEXION à la base de données
try {
    $mysqlClient = new PDO('mysql:host=localhost;dbname=recettes;charset=utf8', 'root', '');
} catch (Exception $e) {
    die('Erreur : ' . $e->getMessage());
}


// REQUETE pour récupérer les recettes avec leur catégorie
$sqlQuery = 'SELECT recipe.id_recipe, recipe.recipe_name, category.category_name, recipe.preparation_time 
             FROM recipe
             JOIN category
             ON recipe.id_category = category.id_category
             ORDER BY category.id_category ASC';

$recipesStatement = $mysqlClient->prepare($sqlQuery);
$recipesStatement->execute();
/* Spécifier le mode de récupération
(comme PDO::FETCH_ASSOC pour récupérer les données sous forme de tableau associatif)*/
$recipes = $recipesStatement->fetchAll(PDO::FETCH_ASSOC);


// AFFICHAGE des résultats dans un tableau HTML
echo "<table border='1'>",
    "<thead>",
        "<tr>",
            "<th>Nom de la recette</th>",
            "<th>Catégorie</th>",
            "<th>Temps de préparation</th>",
        "</tr>",
    "</thead>",
    "<tbody>";

foreach ($recipes as $recipe) {
    echo "<tr>",
            "<td><a href='detailRecette.php?id=".$recipe['id_recipe']."'>".$recipe["recipe_name"]."</a></td>",
            "<td>".$recipe['category_name']."</td>",
            "<td>".$recipe['preparation_time']."</td>",
        "</tr>";
}

echo "</tbody>",
    "</table>";
    
?>
