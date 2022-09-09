CREATE TABLE IF NOT EXISTS collaborateurs(
  matricule int NOT NULL,
  actif boolean NOT NULL DEFAULT '1',
  nom varchar(50) NOT NULL,
  prenom varchar(50) NOT NULL,
);

CREATE TABLE IF NOT EXISTS Directions_commerciales(
    id_direction_co int NOT NULL,
    nom_direction_co varchar(100) NOT NULL,
);

CREATE TABLE IF NOT EXISTS secteurs(
    id_secteur int NOT NULL,
    nom_secteur varchar(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Groupement_pdv(
    id_groupement_pdv int NOT NULL,
    nom_groupement_pdv varchar(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS pdv(
    id_pdv int NOT NULL,
    nom_pdv varchar(100) NOT NULL,
    /*
    MATERIALISER LES ORGANISATIONS ACTUELLES, MODELISEES, TRANSITOIRES ET CIBLES
    id_groupement_pdv int(11) NOT NULL,
    id_secteur int(11) NOT NULL,
    id_direction_co int(11) NOT NULL,
    id_collaborateur int(11) NOT NULL
    */
);

CREATE TABLE IF NOT EXISTS ETP(
    id_ETP int NOT NULL,
    ETP FLOAT NOT NULL
    /*Foreign key (ETP) references*/

);

CREATE TABLE IF NOT EXISTS metiers(
    id_metier int NOT NULL,
    nom_metier varchar(100) NOT NULL
    /*Foreign key (nom_contrat)*/
);

CREATE TABLE IF NOT EXISTS contrats (
    id_contrat int NOT NULL,
    nom_contrat varchar(100) NOT NULL
    /*Foreign key (ETP)
    Foreign key (nom_metier)*/
);

CREATE TABLE IF NOT EXISTS pdv_orga_actuelles (
    id_orga_actuelle int NOT NULL,
    /*Foreign key (id_pdv)
    Foreign key (id_groupement_pdv)
    Foreign key (id_secteur)
    Foreign key (id_direction_co)
    Foreign key (id_collaborateur)
    Foreign key (id_ETP)
    Foreign key (id_secteur)
    Foreign Key (id_metier)
    Foreign key (id_contrat)*/
);

CREATE TABLE IF NOT EXISTS pdv_orga_modelisees (
    id_orga_modelisee int NOT NULL,
    /*Foreign key (id_pdv)
    Foreign key (id_groupement_pdv)
    Foreign key (id_secteur)
    Foreign key (id_direction_co)
    Foreign key (id_collaborateur)
    Foreign key (id_ETP)
    Foreign key (id_secteur)
    Foreign Key (id_metier)
    Foreign key (id_contrat)*/
);

CREATE TABLE IF NOT EXISTS pdv_orga_transitoires (
    id_orga_transitoire int NOT NULL,
    /*Foreign key (id_pdv)
    Foreign key (id_groupement_pdv)
    Foreign key (id_secteur)
    Foreign key (id_direction_co)
    Foreign key (id_collaborateur)
    Foreign key (id_ETP)
    Foreign key (id_secteur)
    Foreign Key (id_metier)
    Foreign key (id_contrat)*/
);

CREATE TABLE IF NOT EXISTS pdv_orga_cibles (
    id_orga_cible int NOT NULL,
    date_du_mouvement DATE NOT NULL
    /*Foreign key (id_pdv)
    Foreign key (id_groupement_pdv)
    Foreign key (id_secteur)
    Foreign key (id_direction_co)
    Foreign key (id_collaborateur)
    Foreign key (id_ETP)
    Foreign key (id_secteur)
    Foreign Key (id_metier)
    Foreign key (id_contrat)*/
);




  INSERT INTO collaborateurs (id_collaborateur, nom, prenom, adresse, code_postal, ville) VALUES (52000, 'Muller', 'Karl', '28 place de l\'Eperon', '72000', 'Le Mans');