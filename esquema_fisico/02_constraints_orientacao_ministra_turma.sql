ALTER TABLE Orientacao_ministra_turma 
ADD CONSTRAINT FK_orientacao FOREIGN KEY (orientacao_id) REFERENCES Orientacao_especialista_aluno_esp(id);

ALTER TABLE Orientacao_ministra_turma 
ADD CONSTRAINT FK_turma FOREIGN KEY (turma_id) REFERENCES turma(id);