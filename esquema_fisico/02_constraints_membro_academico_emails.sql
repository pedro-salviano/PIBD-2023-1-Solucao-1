ALTER TABLE membro_academico_emails
ADD CONSTRAINT FK_membro_academico_identidade_email FOREIGN KEY (identidade) REFERENCES membro_academico (identidade);

ALTER TABLE membro_academico_emails
ADD CONSTRAINT FK_membro_academico_surrogate_email FOREIGN KEY (id_membro_academico) REFERENCES membro_academico (id_membro_academico);