CREATE TABLE if NOT EXISTS colaboracao_repositorio(
    id SERIAL NOT NULL,
    especialista_id INTEGER NOT NULL,
    orientado_id INTEGER NOT NULL,
    codigo_rep INTEGER NOT NULL, 
    PRIMARY KEY(id)
)
