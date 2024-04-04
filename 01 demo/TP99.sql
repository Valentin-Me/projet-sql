-- DBDIAGRAM:
 // Use DBML to define your database structure
 // Docs: https://dbml.dbdiagram.io/docs

 Table location_skis.clients {
  noCli INT [PRIMARY KEY, NOT NULL]
  nom VARCHAR(30) [NOT NULL]
  prenom VARCHAR(30) 
  adresse VARCHAR(120)
  cpo VARCHAR(5) [NOT NULL]
  ville VARCHAR(80) [NOT NULL]
 }

 Table location_skis.fiches {
  noFic INT [PRIMARY KEY, NOT NULL]
  noCli INT [NOT NULL]
  dateCrea DATETIME [NOT NULL]
  datePaye DATETIME
  etat ENUM(SO,EC,RE) [NOT NULL]
 }

 Table location_skis.lignesfic {
  noFic INT [PRIMARY KEY]
  noLig INT [PRIMARY KEY, NOT NULL]
  refart CHAR(8) [NOT NULL]
  depart DATETIME [NOT NULL]
  retour DATETIME
 }

 Table location_skis.categories {
    codeCate CHAR(5) [PRIMARY KEY, NOT NULL]
    libelle VARCHAR(30) [NOT NULL]
 }

 Table location_skis.gammes {
    codeGam CHAR(5) [PRIMARY KEY, NOT NULL]
    libelle VARCHAR(45) [NOT NULL]
 }

 Table location_skis.articles {
    refart CHAR(5) [PRIMARY KEY, NOT NULL]
    designation VARCHAR(80) [NOT NULL]
    codeGam CHAR(5)
    codeCate CHAR(5)
 }

 Table location_skis.grilletarifs {
    codeGam CHAR(5) [PRIMARY KEY, NOT NULL]
    codeCate CHAR(5) [PRIMARY KEY, NOT NULL]
    codeTarif CHAR(5)
 }

 Table location_skis.tarifs {
    codeTarif CHAR(5) [PRIMARY KEY, NOT NULL]
    libelle VARCHAR(30) [NOT NULL]
    prixJour DECIMAL(5) [NOT NULL]
 }

 Ref: "location_skis"."clients"."noCli" < "location_skis"."fiches"."noCli"

 Ref: "location_skis"."fiches"."noFic" < "location_skis"."lignesfic"."noFic"

 Ref: "location_skis"."articles"."refart" < "location_skis"."lignesfic"."refart"

 Ref: "location_skis"."grilletarifs"."codeGam" < "location_skis"."articles"."codeGam"

 Ref: "location_skis"."grilletarifs"."codeCate" < "location_skis"."articles"."codeCate"

 Ref: "location_skis"."gammes"."codeGam" < "location_skis"."grilletarifs"."codeGam"

 Ref: "location_skis"."categories"."codeCate" < "location_skis"."grilletarifs"."codeCate"

 Ref: "location_skis"."tarifs"."codeTarif" < "location_skis"."grilletarifs"."codeTarif"

-- SQL:
 CREATE DATABASE `location_skis`;

 CREATE TABLE `location_skis`.`clients` (
  `noCli` INT PRIMARY KEY NOT NULL,
  `nom` VARCHAR(30) NOT NULL,
  `prenom` VARCHAR(30),
  `adresse` VARCHAR(120),
  `cpo` VARCHAR(5) NOT NULL,
  `ville` VARCHAR(80) NOT NULL
 );

 CREATE TABLE `location_skis`.`fiches` (
  `noFic` INT PRIMARY KEY NOT NULL,
  `noCli` INT NOT NULL,
  `dateCrea` DATETIME NOT NULL,
  `datePaye` DATETIME,
  `etat` ENUM("SO","EC","RE") NOT NULL
 );

 CREATE TABLE `location_skis`.`lignesfic` (
  `noFic` INT,
  `noLig` INT NOT NULL,
  `refart` CHAR(8) NOT NULL,
  `depart` DATETIME NOT NULL,
  `retour` DATETIME,
  PRIMARY KEY (`noFic`, `noLig`)
 );

 CREATE TABLE `location_skis`.`categories` (
  `codeCate` CHAR(5) PRIMARY KEY NOT NULL,
  `libelle` VARCHAR(30) NOT NULL
 );

 CREATE TABLE `location_skis`.`gammes` (
  `codeGam` CHAR(5) PRIMARY KEY NOT NULL,
  `libelle` VARCHAR(45) NOT NULL
 );

 CREATE TABLE `location_skis`.`articles` (
  `refart` CHAR(5) PRIMARY KEY NOT NULL,
  `designation` VARCHAR(80) NOT NULL,
  `codeGam` CHAR(5),
  `codeCate` CHAR(5)
 );

 CREATE TABLE `location_skis`.`grilletarifs` (
  `codeGam` CHAR(5) NOT NULL,
  `codeCate` CHAR(5) NOT NULL,
  `codeTarif` CHAR(5),
  PRIMARY KEY (`codeGam`, `codeCate`)
 );

 CREATE TABLE `location_skis`.`tarifs` (
  `codeTarif` CHAR(5) PRIMARY KEY NOT NULL,
  `libelle` VARCHAR(30) NOT NULL,
  `prixJour` DECIMAL(5) NOT NULL
 );

 ALTER TABLE `location_skis`.`fiches` ADD FOREIGN KEY (`noCli`) REFERENCES `location_skis`.`clients` (`noCli`);
 ALTER TABLE `location_skis`.`lignesfic` ADD FOREIGN KEY (`noFic`) REFERENCES `location_skis`.`fiches` (`noFic`);
 ALTER TABLE `location_skis`.`lignesfic` ADD FOREIGN KEY (`refart`) REFERENCES `location_skis`.`articles` (`refart`);
 ALTER TABLE `location_skis`.`articles` ADD FOREIGN KEY (`codeGam`) REFERENCES `location_skis`.`grilletarifs` (`codeGam`);
 ALTER TABLE `location_skis`.`articles` ADD FOREIGN KEY (`codeCate`) REFERENCES `location_skis`.`grilletarifs` (`codeCate`);
 ALTER TABLE `location_skis`.`grilletarifs` ADD FOREIGN KEY (`codeGam`) REFERENCES `location_skis`.`gammes` (`codeGam`);
 ALTER TABLE `location_skis`.`grilletarifs` ADD FOREIGN KEY (`codeCate`) REFERENCES `location_skis`.`categories` (`codeCate`);
 ALTER TABLE `location_skis`.`grilletarifs` ADD FOREIGN KEY (`codeTarif`) REFERENCES `location_skis`.`tarifs` (`codeTarif`);

