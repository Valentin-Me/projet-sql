-- afficher le plus gros salaire (avec MAX)
    SELECT MAX(`salaire_annuel`) FROM `invpersonne`;

-- afficher le plus petit salaire (avec MIN)
    SELECT MIN(`salaire_annuel`) FROM `invpersonne`;

--afficher le nom de la personne du plus petit salaire
    SELECT `nom` FROM `invpersonne` WHERE `salaire_annuel`= (SELECT MIN(`salaire_annuel`)FROM `invpersonne`);

--afficher le nom de la personne du plus gros salaire
    SELECT `nom` FROM `invpersonne` WHERE `salaire_annuel`= (SELECT MAX(`salaire_annuel`)FROM `invpersonne`);

--afficher le salaire moyen
    SELECT AVG(`salaire_annuel`) FROM `invpersonne`;

--afficher le nombre de client
    SELECT COUNT(`type`) FROM `invpersonne` WHERE `type` = "membre";

--proposer une requete avec BETWEEN
    SELECT `nom`FROM `invpersonne` WHERE `age` BETWEEN 60 AND 65;

--proposer une requete avec UCASE(), UPPER(),LCASE(),LOWER()
    SELECT UPPER(`nom`) FROM `invpersonne`;
    SELECT LOWER(`nom`) FROM `invpersonne`;

--proposer une requete avec LIKE '%..%'
    SELECT `prenom` FROM `invpersonne` WHERE `prenom` LIKE "%or%";

--Trier par age les membres
    SELECT `nom` FROM `invpersonne` ORDER BY `age` ASC;
    SELECT `nom` FROM `invpersonne` ORDER BY `age` DESC;