ALTER TABLE Membro_institucional 
ADD CONSTRAINT FK_membro_academico_identidade FOREIGN KEY (membro_academico_identidade) REFERENCES membro_academico (identidade);
