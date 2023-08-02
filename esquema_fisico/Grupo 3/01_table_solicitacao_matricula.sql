CREATE TABLE IF NOT EXISTS solicitacao_matricula(
    id SERIAL PRIMARY KEY,
    identidade INTEGER not null, 
    codigo VARCHAR (10) not null,
    sigla VARCHAR (10) not null,
    data_ date not null,
    horario TIME not null,
    estado INTEGER not null
);