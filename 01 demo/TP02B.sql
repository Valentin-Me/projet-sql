-- 1 - Créer la data base zoo
 CREATE DATABASE zoo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 2 - Créer la table chat
 CREATE TABLE chat(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    yeux VARCHAR(30) NOT NULL,
    age TINYINT(1) NOT NULL
 ) ENGINE=InnoDB; 

-- 3 - ajouter les données
 INSERT INTO chat (nom,yeux,age) VALUES
 ('maine coon','marron',20),
 ('siamois','bleu',15),
 ('bengal','marron',18),
 ('Scottish Fold','marron',10);

-- 3 - Afficher le chat avec l'id :2
 SELECT * FROM `chat` WHERE id=2;

-- 4 - Trier les chats par nom et par age
 SELECT * FROM `chat` ORDER BY `nom`,`age`;

-- 5 - Afficher les chats qui vive entre 11 et 19 ans
 SELECT * FROM `chat` WHERE `age` BETWEEN 11 AND 19;

-- 5 - Afficher le ou les chats dont le nom contient 'sia'
 SELECT * FROM `chat` WHERE `nom` LIKE "%sia%";

-- 6 - Afficher la moyenne d'age des chats
 SELECT AVG(`age`) FROM `chat`;

-- 7 - Afficher le nombre de chats dans la table
 SELECT COUNT(`id`) FROM `chat`;

-- 8 - Ajouter les données à partir d'un fichier excel
