-- a
   SELECT * FROM clients WHERE nom LIKE "D%";

-- b
   SELECT nom, prenom FROM clients;

-- c
   SELECT fiches.noFic, etat, clients.nom, clients.prenom 
   FROM clients 
   INNER JOIN fiches ON clients.noCli = fiches.noCli 
   WHERE clients.cpo LIKE "44%";

-- d
   SELECT fiches.noFic, clients.nom, clients.prenom, articles.refart, articles.designation, lignesfic.depart, lignesfic.retour, tarifs.prixJour, COALESCE(tarifs.prixJour*DATEDIFF(lignesfic.retour,lignesfic.depart),tarifs.prixJour*(DATEDIFF(NOW(),lignesfic.depart)+1)) AS Montant
   FROM clients 
   INNER JOIN fiches ON clients.noCli = fiches.noCli 
   INNER JOIN lignesFic ON fiches.noFic = lignesFic.noFic 
   INNER JOIN articles ON lignesFic.refart = articles.refart 
   INNER JOIN grilletarifs ON articles.codeCate = grilletarifs.codeCate AND articles.codeGam = grilletarifs.codeGam
   INNER JOIN tarifs ON grilletarifs.codeTarif = tarifs.codeTarif 
   WHERE fiches.noFic = 1002;

-- e
   SELECT gammes.libelle, AVG(tarifs.prixJour) 
   FROM gammes 
   INNER JOIN grilletarifs ON gammes.codeGam = grilletarifs.codeGam 
   INNER JOIN tarifs ON grilletarifs.codeTarif = tarifs.codeTarif 
   GROUP BY gammes.libelle;

-- f
   SELECT articles.refart, articles.designation, COUNT(lignesfic.noLig) AS nbLocation
   FROM articles
   INNER JOIN lignesfic ON articles.refart = lignesfic.refart
   GROUP BY articles.refart
   HAVING nbLocation >= 3;

-- g


--Partie facultative

-- h


-- i


-- j


-- k


-- l
