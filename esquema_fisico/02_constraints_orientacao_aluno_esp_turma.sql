ALTER TABLE Orientacao_especialista_aluno_esp 
ADD CONSTRAINT FK_especialista FOREIGN KEY (membro_academico_id) REFERENCES especialista(membro_academico_id);

ALTER TABLE Orientacao_especialista_aluno_esp 
ADD CONSTRAINT FK_aluno_esp FOREIGN KEY (aluno_professor_isf_id) REFERENCES aluno_especializacao(aluno_professor_isf_id);