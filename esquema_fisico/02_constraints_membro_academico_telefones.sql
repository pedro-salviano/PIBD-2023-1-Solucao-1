ALTER TABLE andifes.membro_academico_telefones
ADD CONSTRAINT membro_academico_identidade FOREIGN KEY (identidade) REFERENCES membro_academico (identidade);

ALTER TABLE andifes.membro_academico_telefones
ADD CONSTRAINT PK_membro_academico_telefones PRIMARY KEY (membro_academico_identidade, ddd, ddi, numero);