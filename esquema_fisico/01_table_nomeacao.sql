CREATE TABLE IF NOT EXISTS nomeacao (
    data_nomeacao date,
    reitoria_Inicio_Periodo date,
    coordenador_administrativo_identidade int,
    PRIMARY KEY (data_nomeacao, reitoria_Inicio_Periodo)
);
