CREATE TABLE IF NOT EXISTS andifes.reitoria (
    IES_Sigla VARCHAR(10) PRIMARY KEY,
    Inicio_Periodo DATE PRIMARY KEY,
    Final_Periodo DATE,
    Email VARCHAR(30),
    Numero_telefone VARCHAR(9),
    DDD_telefone VARCHAR(2),
    DDI_telefone VARCHAR(3)
);