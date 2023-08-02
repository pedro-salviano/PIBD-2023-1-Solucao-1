ALTER TABLE andifes.especialista_ministra_turma
ADD CONSTRAINT FK_orientacao_especialista_aluno FOREIGN KEY (orientacao_especialista_aluno_id) REFERENCES orientacao_especialista_aluno (id);

ALTER TABLE andifes.especialista_ministra_turma
ADD CONSTRAINT FK_Turma FOREIGN KEY (turma_id) REFERENCES turma (id);