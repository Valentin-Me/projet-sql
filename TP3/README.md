# TP03

-- 1 - Afficher toutes les factures avec le nom des clients
```mysql
 SELECT facture.*,client.nom
 FROM `facture`
 INNER JOIN devis ON facture.devis_id = devis.id
 INNER JOIN projet ON devis.projet_id = projet.id
 INNER JOIN client ON projet.client_id = client.id;
```

-- 2 - Afficher le nombre de factures par client afficher 0 factures si il n'y a pas de factures
```mysql
 SELECT client.nom,
 COUNT(facture.id) 
 FROM `client` 
 LEFT JOIN projet ON client.id = projet.client_id 
 LEFT JOIN devis ON projet.id = devis.projet_id 
 LEFT JOIN facture ON devis.id = facture.devis_id
 GROUP BY (client.id) ;
```

-- 3 - afficher le chiffre d'affaire par client
```mysql
 SELECT client.nom, SUM(facture.total) 
 FROM `client` 
 LEFT JOIN projet ON client.id = projet.client_id 
 LEFT JOIN devis ON projet.id = devis.projet_id 
 LEFT JOIN facture ON devis.id = facture.devis_id;
 GROUP BY (client.id);
```

-- 4 - afficher le CA total
```mysql
 SELECT SUM(total) FROM facture;
```

-- 5 - afficher la somme des factures en attente de paiement
```mysql
 SELECT SUM(total) FROM facture WHERE date_paiement IS NULL;
```

-- 6 - afficher les factures en retard de paiment 30 jours max avec le nombre de jours de retard
```mysql
 SELECT facture.*, DATEDIFF(NOW(), date_crea) 
 FROM facture 
 WHERE DATEDIFF(NOW(), date_crea)>30 
 AND date_paiement IS NULL;
 ```