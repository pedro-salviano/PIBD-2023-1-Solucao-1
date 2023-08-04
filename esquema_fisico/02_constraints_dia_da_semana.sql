ALTER TABLE andifes.dia_da_semana
    ADD CONSTRAINT fk_idioma
        FOREIGN KEY(idioma)
        REFERENCES trilhas_ofertadas(idioma)
                ON DELETE CASCADE
                ON UPDATE CASCADE;

ALTER TABLE andifes.dia_da_semana
    ADD CONSTRAINT fk_codigo
        FOREIGN KEY(codigo)
        REFERENCES componenteCurricular(codigo)
                ON DELETE CASCADE
                ON UPDATE CASCADE;