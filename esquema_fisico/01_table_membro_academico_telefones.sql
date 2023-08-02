CREATE TABLE IF NOT EXISTS membro_academico_telefones(
    id_telefone INT SERIAL NOT NULL,
    id_membro_academico INT NOT NULL, /* Foreign key */
    identidade INTEGER NOT NULL, /* Foreign key */
    ddi varchar(3),
    ddd varchar(3),
    numero varchar(15),
    PRIMARY KEY (id_telefone)
);