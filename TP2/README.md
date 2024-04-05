# TP02

-- afficher le plus gros salaire (avec MAX)
```mysql
    SELECT MAX(`salaire_annuel`) 
    FROM `invpersonne`;
```

-- afficher le plus petit salaire (avec MIN)
```mysql
    SELECT MIN(`salaire_annuel`) 
    FROM `invpersonne`;
```

--afficher le nom de la personne du plus petit salaire
```mysql
    SELECT salaire_annuel, prenom, nom 
    FROM `invpersonne` 
    WHERE `salaire_annuel`= (SELECT MIN(`salaire_annuel`)FROM `invpersonne`);
```

--afficher le nom de la personne du plus gros salaire
```mysql
    SELECT salaire_annuel, prenom, nom 
    FROM `invpersonne` 
    WHERE `salaire_annuel`= (SELECT MAX(`salaire_annuel`)FROM `invpersonne`);
```

--afficher le salaire moyen
```mysql
    SELECT AVG(`salaire_annuel`) 
    FROM `invpersonne`;
```

--afficher le nombre de client
```mysql
    SELECT COUNT(`type`) 
    FROM `invpersonne` 
    WHERE `type` = "membre";
```

--proposer une requete avec BETWEEN
```mysql
    SELECT `nom`
    FROM `invpersonne` 
    WHERE `age` BETWEEN 60 AND 65;
```

--proposer une requete avec UCASE(), UPPER(),LCASE(),LOWER()
```mysql
    SELECT UPPER(`nom`) 
    FROM `invpersonne`;

    SELECT LOWER(`nom`) 
    FROM `invpersonne`;
```

--proposer une requete avec LIKE '%..%'
```mysql
    SELECT `prenom` 
    FROM `invpersonne` 
    WHERE `prenom` LIKE "%or%";
```

--Trier par age les membres
```mysql
    SELECT `nom` 
    FROM `invpersonne` 
    ORDER BY `age` ASC;

    SELECT `nom` 
    FROM `invpersonne` 
    ORDER BY `age` DESC;
```

# TP02B

-- 1 - Créer la data base zoo
```mysql
 CREATE DATABASE zoo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

-- 2 - Créer la table chat
```mysql
 CREATE TABLE chat(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    yeux VARCHAR(30) NOT NULL,
    age TINYINT(1) NOT NULL
 ) ENGINE=InnoDB; 
```

-- 3 - ajouter les données
```mysql
 INSERT INTO chat (nom,yeux,age) VALUES
 ('maine coon','marron',20),
 ('siamois','bleu',15),
 ('bengal','marron',18),
 ('Scottish Fold','marron',10);
```

-- 3 - Afficher le chat avec l'id :2
```mysql
 SELECT * FROM `chat` WHERE id=2;
```

-- 4 - Trier les chats par nom et par age
```mysql
 SELECT * FROM `chat` ORDER BY `nom`,`age`;
```

-- 5 - Afficher les chats qui vive entre 11 et 19 ans
```mysql
 SELECT * FROM `chat` WHERE `age` BETWEEN 11 AND 19;
```

-- 5 - Afficher le ou les chats dont le nom contient 'sia'
```mysql
 SELECT * FROM `chat` WHERE `nom` LIKE "%sia%";
```

-- 6 - Afficher la moyenne d'age des chats
```mysql
 SELECT AVG(`age`) FROM `chat`;
```

-- 7 - Afficher le nombre de chats dans la table
```mysql
 SELECT COUNT(`id`) FROM `chat`;
```