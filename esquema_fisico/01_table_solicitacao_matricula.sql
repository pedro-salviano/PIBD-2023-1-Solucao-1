CREATE TABLE IF NOT EXISTS solicitacao_matricula(
    id SERIAL PRIMARY KEY,
    membro_academico_id INTEGER not null, 
    turma_id INT not null,
    data_ date not null,
    horario TIME not null,
    estado INTEGER not null
);