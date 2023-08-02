CREATE TABLE IF NOT EXISTS andifes.especialista_ministra_turma (
    id SERIAL PRIMARY KEY,
    horas_praticas INTEGER,
    orientacao_especialista_aluno_id INTEGER,
    turma_id INTEGER
);