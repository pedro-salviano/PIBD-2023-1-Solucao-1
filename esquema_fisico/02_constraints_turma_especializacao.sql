ALTER TABLE turma_especializacao ADD CONSTRAINT FK_trilha_escolhida FOREIGN KEY (turma_especializacao_id) REFERENCES trilha_ofertada(id);
