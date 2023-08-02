CREATE TABLE IF NOT EXISTS nomeacao (
    data_nomeacao date,
    Inicio_Periodo date,
    coordenador_administrativo_identidade int,
    PRIMARY KEY (data_nomeacao, Inicio_Periodo, coordenador_administrativo_identidade)
);
