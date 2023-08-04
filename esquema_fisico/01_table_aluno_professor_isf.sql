CREATE TABLE IF NOT EXISTS aluno_professor_isf (
    id INTEGER SERIAL PRIMARY KEY,
    membro_academico_id INTEGER,
    RA VARCHAR(15) NOT NULL
);