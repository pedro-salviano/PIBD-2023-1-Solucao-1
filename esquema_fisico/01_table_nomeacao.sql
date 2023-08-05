CREATE TABLE IF NOT EXISTS nomeacao (
	id SERIAL PRIMARY KEY,
    data date,
    reitoria_id integer,
    membro_institucional_id int
);
