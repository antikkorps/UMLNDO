CREATE TABLE IF NOT EXISTS collaborateurs(
  id_collaborateur int(11) NOT NULL,
  actif boolean NOT NULL DEFAULT '1',
  nom varchar(50) NOT NULL,
  prenom varchar(50) NOT NULL, 
);

CREATE TABLE IF NOT EXISTS secteurs(
    id_secteur int(11) NOT NULL,
    nom_secteur varchar(50) NOT NULL
);



  INSERT INTO collaborateurs (id_collaborateur, nom, prenom, adresse, code_postal, ville) VALUES (52000, 'Muller', 'Karl', '28 place de l\'Eperon', '72000', 'Le Mans');