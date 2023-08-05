CREATE TABLE IF NOT EXISTS Orientacao_especialista_aluno_esp (
    id SERIAL PRIMARY KEY,
    membro_academico_id INT,
    aluno_professor_isf_id INT,
    data_inicial DATE,
    data_final DATE
);