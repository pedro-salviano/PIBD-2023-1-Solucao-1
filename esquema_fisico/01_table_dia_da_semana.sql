CREATE TABLE if NOT EXISTS dia_da_semana(
    id SERIAL NOT NULL,
    idioma VARCHAR(20) UNIQUE NOT NULL,
    codigo varchar(10),
    dia dia_da_semana_enum NOT NULL,
    PRIMARY KEY(id)
)
