CREATE TABLE if NOT EXISTS trilha_ofertada(
    id SERIAL,
    componente_curricular_id INTEGER,
    carga_horaria INTEGER,
    idioma VARCHAR(20) NOT NULL,
    link_ementa VARCHAR(200),
    horas_teoricas INTEGER,
    horas_praticas INTEGER,
    PRIMARY KEY (id)
)