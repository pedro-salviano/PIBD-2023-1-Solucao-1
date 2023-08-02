CREATE TABLE andifes.membro_academico_enderecos(
    identidade INTEGER not null,
    complemento varchar(10),
    codigo_postal varchar(10),
    pais varchar(19),
    estado varchar(25),
    cidade varchar(25),
    bairro varchar(40),
    rua varchar(40),
    numero INTEGER
);