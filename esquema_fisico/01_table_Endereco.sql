CREATE TABLE IF NO EXISTS andifes.Endereco (
    Endereco_ID SERIAL PRIMARY KEY,
    Pais_Endereco varchar(30),
    Estado_Endereco varchar(30),
    Cidade_Endereco varchar(30),
    Bairro_Endereco varchar(30),
    Rua_Endereco varchar(30),
    Numero_Endereco varchar(10),
    Codigo_Postal_Endereco varchar(30),
    Complemento_Endereco varchar(10)
);