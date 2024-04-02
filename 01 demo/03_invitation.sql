USE invitation;

-- DEFAULT
-- si on ne met pas la contrainte de NULLITÉ
-- alors le champ peut être NULL

CREATE TABLE invPersonne( 
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    prenom VARCHAR(50) NOT NULL, 
    nom VARCHAR(50) NOT NULL, 
    age TINYINT(1) NOT NULL, 
    date_inscription DATE NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    status boolean, 
    type ENUM ('membre','non membre') NOT NULL DEFAULT 'non membre', 
    description text, 
    salaire_annuel int NOT NULL
) ENGINE=InnoDB;