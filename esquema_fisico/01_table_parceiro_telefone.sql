CREATE TABLE IF NOT EXISTS Parceiro_Telefone(
	Id SERIAL PRIMARY KEY,
	DDI varchar(4) NOT NULL,
	DDD varchar(2) NOT NULL,
	Telefone varchar(11) NOT NULL,
	Parceiro_Id INTEGER
);