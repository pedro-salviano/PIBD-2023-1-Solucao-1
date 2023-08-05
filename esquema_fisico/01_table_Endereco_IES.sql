CREATE TABLE IF NOT EXISTS Endereco_IES (
    Endereco_ID SERIAL PRIMARY KEY,
    Pais_Endereco VARCHAR(30),
    Estado_Endereco VARCHAR(30),
    Cidade_Endereco VARCHAR(30),
    Bairro_Endereco VARCHAR(30),
    Rua_Endereco VARCHAR(30),
    Numero_Endereco VARCHAR(10),
    Codigo_Postal_Endereco VARCHAR(30),
    Complemento_Endereco VARCHAR(10)
);
