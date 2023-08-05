CREATE TABLE IF NOT EXISTS Criacao_Edital_Local(
	id SERIAL PRIMARY KEY, 
	edital_Id INT,
	membro_academico_id INT /*chave estrangeira que representa membro institucional*/
);