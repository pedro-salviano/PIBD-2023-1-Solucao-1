CREATE TABLE IF NOT EXISTS nomeacao (
    data_nomeacao date,
    FK_reitoria_Inicio_Periodo date,
    FK_coordenador_administrativo_identidade int,
    PRIMARY KEY (data_nomeacao)
);