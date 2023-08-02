CREATE TABLE IF NOT EXISTS Criacao_Edital(
	Id SERIAL PRIMARY KEY,
	Link_Edital VARCHAR(300), 
	Data_Criacao TIMESTAMP,
	Gestor_Andifes_Isf_Id INTEGER
);