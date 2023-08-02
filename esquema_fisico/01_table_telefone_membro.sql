CREATE TABLE IF NOT EXISTS telefone_membro (
    membro_identidade int,
    DDI varchar(3),
    DDD varchar(2),
    Telefone varchar(9),
    PRIMARY KEY (membro_identidade)
);
