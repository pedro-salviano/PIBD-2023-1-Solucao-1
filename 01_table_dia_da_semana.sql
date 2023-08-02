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