CREATE TABLE IF NOT EXISTS reitoria (
    id SERIAL NOT NULL,
    IES_Sigla VARCHAR(10),
    Inicio_Periodo DATE,
    Final_Periodo DATE,
    PRIMARY KEY(id)
);
