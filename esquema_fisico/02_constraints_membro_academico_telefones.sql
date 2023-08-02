ALTER TABLE membro_academico_telefones
    ADD CONSTRAINT FK_membro_academico_identidade_genero FOREIGN KEY (identidade) REFERENCES membro_academico (identidade);

ALTER TABLE membro_academico_telefones
    ADD CONSTRAINT FK_membro_academico_surrogate_genero FOREIGN KEY (id_membro_academico) REFERENCES membro_academico (id_membro_academico);

