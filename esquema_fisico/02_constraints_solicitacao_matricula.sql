ALTER TABLE solicitacao_matricula 
ADD CONSTRAINT membro_academico_id FOREIGN KEY (membro_academico_id) REFERENCES membro_academico (id);

ALTER TABLE solicitacao_matricula 
ADD CONSTRAINT turma_codigo FOREIGN KEY (turma_id) REFERENCES turma (id);

