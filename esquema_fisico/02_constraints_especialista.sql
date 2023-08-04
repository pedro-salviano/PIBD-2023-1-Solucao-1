

ALTER TABLE andifes.especialista
    ADD CONSTRAINT FK_Identidade
        FOREIGN KEY (Identidade)
        REFERENCES membro_academico(Identidade);