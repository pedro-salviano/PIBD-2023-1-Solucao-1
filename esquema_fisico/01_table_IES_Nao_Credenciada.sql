CREATE TABLE IES_Nao_Credenciada (
    Sigla VARCHAR(10) REFERENCES IES(Sigla),
    Codigo_Cred INTEGER,
    PRIMARY KEY (Sigla, Codigo_Cred)
);
