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
             ORDER BY preparation_time ASC';

$recipesStatement = $mysqlClient->prepare($sqlQuery);
$recipesStatement->execute();
/* Spécifier le mode de récupération
(comme PDO::FETCH_ASSOC pour récupérer les données sous forme de tableau associatif)*/
$recipes = $recipesStatement->fetchAll(PDO::FETCH_ASSOC);

?>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des recettes</title>
    <style>
        table {
            width: 60%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
    </style>
</head>
<body>
    <h1>Liste des recettes</h1>
    <table>
        <thead>
            <tr>
                <th>Nom de la recette</th>
                <th>Catégorie</th>
                <th>Temps de préparation</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($recipes as $recipe): ?>
                <tr>
                    <td><a href="detailRecette.php?id=<?= htmlspecialchars($recipe['id_recipe']) ?>"><?= htmlspecialchars($recipe['recipe_name']) ?></a></td>
                    <td><?= htmlspecialchars($recipe['category_name']) ?></td>
                    <td><?= htmlspecialchars($recipe['preparation_time']) ?></td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</body>
</html>
