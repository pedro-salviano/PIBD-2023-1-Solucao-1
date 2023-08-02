CREATE TABLE IF NOT EXISTS andifes.aluno_professor_isf (
    identidade_aluno_professor_isf INTEGER CONSTRAINT PK_identidade_aluno_professor_isf PRIMARY KEY COMMENT 
        "Neste caso aqui, a primary key do aluno_professor_isf faz referencia a uma FK que é a PK do membro academico",
    idiomas_aluno_professor_isf INTEGER COMMENT "FK para a tabela de Idiomas",
    RA VARCHAR(15) NOT NULL COMMENT "RA do aluno"
);