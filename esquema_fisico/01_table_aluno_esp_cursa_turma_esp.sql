CREATE TABLE IF NOT EXISTS aluno_esp_cursa_turma_esp (
    id SERIAL PRIMARY KEY,
    status_inscricao status_inscricao_enum NOT NULL,
    nota_final DECIMAL
    aluno_professor_isf_id INT,
    turma_especializacao_id INT,
);