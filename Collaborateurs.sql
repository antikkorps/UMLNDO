CREATE TABLE IF NOT EXISTS collaborateurs(
  matricule varchar(50) PRIMARY KEY NOT NULL,
  actif boolean NOT NULL DEFAULT '1',
  nom varchar(50) NOT NULL,
  prenom varchar(50) NOT NULL,
  pdv_orga_actuelles int(50) NOT NULL,
  pdv_orga_modelisees int(50) NOT NULL,
  pdv_orga_transitoires int(50) NOT NULL,
  pdv_orga_cibles int(50) NOT NULL,
  etp1 int NOT NULL,
  etp2 int NOT NULL,
  FOREIGN KEY (pdv_orga_actuelles) REFERENCES pdv_orga_actuelles(id_orga_actuelle),
  FOREIGN KEY (pdv_orga_modelisees) REFERENCES pdv_orga_modelisees(id_orga_modelisee),
  FOREIGN KEY (pdv_orga_transitoires) REFERENCES pdv_orga_transitoires(id_orga_transitoire),
  FOREIGN KEY (pdv_orga_cibles) REFERENCES pdv_orga_cibles(id_orga_cible),
  FOREIGN KEY (etp1) REFERENCES etp(id_etp),
  FOREIGN KEY (etp2) REFERENCES etp(id_etp)
);

CREATE TABLE IF NOT EXISTS Directions_commerciales(
    id_direction_co int PRIMARY KEY AUTO_INCREMENT,
    nom_direction_co varchar(100) NOT NULL,
    groupement_pdv int NOT NULL,
    secteur int NOT NULL,
    collaborateurs varchar NOT NULL,
    metiers int NOT NULL,
    activites int NOT NULL,
    FOREIGN KEY (groupement_pdv) REFERENCES groupement_pdv(id_groupement_pdv),
    FOREIGN KEY (secteur) REFERENCES secteurs(id_secteur),
    FOREIGN KEY (collaborateurs) REFERENCES collaborateurs(matricule),
    FOREIGN KEY (metiers) REFERENCES metiers(id_metier),
    FOREIGN KEY (activites) REFERENCES activites(id_activite)
);

CREATE TABLE IF NOT EXISTS secteurs(
    id_secteur int PRIMARY KEY AUTO_INCREMENT,
    nom_secteur varchar(100) NOT NULL,
    groupement_pdv int NOT NULL,
    direction_co int NOT NULL,
    collaborateurs varchar NOT NULL,
    metiers int NOT NULL,
    activites int NOT NULL,
    FOREIGN KEY (groupement_pdv) REFERENCES groupement_pdv(id_groupement_pdv),
    FOREIGN KEY (direction_co) REFERENCES Directions_commerciales(id_direction_co),
    FOREIGN KEY (collaborateur) REFERENCES collaborateurs(matricule),
    FOREIGN KEY (metiers) REFERENCES metiers(id_metier),
    FOREIGN KEY (activites) REFERENCES activites(id_activite)
);

CREATE TABLE IF NOT EXISTS Groupement_pdv(
    id_groupement_pdv int PRIMARY KEY AUTO_INCREMENT,
    nom_groupement_pdv varchar(100) NOT NULL,
    pdv int NOT NULL,
    secteur int NOT NULL
    direction_co int NOT NULL,
    collaborateurs varchar NOT NULL,
    metiers int NOT NULL,
    activites int NOT NULL,
    FOREIGN KEY (pdv) REFERENCES pdv(id_pdv),
    FOREIGN KEY (secteur) REFERENCES secteurs(id_secteur),
    FOREIGN KEY (direction_co) REFERENCES Directions_commerciales(id_direction_co),
    FOREIGN KEY (collaborateur) REFERENCES collaborateurs(matricule),
    FOREIGN KEY (metiers) REFERENCES metiers(id_metier),
    FOREIGN KEY (activites) REFERENCES activites(id_activite)
);

CREATE TABLE IF NOT EXISTS pdv(
    id_pdv int PRIMARY KEY AUTO_INCREMENT,
    nom_pdv varchar(100) NOT NULL,
    groupement_pdv int NOT NULL,
    secteur int NOT NULL,
    direction_co int NOT NULL,
    collaborateurs varchar NOT NULL,
    metiers int NOT NULL,
    activites int NOT NULL,
    FOREIGN KEY (groupement_pdv) REFERENCES groupement_pdv(id_groupement_pdv),
    FOREIGN KEY (secteur) REFERENCES secteurs(id_secteur),
    FOREIGN KEY (direction_co) REFERENCES Directions_commerciales(id_direction_co),
    FOREIGN KEY (collaborateur) REFERENCES collaborateurs(matricule),
    FOREIGN KEY (metiers) REFERENCES metiers(id_metier),
    FOREIGN KEY (activites) REFERENCES activites(id_activite)
);

CREATE TABLE IF NOT EXISTS ETP(
    id_etp int PRIMARY KEY AUTO_INCREMENT,
    etp FLOAT NOT NULL
);

CREATE TABLE IF NOT EXISTS activites(
    id_activite int PRIMARY KEY AUTO_INCREMENT,
    nom_activite varchar(100) NOT NULL,
    collaborateurs varchar NOT NULL,
    FOREIGN KEY (collaborateur) REFERENCES collaborateurs(matricule)
);

CREATE TABLE IF NOT EXISTS metiers(
    id_metier int PRIMARY KEY AUTO_INCREMENT,
    nom_metier varchar(100) NOT NULL,
    collaborateurs varchar NOT NULL,
    FOREIGN KEY (collaborateur) REFERENCES collaborateurs(matricule)
);

