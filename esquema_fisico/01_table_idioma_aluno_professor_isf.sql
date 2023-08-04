
CREATE TABLE IF NOT EXISTS idioma_aluno_professor_isf(
	id INT SERIAL PRIMARY KEY,
  	aluno_professor_isf_id INT NOT NULL,
   	idioma VARCHAR(20) UNIQUE,
	decl_proficiencia TEXT
);