CREATE TABLE IF NOT EXISTS turma_especializacao( 
	id SERIAL NOT NULL,
	Data_Fim DATE,
	Data_Inicio DATE NOT NULL,
	trilha_escolhida_id INT,
	Dia_Semana int NOT NULL,
	Horario TEXT NOT NULL,
	PRIMARY KEY(id)
);
