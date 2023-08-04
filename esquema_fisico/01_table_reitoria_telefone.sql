CREATE TABLE IF NOT EXISTS reitoria_telefone(
    id INTEGER SERIAL NOT NULL,
    reitoria_id INT NOT NULL, /* Foreign key */
    Numero_telefone VARCHAR(9),
    DDD_telefone VARCHAR(2),
    DDI_telefone VARCHAR(3)
    PRIMARY KEY (id)
);