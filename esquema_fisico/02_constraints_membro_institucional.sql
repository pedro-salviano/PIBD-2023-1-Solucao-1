ALTER TABLE andifes.Membro_institucional
ADD CONSTRAINT FK_membro_academico_identidade FOREIGN KEY (membro_academico_identidade) REFERENCES andifes.membro_academico (identidade);