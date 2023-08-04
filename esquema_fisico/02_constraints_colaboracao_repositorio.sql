ALTER TABLE andifes.colaboracao_repositorio
    ADD CONSTRAINT FK_orientado_id 
        FOREIGN KEY(orientado_id)
        REFERENCES aluno_especializacao(id);

ALTER TABLE andifes.colaboracao_repositorio
    ADD CONSTRAINT FK_especialista_id 
        FOREIGN KEY(especialista_id)
        REFERENCES especialista(id);

ALTER TABLE andifes.colaboracao_repositorio
    ADD CONSTRAINT FK_codigo_rep 
  		FOREIGN KEY(codigo_rep)
  			REFERENCES repositorio(codigo_rep);
