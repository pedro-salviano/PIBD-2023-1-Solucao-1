CREATE TABLE diploma (
    id SERIAL PRIMARY KEY
    diploma_File NOT NULL UNIQUE,
    titulacao VARCHAR(100) not NULL,
    registroMinistrante VARCHAR(100)
);
