CREATE TABLE IF NOT EXISTS andifes.reitoria (
    IES_Sigla varchar(10) PRIMARY KEY,
    Inicio_Periodo date PRIMARY KEY,
    Final_Periodo date,
    Email varchar(30),
    Numero_telefone varchar(9),
    DDD_telefone varchar(2),
    DDI_telefone varchar(3)
);