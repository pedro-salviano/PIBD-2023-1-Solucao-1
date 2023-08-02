ALTER TABLE andifes.membro_academico_genero
ADD CONSTRAINT membro_academico_identidade FOREIGN KEY (identidade) REFERENCES membro_academico (identidade);

ALTER TABLE andifes.membro_academico_genero
ADD CONSTRAINT PK_membro_academico_genero PRIMARY KEY (membro_academico_identidade, genero);
