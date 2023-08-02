ALTER TABLE andifes.Membro_institucional
ADD CONSTRAINT FK_Membro_Academico_Identidade FOREIGN KEY (Membro_Academico_Identidade) REFERENCES andifes.Membro_academico (Identidade);