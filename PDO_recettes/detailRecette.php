<?php
// Connexion à la base de données
try {
    $mysqlClient = new PDO('mysql:host=localhost;dbname=recettes;charset=utf8', 'root', '');
} catch (Exception $e) {
    die('Erreur : ' . $e->getMessage());
}

// Vérifier si l'ID de la recette est passé en paramètre dans l'URL
if (isset($_GET['id']) && is_numeric($_GET['id'])) {
    $recipeId = $_GET['id'];

    // REQUETE pour récupérer les DETAILS de la recette avec sa catégorie
    $sqlQuery = 'SELECT recipe.id_recipe, recipe.recipe_name, category.category_name, recipe.preparation_time 
                 FROM recipe
                 JOIN category
                 ON recipe.id_category = category.id_category
                 WHERE recipe.id_recipe = :id_recipe';

    $stmt = $mysqlClient->prepare($sqlQuery);
    $stmt->bindParam(':id_recipe', $recipeId, PDO::PARAM_INT);
    $stmt->execute();
    
    // Vérifier si la recette existe
    $recipe = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if ($recipe) {
        // REQUETE pour récupérer les INGREDIENTS de la recette
        $ingredientsQuery = 'SELECT ingredient.ingredient_name, recipe_ingredient.quantity, ingredient.price 
                             FROM ingredient
                             INNER JOIN recipe_ingredient ON ingredient.id_ingredient = recipe_ingredient.id_ingredient
                             WHERE recipe_ingredient.id_recipe = :id_recipe';
        
        $ingredientsStmt = $mysqlClient->prepare($ingredientsQuery);                    
        $ingredientsStmt->bindParam(':id_recipe', $recipeId, PDO::PARAM_INT);           
        $ingredientsStmt->execute();                                                    
        $ingredients = $ingredientsStmt->fetchAll(PDO::FETCH_ASSOC);                    

        // AFFICHAGE avec HTML
        ?>
        <!DOCTYPE html>
        <html>
        <head>
            <title>Détail de la recette</title>
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
            <h1>Fiche recette: <br><br> <?= htmlspecialchars($recipe['recipe_name']) ?></h1>
            <p><strong>Catégorie:</strong> <?= htmlspecialchars($recipe['category_name']) ?></p>
            <p><strong>Temps de préparation:</strong> <?= htmlspecialchars($recipe['preparation_time']) ?> minutes</p>
            
            <h2>Ingrédients:</h2>
            <table>
                <thead>
                    <tr>
                        <th>Nom de l'ingrédient</th>
                        <th>Quantité</th>
                        <th>Prix</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($ingredients as $ingredient): ?>
                        <tr>
                            <td><?= htmlspecialchars($ingredient['ingredient_name']) ?></td>
                            <td><?= htmlspecialchars($ingredient['quantity']) ?></td>
                            <td><?= htmlspecialchars($ingredient['price']) ?></td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
        </body>
        </html>
        <?php

    } else {
        echo "<p>Recette non trouvée.</p>";
    }
} else {
    echo "<p>Recette invalide.</p>"; // Si l'ID passé dans l'URL n'est pas valide ou absent
}
?>
