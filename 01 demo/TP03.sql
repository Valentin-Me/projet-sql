-- 1 - Afficher toutes les factures avec le nom des clients
 SELECT facture.reference,facture.info,facture.total,facture.date_crea,facture.date_paiement,client.nom
 FROM `facture`
 INNER JOIN devis ON facture.devis_id = devis.id
 INNER JOIN projet ON devis.projet_id = projet.id
 INNER JOIN client ON projet.client_id = client.id;

-- 2 - Afficher le nombre de factures par client afficher 0 factures si il n'y a pas de factures
 SELECT COUNT(client.nom) 
 FROM `client` 
 INNER JOIN projet ON client.id = projet.client_id 
 INNER JOIN devis ON projet.id = devis.projet_id 
 INNER JOIN facture ON devis.id = facture.devis_id;

-- 3 - afficher le chiffre d'affaire par client
 

-- 4 - afficher le CA total
 

-- 5 - afficher la somme des factures en attente de paiement
 

-- 6 - afficher les factures en retard de paiment 30 jours max avec le nombre de jours de retard
 