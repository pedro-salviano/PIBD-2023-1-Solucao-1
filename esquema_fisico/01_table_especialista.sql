CREATE TABLE especialista (
  Identidade VARCHAR(11) PRIMARY KEY,
  IES_Sigla VARCHAR(10) REFERENCES IES(IES_Sigla),
  Biodata TEXT,
  DispoMinistrar INTEGER(2),
  Titulacao VARCHAR(100) NOT NULL,
  DispoOriEsp INTEGER(2),
  VinculoFile VARCHAR(255) NOT NULL,
  Curriculo VARCHAR(255) NOT NULL,
  DataCredenciamento DATE not NULL,
  DisponibilidadeAutor BOOLEAN not NULL,
  ResetNeed BOOLEAN,
  DiplomaFile VARCHAR(255) NOT NULL,
  LinkCnpq VARCHAR(255) NOT NULL,
  PocaFile VARCHAR(255) NOT NULL,
  RegistroAutoria VARCHAR(255),
  RegistroMinistrante VARCHAR(255),
  Atuacao_IsF_Anterior BOOLEAN
);
