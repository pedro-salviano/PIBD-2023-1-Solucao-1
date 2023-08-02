ALTER TABLE membro_academico_enderecos
    ADD CONSTRAINT FK_membro_academico_identidade_endereco FOREIGN KEY (identidade) REFERENCES membro_academico (identidade);

ALTER TABLE membro_academico_enderecos
    ADD CONSTRAINT FK_membro_academico_surrogate_endereco FOREIGN KEY (id_membro_academico) REFERENCES membro_academico (id_membro_academico);