-- 1 Liste des clients (nom, prénom, adresse, code postal, ville) ayant au moins une fiche de location en cours.
 SELECT clients.*, fiches.etat 
 FROM clients 
 INNER JOIN fiches ON clients.noCli = fiches.noCli 
 WHERE fiches.etat = "EC";

-- 2 Détail de la fiche de location de M. Dupond Jean de Paris (avec la désignation des articles loués, la date de départ et de retour).
 SELECT clients.nom, clients.prenom, clients.ville, fiches.dateCrea, fiches.datePaye, fiches.etat, articles.designation
 FROM clients 
 INNER JOIN fiches ON clients.noCli = fiches.noCli 
 INNER JOIN lignesfic ON fiches.noFic = lignesfic.noFic 
 INNER JOIN articles ON lignesfic.refart = articles.refart 
 WHERE clients.nom = "Dupond" AND clients.prenom = "Jean" AND clients.ville = "Paris";

-- 3 Liste de tous les articles (référence, désignation et libellé de la catégorie) dont le libellé de la catégorie contient ski.
 SELECT articles.refart, articles.designation, categories.libelle
 FROM articles 
 INNER JOIN grilletarifs ON articles.codeCate = grilletarifs.codeCate 
 INNER JOIN categories ON grilletarifs.codeCate = categories.codeCate  
 WHERE categories.libelle LIKE "%ski%";

-- 4 Calcul du montant de chaque fiche soldée et du montant total des fiches.
 SELECT SUM(tarifs.prixJour*DATEDIFF(fiches.datePaye,fiches.dateCrea))
 FROM fiches 
 INNER JOIN lignesfic ON fiches.noFic = lignesfic.noFic 
 INNER JOIN articles ON lignesfic.refart = articles.refart 
 INNER JOIN grilletarifs ON articles.codeGam = grilletarifs.codeGam 
 INNER JOIN tarifs ON grilletarifs.codeTarif = tarifs.codeTarif
 WHERE fiches.datePaye IS NOT NULL;

 SELECT SUM(tarifs.prixJour*DATEDIFF(NOW(),fiches.dateCrea)) 
 FROM fiches 
 INNER JOIN lignesfic ON fiches.noFic = lignesfic.noFic 
 INNER JOIN articles ON lignesfic.refart = articles.refart 
 INNER JOIN grilletarifs ON articles.codeGam = grilletarifs.codeGam 
 INNER JOIN tarifs ON grilletarifs.codeTarif = tarifs.codeTarif 
 WHERE fiches.datePaye IS NULL;

-- 5 Calcul du nombre d’articles actuellement en cours de location.


-- 6 Calcul du nombre d’articles loués, par client.


-- 7 Liste des clients qui ont effectué (ou sont en train d’effectuer) plus de 200€ de location.


-- 8 Liste de tous les articles (loués au moins une fois) et le nombre de fois où ils ont été loués, triés du plus loué au moins loué.


-- 9 Liste des fiches (n°, nom, prénom) de moins de 150€.


-- 10 Calcul de la moyenne des recettes de location de surf (combien peut-on espérer gagner pour une location d'un surf ?).


-- 11 Calcul de la durée moyenne d'une location d'une paire de skis (en journées entières).
