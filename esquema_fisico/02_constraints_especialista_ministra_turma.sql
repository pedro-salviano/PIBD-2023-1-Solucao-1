ALTER TABLE especialista_ministra_turma
ADD CONSTRAINT FK_especialista FOREIGN KEY (membro_academico_id) REFERENCES especialista (membro_academico_id);

ALTER TABLE especialista_ministra_turma
ADD CONSTRAINT FK_Turma FOREIGN KEY (turma_id) REFERENCES turma (id);

AQUII