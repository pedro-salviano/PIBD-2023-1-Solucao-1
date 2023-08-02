CREATE TABLE IF NOT EXISTS Aprovacao_Parceiro(
	Id SERIAL PRIMARY KEY,
	Parceiro_Id INTEGER,
	Gestor_Andifes_Isf_Id INTEGER,
	Data_Inicial DATE,
	Data_Final DATE
);
