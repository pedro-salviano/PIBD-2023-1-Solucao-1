CREATE TABLE IF NOT EXISTS material( 
	material_id SERIAL CONSTRAINT PK_material PRIMARY KEY,     /* surrogate sequencial */
	endereco_link VARCHAR(100) NOT NULL,                       /* link do caminho do material */
	id_componente_curricular INT,                              /* FK para componente_curricular */
	estado VARCHAR(20),                                        /* estado: obsoleto, incompleto, completo */
	material_anterior_id INT                                   /* FK para material, para versionamento */
);