CREATE TABLE IF NOT EXISTS filieres(
    id_filiere int PRIMARY KEY AUTO_INCREMENT,
    nom_filiere varchar(100) NOT NULL,
    collaborateurs varchar NOT NULL,
    FOREIGN KEY (collaborateur) REFERENCES collaborateurs(matricule)
);

CREATE TABLE IF NOT EXISTS contrats (
    id_contrat int PRIMARY KEY AUTO_INCREMENT,
    nom_contrat varchar(100) NOT NULL,
    etp int NOT NULL,
    nom_metier int NOT NULL,
    FOREIGN KEY (etp) REFERENCES etp(id_etp),
    FOREIGN KEY (nom_metier) REFERENCES metiers(id_metier)
);

CREATE TABLE IF NOT EXISTS pdv_orga_actuelles (
    id_orga_actuelle int PRIMARY KEY AUTO_INCREMENT,
    pdv int NOT NULL,
    groupement_pdv int NOT NULL,
    secteur int NOT NULL,
    direction_co int NOT NULL,
    collaborateurs varchar NOT NULL,
    etp int NOT NULL,
    secteur int NOT NULL,
    metier int NOT NULL
    contrat int NOT NULL,
    FOREIGN KEY (pdv) REFERENCES pdv(id_pdv),
    FOREIGN KEY (groupement_pdv) REFERENCES groupement_pdv(id_groupement_pdv),
    FOREIGN KEY (secteur) REFERENCES secteurs(id_secteur),
    FOREIGN KEY (direction_co) REFERENCES Directions_commerciales(id_direction_co),
    FOREIGN KEY (collaborateur) REFERENCES collaborateurs(matricule),
    FOREIGN KEY (etp) REFERENCES etp(id_etp),
    FOREIGN KEY (secteur) REFERENCES secteurs(id_secteur),
    FOREIGN KEY (metier) REFERENCES metiers(id_metier),
    FOREIGN KEY (contrat) REFERENCES contrats(id_contrat)
);

CREATE TABLE IF NOT EXISTS pdv_orga_modelisees (
    id_orga_modelisee int PRIMARY KEY NOT NULL,
    pdv int NOT NULL,
    groupement_pdv int NOT NULL,
    secteur int NOT NULL,
    direction_co int NOT NULL,
    collaborateurs varchar NOT NULL,
    etp int NOT NULL,
    secteur int NOT NULL,
    metier int NOT NULL,
    contrat int NOT NULL,
    FOREIGN KEY (pdv) REFERENCES pdv(id_pdv),
    FOREIGN KEY (groupement_pdv) REFERENCES groupement_pdv(id_groupement_pdv),
    FOREIGN KEY (secteur) REFERENCES secteurs(id_secteur),
    FOREIGN KEY (direction_co) REFERENCES Directions_commerciales(id_direction_co),
    FOREIGN KEY (collaborateur) REFERENCES collaborateurs(matricule),
    FOREIGN KEY (etp) REFERENCES etp(id_etp),
    FOREIGN KEY (secteur) REFERENCES secteurs(id_secteur),
    FOREIGN KEY (metier) REFERENCES metiers(id_metier),
    FOREIGN KEY (contrat) REFERENCES contrats(id_contrat)
);

CREATE TABLE IF NOT EXISTS pdv_orga_transitoires (
    id_orga_transitoire int PRIMARY KEY NOT NULL,
    pdv int NOT NULL,
    groupement_pdv int NOT NULL,
    secteur int NOT NULL,
    direction_co int NOT NULL,
    collaborateurs varchar NOT NULL,
    etp int NOT NULL,
    secteur int NOT NULL,
    metier int NOT NULL,
    contrat int NOT NULL,
    FOREIGN KEY (pdv) REFERENCES pdv(id_pdv),
    FOREIGN KEY (groupement_pdv) REFERENCES groupement_pdv(id_groupement_pdv),
    FOREIGN KEY (secteur) REFERENCES secteurs(id_secteur),
    FOREIGN KEY (direction_co) REFERENCES Directions_commerciales(id_direction_co),
    FOREIGN KEY (collaborateur) REFERENCES collaborateurs(matricule),
    FOREIGN KEY (etp) REFERENCES etp(id_etp),
    FOREIGN KEY (secteur) REFERENCES secteurs(id_secteur),
    FOREIGN KEY (metier) REFERENCES metiers(id_metier),
    FOREIGN KEY (contrat) REFERENCES contrats(id_contrat)
);

CREATE TABLE IF NOT EXISTS pdv_orga_cibles (
    id_orga_cible int PRIMARY KEY NOT NULL,
    date_du_mouvement DATE NOT NULL,
    pdv int NOT NULL,
    groupement_pdv int NOT NULL,
    secteur int NOT NULL,
    direction_co int NOT NULL,
    collaborateur varchar NOT NULL,
    etp int NOT NULL,
    secteur int NOT NULL,
    metier int NOT NULL,
    contrat int NOT NULL,
    FOREIGN KEY (pdv) REFERENCES pdv(id_pdv),
    FOREIGN KEY (groupement_pdv) REFERENCES groupement_pdv(id_groupement_pdv),
    FOREIGN KEY (secteur) REFERENCES secteurs(id_secteur),
    FOREIGN KEY (direction_co) REFERENCES Directions_commerciales(id_direction_co),
    FOREIGN KEY (collaborateur) REFERENCES collaborateurs(matricule),
    FOREIGN KEY (etp) REFERENCES etp(id_etp),
    FOREIGN KEY (secteur) REFERENCES secteurs(id_secteur),
    FOREIGN KEY (metier) REFERENCES metiers(id_metier),
    FOREIGN KEY (contrat) REFERENCES contrats(id_contrat)
);
