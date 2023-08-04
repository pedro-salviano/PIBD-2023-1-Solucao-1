CREATE TABLE IF NOT EXISTS membro_academico_email(
    id INT SERIAL NOT NULL,
    membro_academico_id INT NOT NULL, /* Foreign key */
    valor varchar(10),
    tipo varchar(15),
    PRIMARY KEY (id)
);