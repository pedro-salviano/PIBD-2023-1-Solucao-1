CREATE TABLE IF NOT EXISTS andifes.idioma_aluno_professor_isf(
    identidade_aluno_professor_isf INTEGER COMMENT "FK para o aluno",
    id_idiomas INTEGER COMMENT "FK para idioma",
    CONSTRAINT PK_idioma_aluno_professor_isf PRIMARY KEY (identidade_aluno_professor_isf, id_idioma)
);