CREATE TABLE IF NOT EXISTS pdv_orga_actuelles (
    id_pdv_orga_actuelle int PRIMARY KEY AUTO_INCREMENT,
    pdv_actuel int,
    groupement_pdv_actuel int NOT NULL,
    secteur_actuel int NOT NULL,
    direction_co_actuel int NOT NULL,
    collaborateur_actuel varchar(50) NOT NULL,
    etp_actuel int NOT NULL,
    metier_actuel int NOT NULL,
    contrat_actuel int NOT NULL,
    filieres_actuel int NOT NULL
);

CREATE TABLE IF NOT EXISTS pdv_orga_modelisees (
    id_orga_modelisee int PRIMARY KEY NOT NULL,
    pdv_modelise int NOT NULL,
    groupement_pdv_modelise int NOT NULL,
    secteur_modelise int NOT NULL,
    direction_co_modelise int NOT NULL,
    collaborateur_modelise varchar(50) NOT NULL,
    etp_modelise int NOT NULL,
    metier_modelise int NOT NULL,
    contrat_modelise int NOT NULL,
    filieres_modelisee int NOT NULL
    
);

CREATE TABLE IF NOT EXISTS pdv_orga_transitoires (
    id_orga_transitoire int PRIMARY KEY NOT NULL,
    pdv_transitoire int NOT NULL,
    groupement_pdv_transitoire int NOT NULL,
    secteur_transitoire int NOT NULL,
    direction_co_transitoire int NOT NULL,
    collaborateur_transitoire varchar(50) NOT NULL,
    etp_transitoire int NOT NULL,
    metier_transitoire int NOT NULL,
    contrat_transitoire int NOT NULL,
    filieres_transitoire int NOT NULL
    
);

CREATE TABLE IF NOT EXISTS pdv_orga_cibles (
    id_orga_cible int PRIMARY KEY NOT NULL,
    date_du_mouvement DATE NOT NULL,
    pdv_cible int NOT NULL,
    groupement_pdv_cible int NOT NULL,
    secteur_cible int NOT NULL,
    direction_co_cible int NOT NULL,
    collaborateur_cible varchar(50) NOT NULL,
    etp_cible int NOT NULL,
    metier_cible int NOT NULL,
    contrat_cible int NOT NULL,
    filieres_cible int NOT NULL
    
);

CREATE TABLE IF NOT EXISTS collaborateur(
  matricule varchar(50) PRIMARY KEY NOT NULL DEFAULT 'A définir',
  actif boolean NOT NULL DEFAULT '1',
  nom varchar(50) NOT NULL,
  prenom varchar(50) NOT NULL,
  pdv_orga_actuelles int,
  pdv_orga_modelisees int,
  pdv_orga_transitoires int,
  pdv_orga_cibles int,
  etp1 int,
  etp2 int
);

CREATE TABLE IF NOT EXISTS Directions_commerciales(
    id_direction_co int PRIMARY KEY AUTO_INCREMENT,
    nom_direction_co varchar(100) NOT NULL,
    groupement_pdv int NOT NULL,
    secteur int NOT NULL,
    collaborateurs varchar(50) NOT NULL,
    metiers int NOT NULL,
    activite int NOT NULL
);

CREATE TABLE IF NOT EXISTS secteurs(
    id_secteur int PRIMARY KEY AUTO_INCREMENT,
    nom_secteur varchar(100) NOT NULL,
    groupement_pdv int NOT NULL,
    direction_co int NOT NULL,
    collaborateurs varchar(50) NOT NULL,
    metiers int NOT NULL,
    activite int NOT NULL
);

CREATE TABLE IF NOT EXISTS groupement_pdv(
    id_groupement_pdv int PRIMARY KEY AUTO_INCREMENT,
    nom_groupement_pdv varchar(100) NOT NULL,
    pdv int NOT NULL,
    secteur int NOT NULL,
    direction_co int NOT NULL,
    collaborateurs varchar(50) NOT NULL,
    metiers int NOT NULL,
    activite int NOT NULL
);

