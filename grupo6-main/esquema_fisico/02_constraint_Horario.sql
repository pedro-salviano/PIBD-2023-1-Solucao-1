ALTER TABLE Horario ADD CONSTRAINT fk_turma_especialização FOREIGN KEY (Horario_de_ocorrencia) REFERENCES turma_especializacao(Horario_de_ocorrencia);
