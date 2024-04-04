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
 INNER JOIN grilletarifs ON articles.codeCate = grilletarifs.codeCate AND articles.codeGam = grilletarifs.codeGam
 INNER JOIN categories ON grilletarifs.codeCate = categories.codeCate  
 WHERE categories.libelle LIKE "%ski%";

-- 4 Calcul du montant de chaque fiche soldée et du montant total des fiches.
 SELECT SUM(tarifs.prixJour*DATEDIFF(fiches.datePaye,fiches.dateCrea))
 FROM fiches 
 INNER JOIN lignesfic ON fiches.noFic = lignesfic.noFic 
 INNER JOIN articles ON lignesfic.refart = articles.refart 
 INNER JOIN grilletarifs ON articles.codeGam = grilletarifs.codeGam AND articles.codeCate = grilletarifs.codeCate
 INNER JOIN tarifs ON grilletarifs.codeTarif = tarifs.codeTarif
 WHERE fiches.datePaye IS NOT NULL;

 SELECT SUM(tarifs.prixJour*DATEDIFF(NOW(),fiches.dateCrea)) 
 FROM fiches 
 INNER JOIN lignesfic ON fiches.noFic = lignesfic.noFic 
 INNER JOIN articles ON lignesfic.refart = articles.refart 
 INNER JOIN grilletarifs ON articles.codeGam = grilletarifs.codeGam AND articles.codeCate = grilletarifs.codeCate 
 INNER JOIN tarifs ON grilletarifs.codeTarif = tarifs.codeTarif 
 WHERE fiches.datePaye IS NULL;

-- 5 Calcul du nombre d’articles actuellement en cours de location.
 SELECT COUNT(depart) 
 FROM lignesfic 
 WHERE retour IS NULL;

-- 6 Calcul du nombre d’articles loués, par client.
 SELECT clients.nom, clients.prenom, COUNT(articles.refart) 
 FROM articles 
 INNER JOIN lignesfic ON articles.refart = lignesfic.refart 
 INNER JOIN fiches ON lignesfic.noFic = fiches.noFic 
 INNER JOIN clients ON fiches.noCli = clients.noCli 
 GROUP BY clients.noCli;

-- 7 Liste des clients qui ont effectué (ou sont en train d’effectuer) plus de 200€ de location.


-- 8 Liste de tous les articles (loués au moins une fois) et le nombre de fois où ils ont été loués, triés du plus loué au moins loué.


-- 9 Liste des fiches (n°, nom, prénom) de moins de 150€.


-- 10 Calcul de la moyenne des recettes de location de surf (combien peut-on espérer gagner pour une location d'un surf ?).


-- 11 Calcul de la durée moyenne d'une location d'une paire de skis (en journées entières).