CREATE TABLE IF NOT EXISTS pdv(
    id_pdv int PRIMARY KEY,
    nom_pdv varchar(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS etps(
    id_etp int PRIMARY KEY AUTO_INCREMENT,
    etp varchar(50) NOT NULL DEFAULT 'A définir'
);

CREATE TABLE IF NOT EXISTS activites(
    id_activite int PRIMARY KEY AUTO_INCREMENT,
    nom_activite varchar(100) NOT NULL DEFAULT 'A définir',
    collaborateurs varchar(50)
    
);

CREATE TABLE IF NOT EXISTS metiers(
    id_metier int PRIMARY KEY AUTO_INCREMENT,
    nom_metier varchar(100) NOT NULL DEFAULT 'A définir',
    collaborateurs varchar(50),
    activite int
    
);

CREATE TABLE IF NOT EXISTS filieres(
    id_filiere int PRIMARY KEY AUTO_INCREMENT,
    nom_filiere varchar(100) NOT NULL DEFAULT 'A définir',
    collaborateurs varchar(50),
    activite int

);

CREATE TABLE IF NOT EXISTS contrats (
    id_contrat int PRIMARY KEY AUTO_INCREMENT,
    nom_contrat varchar(100) NOT NULL DEFAULT 'A définir',
    etp int,
    nom_metier int,
    collaborateurs varchar(50),
    activite int

);

CREATE TABLE taux_de_presence (
    id_taux_de_presence int PRIMARY KEY AUTO_INCREMENT,
    taux_de_presence int NOT NULL,
    collaborateur varchar(50) NOT NULL,
    activite int NOT NULL,
    metier int NOT NULL,
    contrat int NOT NULL,
    filiere int NOT NULL
);


ALTER TABLE pdv_orga_actuelles
ADD FOREIGN KEY (id_pdv_orga_actuelle) REFERENCES pdv(id_pdv),
ADD FOREIGN KEY (groupement_pdv_actuel) REFERENCES groupement_pdv(id_groupement_pdv),
ADD FOREIGN KEY (secteur_actuel) REFERENCES secteurs(id_secteur),
ADD FOREIGN KEY (direction_co_actuel) REFERENCES Directions_commerciales(id_direction_co),
ADD FOREIGN KEY (collaborateur_actuel) REFERENCES collaborateur(matricule),
ADD FOREIGN KEY (etp_actuel) REFERENCES etps(id_etp),
ADD FOREIGN KEY (metier_actuel) REFERENCES metiers(id_metier),
ADD FOREIGN KEY (contrat_actuel) REFERENCES contrats(id_contrat),
ADD FOREIGN KEY (filieres_actuel) REFERENCES filieres(id_filiere);

ALTER TABLE pdv_orga_modelisees
ADD FOREIGN KEY (pdv_modelise) REFERENCES pdv(id_pdv),
ADD FOREIGN KEY (groupement_pdv_modelise) REFERENCES groupement_pdv(id_groupement_pdv),
ADD FOREIGN KEY (secteur_modelise) REFERENCES secteurs(id_secteur),
ADD FOREIGN KEY (direction_co_modelise) REFERENCES Directions_commerciales(id_direction_co),
ADD FOREIGN KEY (collaborateur_modelise) REFERENCES collaborateur(matricule),
ADD FOREIGN KEY (etp_modelise) REFERENCES etps(id_etp),
ADD FOREIGN KEY (secteur_modelise) REFERENCES secteurs(id_secteur),
ADD FOREIGN KEY (metier_modelise) REFERENCES metiers(id_metier),
ADD FOREIGN KEY (contrat_modelise) REFERENCES contrats(id_contrat),
ADD FOREIGN KEY (filieres_modelisee) REFERENCES filieres(id_filiere);

ALTER TABLE pdv_orga_transitoires
ADD FOREIGN KEY (pdv_transitoire) REFERENCES pdv(id_pdv),
ADD FOREIGN KEY (groupement_pdv_transitoire) REFERENCES groupement_pdv(id_groupement_pdv),
ADD FOREIGN KEY (secteur_transitoire) REFERENCES secteurs(id_secteur),
ADD FOREIGN KEY (direction_co_transitoire) REFERENCES Directions_commerciales(id_direction_co),
ADD FOREIGN KEY (collaborateur_transitoire) REFERENCES collaborateur(matricule),
ADD FOREIGN KEY (etp_transitoire) REFERENCES etps(id_etp),
ADD FOREIGN KEY (secteur_transitoire) REFERENCES secteurs(id_secteur),
ADD FOREIGN KEY (metier_transitoire) REFERENCES metiers(id_metier),
ADD FOREIGN KEY (contrat_transitoire) REFERENCES contrats(id_contrat),
ADD FOREIGN KEY (filieres_transitoire) REFERENCES filieres(id_filiere);

ALTER TABLE pdv_orga_cibles
ADD FOREIGN KEY (pdv_cible) REFERENCES pdv(id_pdv),
ADD FOREIGN KEY (groupement_pdv_cible) REFERENCES groupement_pdv(id_groupement_pdv),
ADD FOREIGN KEY (secteur_cible) REFERENCES secteurs(id_secteur),
ADD FOREIGN KEY (direction_co_cible) REFERENCES Directions_commerciales(id_direction_co),
ADD FOREIGN KEY (collaborateur_cible) REFERENCES collaborateur(matricule),
ADD FOREIGN KEY (etp_cible) REFERENCES etps(id_etp),
ADD FOREIGN KEY (secteur_cible) REFERENCES secteurs(id_secteur),
ADD FOREIGN KEY (metier_cible) REFERENCES metiers(id_metier),
ADD FOREIGN KEY (contrat_cible) REFERENCES contrats(id_contrat),
ADD FOREIGN KEY (filieres_cible) REFERENCES filieres(id_filiere);

ALTER TABLE collaborateur
ADD FOREIGN KEY (pdv_orga_actuelles) REFERENCES pdv_orga_actuelles(id_pdv_orga_actuelle),
ADD FOREIGN KEY (pdv_orga_modelisees) REFERENCES pdv_orga_modelisees(id_orga_modelisee),
ADD FOREIGN KEY (pdv_orga_transitoires) REFERENCES pdv_orga_transitoires(id_orga_transitoire),
ADD FOREIGN KEY (pdv_orga_cibles) REFERENCES pdv_orga_cibles(id_orga_cible),
ADD FOREIGN KEY (etp1) REFERENCES etps(id_etp),
ADD FOREIGN KEY (etp2) REFERENCES etps(id_etp);

ALTER TABLE Directions_commerciales
ADD FOREIGN KEY (groupement_pdv) REFERENCES groupement_pdv(id_groupement_pdv),
ADD FOREIGN KEY (secteur) REFERENCES secteurs(id_secteur),
ADD FOREIGN KEY (collaborateurs) REFERENCES collaborateur(matricule),
ADD FOREIGN KEY (metiers) REFERENCES metiers(id_metier),
ADD FOREIGN KEY (activite) REFERENCES activites(id_activite);

ALTER TABLE secteurs
ADD FOREIGN KEY (groupement_pdv) REFERENCES groupement_pdv(id_groupement_pdv),
ADD FOREIGN KEY (direction_co) REFERENCES Directions_commerciales(id_direction_co),
ADD FOREIGN KEY (collaborateurs) REFERENCES collaborateur(matricule),
ADD FOREIGN KEY (metiers) REFERENCES metiers(id_metier),
ADD FOREIGN KEY (activite) REFERENCES activites(id_activite);

ALTER TABLE groupement_pdv
ADD FOREIGN KEY (pdv) REFERENCES pdv(id_pdv),
ADD FOREIGN KEY (secteur) REFERENCES secteurs(id_secteur),
ADD FOREIGN KEY (direction_co) REFERENCES Directions_commerciales(id_direction_co),
ADD FOREIGN KEY (collaborateurs) REFERENCES collaborateur(matricule),
ADD FOREIGN KEY (metiers) REFERENCES metiers(id_metier),
ADD FOREIGN KEY (activite) REFERENCES activites(id_activite);

ALTER TABLE activites
ADD FOREIGN KEY (collaborateurs) REFERENCES collaborateur(matricule);

ALTER TABLE metiers
ADD FOREIGN KEY (collaborateurs) REFERENCES collaborateur(matricule),
ADD FOREIGN KEY (activite) REFERENCES activites(id_activite);

ALTER TABLE filieres
ADD FOREIGN KEY (collaborateurs) REFERENCES collaborateur(matricule),
ADD FOREIGN KEY (activite) REFERENCES activites(id_activite);

ALTER TABLE contrats
ADD FOREIGN KEY (collaborateurs) REFERENCES collaborateur(matricule),
ADD FOREIGN KEY (activite) REFERENCES activites(id_activite),
ADD FOREIGN KEY (etp) REFERENCES etps(id_etp),
ADD FOREIGN KEY (nom_metier) REFERENCES metiers(id_metier);

ALTER TABLE taux_de_presence 
ADD FOREIGN KEY (collaborateur) REFERENCES collaborateur(matricule),
ADD FOREIGN KEY (activite) REFERENCES activites(id_activite),
ADD FOREIGN KEY (metier) REFERENCES metiers (id_metier),
ADD FOREIGN KEY (contrat) REFERENCES contrats (id_contrat),
ADD FOREIGN KEY (filiere) REFERENCES filieres (id_filiere);


DROP TABLE collaborateurs, etps, metiers, pdv, groupement_pdv, secteurs, Directions_commerciales, filieres, contrats, pdv_orga_actuelles, pdv_orga_modelisees, pdv_orga_transitoires, pdv_orga_cibles;