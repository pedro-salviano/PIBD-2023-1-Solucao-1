ALTER TABLE andifes.membro_academico_emails
ADD CONSTRAINT membro_academico_identidade FOREIGN KEY (identidade) REFERENCES membro_academico (identidade);

ALTER TABLE andifes.membro_academico_emails
ADD CONSTRAINT PK_membro_academico_emails PRIMARY KEY (membro_academico_identidade, valor, tipo);