-- commentaires
# commentaires 
-- Norme d'ecriture
-- nom base
-- nom des tables
-- nom des champs

-- Snake cake
-- ma_super_base_de_donnees

-- Camel cake
-- maSuperBaseDeDonnees

-- pascal case en programmation : nom des classes
-- MaSuperBaseDeDonnees

-- kebab case
-- ma-super-page.html

--CREATE DATABASE ma_base;

CREATE DATABASE videotheque CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE videotheque;

-- DROP DATABASE ma_data_base

CREATE TABLE film(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  titre VARCHAR(255) NOT NULL,
  sortie DATE NOT NULL
) ENGINE=InnoDB; 