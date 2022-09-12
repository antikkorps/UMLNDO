CREATE TABLE IF NOT EXISTS collaborateurs(
  matricule int NOT NULL,
  actif boolean NOT NULL DEFAULT '1',
  nom varchar(50) NOT NULL,
  prenom varchar(50) NOT NULL,
  FOREIGN KEY (etp) REFERENCES etp (id_etp),
  FOREIGN KEY (Directions_commerciales) REFERENCES directions_commerciales (id_direction_commerciale),
  FOREIGN KEY (secteur) REFERENCES secteurs (id_secteur),
  FOREIGN KEY (groupement_pdv) REFERENCES groupements_pdv (id_groupement_pdv),
  FOREIGN KEY (metiers) REFERENCES metiers (id_metier),
  FOREIGN KEY (contrat) REFERENCES contrats (id_contrat),


);

CREATE TABLE IF NOT EXISTS Directions_commerciales(
    id_direction_co int NOT NULL,
    nom_direction_co varchar(100) NOT NULL,
    FOREIGN KEY (matricule) REFERENCES collaborateurs(matricule)
);

CREATE TABLE IF NOT EXISTS secteurs(
    id_secteur int NOT NULL,
    nom_secteur varchar(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Groupement_pdv(
    id_groupement_pdv int NOT NULL,
    nom_groupement_pdv varchar(100) NOT NULL
    FOREIGN KEY (pdv) REFERENCES pdv(id_pdv)
);

CREATE TABLE IF NOT EXISTS pdv(
    id_pdv int NOT NULL,
    nom_pdv varchar(100) NOT NULL,
    FOREIGN KEY (groupement_pdv) REFERENCES groupement_pdv(id_groupement_pdv),
    FOREIGN KEY (secteur) REFERENCES secteurs(id_secteur),
    FOREIGN KEY (direction_co) REFERENCES Directions_commerciales(id_direction_co),
    FOREIGN KEY (collaborateur) REFERENCES collaborateurs(matricule)
);

CREATE TABLE IF NOT EXISTS ETP(
    id_etp int NOT NULL,
    etp FLOAT NOT NULL
);

CREATE TABLE IF NOT EXISTS metiers(
    id_metier int NOT NULL,
    nom_metier varchar(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS contrats (
    id_contrat int NOT NULL,
    nom_contrat varchar(100) NOT NULL
    FOREIGN KEY (etp) REFERENCES etp(id_etp),
    FOREIGN KEY (nom_metier) REFERENCES metiers(id_metier)
);

CREATE TABLE IF NOT EXISTS pdv_orga_actuelles (
    id_orga_actuelle int NOT NULL,
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
    id_orga_modelisee int NOT NULL,
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
    id_orga_transitoire int NOT NULL,
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
    id_orga_cible int NOT NULL,
    date_du_mouvement DATE NOT NULL
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




  INSERT INTO collaborateurs (id_collaborateur, nom, prenom, adresse, code_postal, ville) VALUES (52000, 'Muller', 'Karl', '28 place de l\'Eperon', '72000', 'Le Mans');