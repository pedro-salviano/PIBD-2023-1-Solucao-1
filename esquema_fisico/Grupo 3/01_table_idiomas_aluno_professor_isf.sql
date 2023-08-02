
CREATE TABLE IF NOT EXISTS idiomas_aluno_profess_isf(
	id_idioma INT SERIAL PRIMARY KEY,
  	id_aluno_professor_isf VARCHAR(20) NOT NULL,
   	idioma VARCHAR(20) UNIQUE,
	decl_proficiencia TEXT
);