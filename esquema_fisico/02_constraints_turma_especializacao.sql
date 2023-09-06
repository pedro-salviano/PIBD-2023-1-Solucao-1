ALTER TABLE turma_especializacao ADD CONSTRAINT FK_trilha_escolhida 
FOREIGN KEY (trilha_escolhida_id) REFERENCES trilha_escolhida(id);