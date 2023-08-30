CREATE TABLE if NOT EXISTS colaboracao_repositorio(
    id SERIAL NOT NULL,
    orientacao_id INTEGER NOT NULL,
    codigo_rep INTEGER NOT NULL, 
    PRIMARY KEY(id)
)
