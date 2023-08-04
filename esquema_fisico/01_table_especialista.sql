CREATE TABLE especialista (
  Identidade VARCHAR(11) PRIMARY KEY,
  IES_Sigla VARCHAR(10) REFERENCES IES(IES_Sigla),
  Biodata TEXT,
  Dispo_Ministrar INTEGER(2),
  Titulacao VARCHAR(100) NOT NULL,
  Dispo_Ori_Esp INTEGER(2),
  Vinculo_File VARCHAR(255) NOT NULL,
  Curriculo VARCHAR(255) NOT NULL,
  Data_Credenciamento DATE not NULL,
  Disponibilidade_Autor BOOLEAN not NULL,
  Reset_Need BOOLEAN,
  Diploma_File VARCHAR(255) NOT NULL,
  Link_Cnpq VARCHAR(255) NOT NULL,
  Poca_File VARCHAR(255) NOT NULL,
  Registro_Autoria VARCHAR(255),
  Registro_Ministrante VARCHAR(255),
  registroMinistrante VARCHAR(100),
  Atuacao_IsF_Anterior BOOLEAN
  
);
