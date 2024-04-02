-- afficher le plus gros salaire (avec MAX)
    SELECT MAX(`salaire_annuel`) FROM `invpersonne`;

-- afficher le plus petit salaire (avec MIN)
    SELECT MIN(`salaire_annuel`) FROM `invpersonne`;

--afficher le nom de la personne du plus petit salaire
    SELECT `nom` FROM `invpersonne` WHERE `salaire_annuel`= (SELECT MIN(`salaire_annuel`)FROM `invpersonne`);

--afficher le nom de la personne du plus gros salaire
    SELECT `nom` FROM `invpersonne` WHERE `salaire_annuel`= (SELECT MAX(`salaire_annuel`)FROM `invpersonne`);

--afficher le CA moyen
    SELECT MAX(`salaire_annuel`) FROM `invpersonne`;

--afficher le nombre de client
    SELECT MAX(`salaire_annuel`) FROM `invpersonne`;

--proposer une requete avec BETWEEN
    SELECT MAX(`salaire_annuel`) FROM `invpersonne`;

--proposer une requete avec UCASE(), UPPER(),LCASE(),LOWER()
    SELECT MAX(`salaire_annuel`) FROM `invpersonne`;

--proposer une requete avec LIKE '%..%'
    SELECT MAX(`salaire_annuel`) FROM `invpersonne`;

--Trier par age les membres
    SELECT MAX(`salaire_annuel`) FROM `invpersonne`;