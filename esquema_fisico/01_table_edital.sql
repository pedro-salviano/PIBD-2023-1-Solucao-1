CREATE TABLE IF NOT EXISTS Edital(
	Id SERIAL PRIMARY KEY, 	
	Link TEXT,
	Tipo VARCHAR(50),
	Titulo VARCHAR(50),
	Data_Inicial DATE,
	Data_Final DATE,
);