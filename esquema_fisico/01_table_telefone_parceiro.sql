CREATE TABLE Telefone_Parceiro(
	Id SERIAL PRIMARY KEY,
	DDI varchar(4) NOT NULL,
	DDD varchar(2) NOT NULL,
	Telefone varchar(11) NOT NULL,
	Parceiro_Id INTEGER,
	CONSTRAINT telefone_parceiro_unico UNIQUE (DDI, DDD, Telefone)
);