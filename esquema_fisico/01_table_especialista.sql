CREATE TABLE IF NOT EXISTS especialista(
    membro_academico_id INTEGER NOT NULL,
    Biodata VARCHAR(200), 
    DispoMinistrar BOOLEAN, 
    LinkCnpq VARCHAR(200), 
    PocaFile VARCHAR(200), 
    RegistroAutoria VARCHAR(200), 
    RegistroMinistrante VARCHAR(200),
    PRIMARY KEY (membro_academico_id)
);
