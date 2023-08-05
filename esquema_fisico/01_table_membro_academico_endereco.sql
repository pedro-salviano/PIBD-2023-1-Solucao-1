CREATE TABLE IF NOT EXISTS membro_academico_endereco(
    id SERIAL NOT NULL,
    membro_academico_id INT NOT NULL, /* Foreign key */
    complemento varchar(10),
    codigo_postal varchar(10),
    pais varchar(19),
    estado varchar(25),
    cidade varchar(25),
    bairro varchar(40),
    rua varchar(40),
    numero INTEGER,
    PRIMARY KEY (id)
);
