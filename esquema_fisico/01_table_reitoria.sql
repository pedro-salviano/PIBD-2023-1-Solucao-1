CREATE TABLE IF NOT EXISTS reitoria (
    id SERIAL NOT NULL,
    IES_Sigla VARCHAR(10) PRIMARY KEY,
    Inicio_Periodo DATE PRIMARY KEY,
    Final_Periodo DATE,
    PRIMARY KEY(id)
);
