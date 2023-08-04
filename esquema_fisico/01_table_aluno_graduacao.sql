CREATE TABLE IF NOT EXISTS aluno_graduacao (
    id INTEGER SERIAL PRIMARY KEY,
    professor_isf_id INTEGER,

    Poca_File text NOT NULL,
    Edital_Selecao_File text NOT NULL,
    Resultado_Selecao_File text NOT NULL,
    Termo_Turma_Compromisso_File text NOT NULL,
    Vinculo_File text NOT NULL 
);