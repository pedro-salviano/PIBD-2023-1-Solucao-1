CREATE TABLE IF NOT EXISTS Orientacao_ministra_turma (
    id SERIAL PRIMARY KEY,
    orientacao_id INT, 
    turma_id INT, 
    horas_praticas INT
);