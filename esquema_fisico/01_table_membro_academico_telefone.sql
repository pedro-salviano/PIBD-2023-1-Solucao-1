CREATE TABLE IF NOT EXISTS membro_academico_telefone(
    id INT SERIAL NOT NULL,
    membro_academico_id INT NOT NULL, /* Foreign key */
    ddi varchar(3),
    ddd varchar(3),
    numero varchar(15),
    PRIMARY KEY (id)
);