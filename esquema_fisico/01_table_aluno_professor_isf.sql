CREATE TABLE IF NOT EXISTS aluno_professor_isf (
    id serial PRIMARY KEY,
    membro_academico_id INTEGER,
    RA VARCHAR(15) NOT NULL
);