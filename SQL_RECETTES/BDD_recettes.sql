-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Listage des données de la table recettes.category : ~2 rows (environ)
INSERT INTO `category` (`id_category`, `category_name`) VALUES
	(1, 'Entrée'),
	(2, 'Plat'),
	(3, 'Dessert');

-- Listage des données de la table recettes.ingredient : ~25 rows (environ)
INSERT INTO `ingredient` (`id_ingredient`, `ingredient_name`, `price`) VALUES
	(1, 'Farine de blé', 2),
	(2, 'Oeufs', 2.6),
	(3, 'Lait', 1),
	(4, 'Fromage râpé', 8),
	(5, 'Beurre', 7),
	(6, 'Sucre', 1),
	(7, 'Café', 1),
	(8, 'Pâtes à lasagnes', 15),
	(9, 'Boeuf hachée', 10),
	(10, 'Oignon', 0.5),
	(11, 'Ail', 0.5),
	(12, 'Huile d\'olive', 15),
	(13, 'Sauce tomate', 3),
	(14, 'Sel et poivre', 5),
	(15, 'Mascarpone', 10),
	(16, 'Biscuits cuillère', 7.5),
	(17, 'Cacao poudre', 10),
	(18, 'Semoule', 4),
	(19, 'Poulet', 10),
	(20, 'Carottes', 1.5),
	(21, 'Courgettes', 2),
	(22, 'Pois chiches', 5),
	(23, 'Tomates', 3.5),
	(24, 'Cumin', 1),
	(25, 'Paprika', 1),
	(26, 'Laitue', 3),
	(27, 'Poivre', 2.5);

