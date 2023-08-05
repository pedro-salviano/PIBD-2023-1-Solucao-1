CREATE TABLE IF NOT EXISTS aluno_esp_cursa_turma_esp (
    id SERIAL PRIMARY KEY,
    status_inscricao status_inscricao_enum NOT NULL,
    nota_final DECIMAL,
    PRIMARY KEY (aluno_professor_isf_id)
);