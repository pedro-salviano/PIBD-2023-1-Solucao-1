CREATE TABLE IF NOT EXISTS turma_especializacao( 
	id INTEGER CONSTRAINT PK_turma_especializacao PRIMARY KEY,
	Data_Fim DATE,
	Data_Inicio DATE NOT NULL,
	trilha_pertencente_id INT,
	componente_curricular_id INT
);