ALTER TABLE colaboracao_repositorio
    ADD CONSTRAINT FK_orientado_id 
        FOREIGN KEY(orientado_id)
        REFERENCES aluno_especializacao(id);

ALTER TABLE colaboracao_repositorio
    ADD CONSTRAINT FK_especialista_id 
        FOREIGN KEY(especialista_id)
        REFERENCES especialista(membro_academico_id);

ALTER TABLE colaboracao_repositorio
    ADD CONSTRAINT FK_codigo_rep 
  		FOREIGN KEY(codigo_rep)
  			REFERENCES repositorio(codigo_rep);
