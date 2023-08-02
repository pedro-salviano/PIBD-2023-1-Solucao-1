CREATE TABLE IF NOT EXISTS aluno_professor_isf (
    id_aluno_professor_isf INTEGER SERIAL PRIMARY KEY,
    id_membro_academico INTEGER,
    RA VARCHAR(15) NOT NULL COMMENT "RA do aluno"
);