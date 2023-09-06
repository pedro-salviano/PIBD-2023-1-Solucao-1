CREATE TABLE if NOT EXISTS trilha_escolhida(
    id SERIAL,
    trilha_ofertada_id INTEGER NOT NULL,
    componente_curricular_id INTEGER NOT NULL,
    PRIMARY KEY (id)
);