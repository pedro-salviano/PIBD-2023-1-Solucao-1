ALTER TABLE orientacao
ADD CONSTRAINT FK_especialista FOREIGN KEY (membro_academico_id) REFERENCES especialista(membro_academico_id);

ALTER TABLE orientacao
ADD CONSTRAINT FK_aluno_professor_isf FOREIGN KEY (aluno_professor_isf_id) REFERENCES aluno_professor_isf(membro_academico_id);