CREATE TABLE IF NOT EXISTS Parceiro(
    Id SERIAL PRIMARY KEY,
	Num_Identificador VARCHAR(50),
	Pais_Origem VARCHAR(50),
	Nome VARCHAR(50),
	tipo tipo_parceiro NOT NULL,
);
