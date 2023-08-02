CREATE TABLE IF NOT EXISTS membro_academico_enderecos(
    id_membro_academico_endereco INT SERIAL NOT NULL,
    id_membro_academico INT NOT NULL, /* Foreign key */
    identidade INTEGER NOT NULL, /* Foreign key */
    complemento varchar(10),
    codigo_postal varchar(10),
    pais varchar(19),
    estado varchar(25),
    cidade varchar(25),
    bairro varchar(40),
    rua varchar(40),
    numero INTEGER,
    PRIMARY KEY (id_membro_academico_endereco)
);