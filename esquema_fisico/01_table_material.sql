CREATE TABLE IF NOT EXISTS material( 
	material_id SERIAL CONSTRAINT PK_material_id PRIMARY KEY,  /* surrogate sequencial */
	endereco_link VARCHAR(100) NOT NULL,                       /* link do caminho do material */
	codigo_componente VARCHAR(10) NOT NULL,                    /* FK para componente_curricular */
	estado VARCHAR(20),                                        /* estado: obsoleto, incompleto, completo */
	material_anterior INT                                      /* FK para material, para versionamento */
);
