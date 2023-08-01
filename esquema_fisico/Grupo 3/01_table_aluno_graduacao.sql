CREATE TABLE IF NOT EXISTS andifes.aluno_graduacao (
    COMMENT "A PK do aluno de graduação vem do professor ISF, que consequentemente é um membro academico",

    identidade_aluno_graduacao INTEGER CONSTRAINT PK_id_aluno_graduacao PRIMARY KEY,

    FOREIGN KEY (identidade_aluno_graduacao) REFERENCES aluno_professor_isf(identidade_aluno_professor_isf),

    Poca_File text NOT NULL,
    Edital_Selecao_File text NOT NULL,
    Resultado_Selecao_File text NOT NULL,
    Termo_Turma_Compromisso_File text NOT NULL,
    Vinculo_File text NOT NULL COMMENT
        "Todos esses dados File eu coloquei como text porque pensei em um referencia para um Link que possui os arquivos",
    
);