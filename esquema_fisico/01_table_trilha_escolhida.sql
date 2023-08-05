CREATE TABLE if NOT EXISTS trilha_escolhida(
    id SERIAL,
    trilha_ofertada_id INTEGER NOT NULL,
    codigo VARCHAR(10) NOT NULL,
    PRIMARY KEY (id)
)
