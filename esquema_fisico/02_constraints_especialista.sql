

ALTER TABLE especialista
    ADD CONSTRAINT FK_membro_academico_id
        FOREIGN KEY (Id)
        REFERENCES membro_academico(Id);
