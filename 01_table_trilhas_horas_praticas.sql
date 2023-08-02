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
