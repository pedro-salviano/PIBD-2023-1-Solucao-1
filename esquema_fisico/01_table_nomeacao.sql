CREATE TABLE IF NOT EXISTS nomeacao (
	id SERIAL PRIMARY KEY,
    data date,
    reitoria_id integer,
    coordenador_administrativo_id int
);
