CREATE TABLE IF NOT EXISTS aluno_especializacao(
    id SERIAL NOT NULL,
    aluno_professor_isf_id INTEGER NOT NULL, 
    DataIngresso DATE NOT NULL,
    DataConclusao DATE,
    DiplomaFile VARCHAR(200),
    Titulacao VARCHAR(200),
    RegistroMinistrante VARCHAR(200),
    PRIMARY KEY (aluno_professor_isf_id)
)
