CREATE TABLE IF NOT EXISTS collaborateurs(
  id_collaborateur int(11) NOT NULL,
  actif boolean NOT NULL DEFAULT '1',
  nom varchar(50) NOT NULL,
  prenom varchar(50) NOT NULL, 
);

CREATE TABLE IF NOT EXISTS Directions_commerciales(
    id_direction_co int(11) NOT NULL,
    nom_direction_co varchar(100) NOT NULL,
);

CREATE TABLE IF NOT EXISTS secteurs(
    id_secteur int(11) NOT NULL,
    nom_secteur varchar(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Groupement_pdv(
    id_groupement_pdv int(11) NOT NULL,
    nom_groupement_pdv varchar(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS pdv(
    id_pdv int(11) NOT NULL,
    nom_pdv varchar(100) NOT NULL,
    /*
    MATERIALISER LES ORGANISATIONS ACTUELLES, MODELISEES, TRANSITOIRES ET CIBLES
    id_groupement_pdv int(11) NOT NULL,
    id_secteur int(11) NOT NULL,
    id_direction_co int(11) NOT NULL,
    id_collaborateur int(11) NOT NULL
    */
);




  INSERT INTO collaborateurs (id_collaborateur, nom, prenom, adresse, code_postal, ville) VALUES (52000, 'Muller', 'Karl', '28 place de l\'Eperon', '72000', 'Le Mans');