ALTER TABLE andifes.trilhas_horas_praticas
    ADD CONSTRAINT FK_horas_praticas
        FOREIGN KEY(horas_praticas)
            REFERENCES trilhas_ofertadas(horas_praticas)
                ON DELETE CASCADE
                ON UPDATE CASCADE;

ALTER TABLE andifes.trilhas_horas_praticas
    ADD CONSTRAINT FK_horas_teoricas
        FOREIGN KEY(horas_teoricas)
            REFERENCES trilhas_ofertadas(horas_teoricas)
                ON DELETE CASCADE
                ON UPDATE CASCADE;