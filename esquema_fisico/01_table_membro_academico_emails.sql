CREATE TABLE IF NOT EXISTS membro_academico_emails(
    id_membro_academico_email INT SERIAL NOT NULL,
    id_membro_academico INT NOT NULL, /* Foreign key */
    identidade INTEGER NOT NULL, /* Foreign key */
    valor varchar(10),
    tipo varchar(15),
    PRIMARY KEY (id_membro_academico_email)
);