USE invitation;

CREATE TABLE invPersonne( 
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    prenom VARCHAR(255) NOT NULL, 
    nom VARCHAR(255) NOT NULL, 
    age TINYINT(1) NOT NULL, 
    date_inscription DATE NOT NULL, 
    status boolean, 
    type ENUM ('membre','non membre'), 
    description text, 
    salaire_annuel int 
) ENGINE=InnoDB;