CREATE TABLE IF NOT EXISTS turma_especializacao( 
	id SERIAL NOT NULL,
	Data_Fim DATE,
	Data_Inicio DATE NOT NULL,
	trilha_escolhida_id INT,
	PRIMARY KEY(id)
);