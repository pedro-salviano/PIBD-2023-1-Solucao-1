ALTER TABLE dia_da_semana
    ADD CONSTRAINT fk_oferta_id
        FOREIGN KEY(trilha_ofertada_id)
        REFERENCES trilhas_ofertadas(id)
                ON DELETE CASCADE
                ON UPDATE CASCADE;

ALTER TABLE dia_da_semana
    ADD CONSTRAINT fk_codigo
        FOREIGN KEY(codigo)
        REFERENCES componenteCurricular(codigo)
                ON DELETE CASCADE
                ON UPDATE CASCADE;
