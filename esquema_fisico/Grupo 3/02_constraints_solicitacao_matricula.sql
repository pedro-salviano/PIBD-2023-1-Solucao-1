ALTER TABLE andifes.solicitacao_matricula 
ADD CONSTRAINT membro_academico_identidade FOREIGN KEY (identidade) REFERENCES membro_academico (identidade);

ALTER TABLE andifes.solicitacao_matricula 
ADD CONSTRAINT turma_codigo FOREIGN KEY (codigo) REFERENCES turma (codigo);

ALTER TABLE andifes.solicitacao_matricula 
ADD CONSTRAINT turma_sigla FOREIGN KEY (sigla) REFERENCES turma (sigla);

ALTER TABLE andifes.solicitacao_matricula ADD CONSTRAINT (membro_academico_identidade, turma_codigo, turma_sigla, data_, horario) UNIQUE;
