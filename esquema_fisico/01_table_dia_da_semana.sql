CREATE TABLE if NOT EXISTS andifes.dia_da_semana(
    id SERIAL NOT NULL,
    idioma VARCHAR(20) UNIQUE NOT NULL,
    codigo varchar(10),
    dia_da_semana ENUM NOT NULL,
    PRIMARY KEY(id)
)