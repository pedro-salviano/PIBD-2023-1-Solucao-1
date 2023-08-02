CREATE TABLE IF NOT EXISTS Criacao_Edital(
	Id SERIAL PRIMARY KEY, 
	Data_Criacao DATE,
	Edital_Id INTEGER,
	Gestor_Andifes_Isf_Id INTEGER
);