CREATE TABLE IF NOT EXISTS turma_especializacao( 
	id INTEGER CONSTRAINT PK_turma_especializacao PRIMARY KEY,
	Data_Fim DATE,
	Data_Inicio DATE NOT NULL,
	Horario_de_ocorrencia VARCHAR(30) NOT NULL,
	trilha_escolhida_id INT,
	dia dia_da_semana_enum NOT NULL
);