-- Listage des données de la table recettes.recipe : ~5 rows (environ)
INSERT INTO `recipe` (`id_recipe`, `recipe_name`, `preparation_time`, `instructions`, `id_category`) VALUES
	(1, 'Crêpes', 25, 'Mélangez la farine et le sucre dans un grand bol.\r\nAjoutez les œufs un par un et mélangez bien.\r\nIncorporez le lait progressivement tout en mélangeant pour éviter les grumeaux.\r\nAjoutez le beurre fondu et mélangez jusqu\'à obtenir une pâte homogène.\r\nFaites chauffer une poêle avec un peu de beurre.\r\nVersez une louche de pâte dans la poêle et étalez-la uniformément.\r\nFaites cuire chaque crêpe environ 2 minutes de chaque côté jusqu\'à ce qu\'elle soit dorée.\r\nRépétez l\'opération avec le reste de la pâte.', 3),
	(3, 'Nouvelle Salade César', 15, 'Préparez les filets de poulet :\r\n\r\nFaites chauffer 15 grammes d\'huile d\'olive dans une poêle à feu moyen.\r\nAssaisonnez les filets de poulet avec du sel et du poivre.\r\nFaites cuire les filets de poulet jusqu\'à ce qu\'ils soient dorés et bien cuits, environ 5-7 minutes de chaque côté.\r\nLaissez refroidir légèrement, puis coupez en tranches.\r\nPréparez la sauce César :\r\n\r\nDans un bol, mélangez le jaune d\'œuf, la moutarde de Dijon, le jus de citron, l\'ail écrasé, la Worcestershire sauce, une pincée de sel et de poivre.\r\nAjoutez lentement le reste de l\'huile d\'olive (15 grammes) en fouettant constamment jusqu\'à ce que la sauce soit épaisse et émulsionnée.\r\nIncorporez 20 grammes de parmesan râpé.\r\nAssemblez la salade :\r\n\r\nLavez et essorez la laitue romaine, puis déchirez-la en morceaux.\r\nMettez la laitue dans un grand saladier.\r\nAjoutez les tranches de poulet, les croutons, et le reste du parmesan râpé (30 grammes).\r\nVersez la sauce César sur la salade et mélangez bien pour enrober tous les ingrédients.\r\nServez immédiatement :\r\n\r\nRépartissez la salade dans des assiettes et ajoutez des copeaux de parmesan supplémentaires si désiré.\r\nBon appétit !', 1),
	(4, 'Tiramisu', 25, 'Préparer la crème au mascarpone :\r\n\r\nSéparez les blancs des jaunes d\'œufs.\r\nFouettez les jaunes d\'œufs avec le sucre en poudre (75 grammes) jusqu\'à ce que le mélange blanchisse et devienne mousseux.\r\nAjoutez le mascarpone (250 grammes) aux jaunes d\'œufs et mélangez délicatement pour obtenir une crème lisse.\r\nMonter les blancs en neige :\r\n\r\nFouettez les blancs d\'œufs en neige ferme.\r\nIncorporez-les délicatement à la préparation au mascarpone avec une spatule, en soulevant la masse pour ne pas faire retomber les blancs.\r\nPréparer le café :\r\n\r\nFaites couler le café fort (150 ml) et laissez-le refroidir. Si vous utilisez de la liqueur de café, vous pouvez l’ajouter au café refroidi.\r\nAssembler le tiramisu :\r\n\r\nTrempez rapidement les biscuits à la cuillère (200 grammes) dans le café refroidi (et l\'alcool, si utilisé). Veillez à ce qu\'ils ne soient pas trop imbibés pour qu\'ils ne se désintègrent pas.\r\nDisposez une première couche de biscuits imbibés dans le fond d’un plat ou de verrines.\r\nRecouvrez-les d\'une couche de crème au mascarpone.\r\nRépéter les couches :\r\n\r\nRépétez l\'opération pour une seconde couche de biscuits et de crème au mascarpone.\r\nRéfrigérer :\r\n\r\nPlacez le tiramisu au réfrigérateur pendant au moins 4 heures, idéalement toute une nuit, pour qu\'il prenne bien.\r\nDécorer et servir :\r\n\r\nAvant de servir, saupoudrez le tiramisu de cacao en poudre (10 grammes) à l’aide d’un tamis.', 3),
	(5, 'Couscous', 115, 'Préparez les légumes :\r\n\r\nPelez les carottes et coupez-les en rondelles.\r\nCoupez les courgettes en morceaux.\r\nCoupez les tomates en dés.\r\nHachez l\'oignon.\r\nCuisson de la viande :\r\n\r\nFaites chauffer l\'huile d\'olive (30 grammes) dans une grande marmite ou une cocotte.\r\nFaites revenir les cuisses de poulet (500 grammes) ou les blancs de poulet jusqu\'à ce qu\'ils soient dorés de chaque côté.\r\nRetirez la viande et réservez.\r\nCuisson des légumes :\r\n\r\nDans la même marmite, ajoutez l\'oignon haché et faites-le revenir pendant 2-3 minutes jusqu\'à ce qu\'il soit doré.\r\nAjoutez les carottes, les courgettes et les tomates, puis faites cuire pendant 5 minutes.\r\nAjoutez le bouillon de volaille (1 cube) et 1 litre d\'eau, puis portez à ébullition.\r\nCuisson du couscous :\r\n\r\nPendant que le bouillon chauffe, préparez la semoule de couscous selon les instructions du paquet (généralement, ajoutez de l\'eau bouillante à la semoule, couvrez et laissez gonfler pendant 5 à 10 minutes).\r\nAérez la semoule à l\'aide d\'une fourchette et ajoutez un peu de sel et de beurre ou d\'huile d\'olive si désiré.\r\nFinalisation du plat :\r\n\r\nRemettez le poulet dans la marmite avec les légumes, ajoutez les pois chiches (200 grammes), le cumin (5 grammes), le paprika (5 grammes), du sel et du poivre selon votre goût.\r\nLaissez mijoter à feu doux pendant 30 à 40 minutes pour que la viande soit bien cuite et que les saveurs se mélangent.\r\nService :\r\n\r\nDisposez la semoule de couscous dans un plat de service et garnissez avec le poulet, les légumes et le bouillon.\r\nServez chaud.\r\nBon appétit !', 2),
	(6, 'Pâtes à la carbonara', 15, 'Faire cuire les pâtes al dente...', 2),
	(10, 'Recette de l\'eau chaude', 2, 'Verser de l\'eau chaude dans une tasse', 1);

-- Listage des données de la table recettes.recipe_ingredient : ~27 rows (environ)
INSERT INTO `recipe_ingredient` (`quantity`, `unity`, `id_ingredient`, `id_recipe`) VALUES
	(250, 'g', 1, 1),
	(4, 'unité', 2, 1),
	(500, 'ml', 3, 1),
	(50, 'g', 5, 1),
	(40, 'g', 6, 1),
	(300, 'g', 26, 3),
	(300, 'g', 19, 3),
	(50, 'g', 4, 3),
	(30, 'g', 12, 3),
	(1, 'unité', 2, 3),
	(5, 'g', 14, 3),
	(250, 'g', 15, 4),
	(3, 'unité', 2, 4),
	(75, 'g', 6, 4),
	(150, 'ml', 7, 4),
	(200, 'g', 16, 4),
	(20, 'g', 17, 4),
	(250, 'g', 18, 5),
	(500, 'g', 19, 5),
	(300, 'g', 20, 5),
	(300, 'g', 21, 5),
	(500, 'g', 22, 5),
	(200, 'g', 23, 5),
	(1, 'unité', 10, 5),
	(5, 'g', 25, 5),
	(5, 'g', 24, 5),
	(10, 'g', 17, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
