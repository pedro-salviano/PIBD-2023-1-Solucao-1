ALTER TABLE membro_academico_telefone
    ADD CONSTRAINT FK_membro_academico_id FOREIGN KEY (membro_academico_id) REFERENCES membro_academico (id);

