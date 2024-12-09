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

    // Requête pour récupérer les détails de la recette avec sa catégorie
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
        // REQUETE pour récupérer les ingrédients de la recette
        $ingredientsQuery = 'SELECT ingredient_name FROM ingredient
                             JOIN recipe_ingredient ON ingredient.id_ingredient = recipe_ingredient.id_ingredient
                             WHERE recipe_ingredient.id_recipe = :id_recipe';
        
        // La variable $ingredientsStmt devient un objet statement (ou requête préparée)
        // qui peut ensuite être exécutée.
        $ingredientsStmt = $mysqlClient->prepare($ingredientsQuery);                    // Préparation de la requête SQL
        $ingredientsStmt->bindParam(':id_recipe', $recipeId, PDO::PARAM_INT);           // Liaison du paramètre :id_recipe à la variable $recipeId
        $ingredientsStmt->execute();                                                    // Exécution de la requête préparée
        $ingredients = $ingredientsStmt->fetchAll(PDO::FETCH_ASSOC);                    // Récupération des résultats

        
        // AFFICHAGE des détails de la recette
        echo "<h1>Détail de la recette : " . htmlspecialchars($recipe['recipe_name']) . "</h1>";
        echo "<p><strong>Catégorie:</strong> " . htmlspecialchars($recipe['category_name']) . "</p>";
        echo "<p><strong>Temps de préparation:</strong> " . htmlspecialchars($recipe['preparation_time']) . " minutes</p>";
        
        echo "<h2>Ingrédients:</h2>";
        echo "<ul>";
        foreach ($ingredients as $ingredient) {
            echo "<li>" . htmlspecialchars($ingredient['ingredient_name']) . "</li>";
        }
        echo "</ul>";

    } else {
        echo "<p>Recette non trouvée.</p>";
    }
} else {
    echo "<p>Recette invalide.</p>"; // Si l'ID passé dans l'URL n'est pas valide ou absent
}


?>
