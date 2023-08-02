CREATE TABLE dia_da_semana(
    id SERIALIZABLE UNIQUE NOT NULL,
    -- fk trilha idioma
    -- fk comp_curr(codigo)
    dia_da_semana ENUM NOT NULL,
    PRIMARY KEY(id)
    /*
    CONSTRAINT fk_trilhas_ofertadas
        FOREIGN KEY(idioma)
        REFERENCES trilhas_ofertadas(idioma)
                ON DELETE CASCADE
                ON UPDATE CASCADE
    CONSTRAINT fk_componenteCurricular
        FOREIGN KEY(codigo)
        REFERENCES componenteCurricular(codigo)
                ON DELETE CASCADE
                ON UPDATE CASCADE
    */
)

CREATE TABLE trilhas_ofertadas(
    idioma VARCHAR(20) UNIQUE NOT NULL,
    link_ementa VARCHAR(200),
    horas_teoricas INTEGER,
    horas_praticas INTEGER,
)

CREATE TABLE trilhas_horas_praticas(
    id SERIALIZABLE UNIQUE NOT NULL
    horas_praticas INTEGER,
    horas_teoricas INTEGER,
    carga_horaria INTEGER
    /*
    CONSTRAINT fk_trilha_ofertada
        FOREIGN KEY(horas_praticas)
            REFERENCES trilhas_ofertadas(horas_praticas)
                ON DELETE CASCADE
                ON UPDATE CASCADE

        FOREIGN KEY(horas_teoricas)
            REFERENCES trilhas_ofertadas(horas_teoricas)
                ON DELETE CASCADE
                ON UPDATE CASCADE
    */
)

CREATE TABLE repositorio(
    codigo_rep INTEGER UNIQUE NOT NULL
    link_ementa VARCHAR(200),
    data_fim DATE, 
  	referencia VARCHAR(200),
  	nome_completo VARCHAR(200)
  PRIMARY Key(codigo_rep)
)

  
CREATE TABLE colaboracao_repositorio(
    id SERIALIZABLE UNIQUE NOT NULL,
    CONSTRAINT
  		FOREIGN KEY(codigo_rep)
  			REFERENCES repositorio(codigo_rep)
  				ON DELETE CASCADE
  				On Update Cascade
    -- fk  esp especialista cod
    -- fk prof orientador cod
    PRIMARY KEY(id)
)

