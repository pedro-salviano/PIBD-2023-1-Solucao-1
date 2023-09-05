/* SCRIPT PARA TESTE

-- Criação das tables necessárias para o teste da vGradSemOrientador

CREATE TABLE IF NOT EXISTS aluno_graduacao (
    professor_isf_id INTEGER PRIMARY KEY,

    Poca_File text NOT NULL,
    Edital_Selecao_File text NOT NULL,
    Resultado_Selecao_File text NOT NULL,
    Termo_Turma_Compromisso_File text NOT NULL,
    Vinculo_File text NOT NULL 
);

CREATE TABLE IF NOT EXISTS aluno_professor_isf (
    membro_academico_id INTEGER,
    RA VARCHAR(15) NOT NULL,
    PRIMARY KEY (membro_academico_id)
);

CREATE TABLE IF NOT EXISTS orientacao (
    id SERIAL PRIMARY KEY,
    membro_academico_id INT,
    aluno_professor_isf_id INT,
    data_inicial DATE,
    data_final DATE
);

CREATE TABLE IF NOT EXISTS especialista(
    membro_academico_id INTEGER NOT NULL,
    Biodata VARCHAR(200), 
    DispoMinistrar BOOLEAN, 
    Titulacao VARCHAR(200), 
    Lingua VARCHAR(200), 
    DeclaracaoProficiencia VARCHAR(200), 
    DispoOriEsp BOOLEAN, 
    VinculoFile VARCHAR(200), 
    Curriculo VARCHAR(200), 
    DataCredenciamento DATE, 
    DisponibilidadeAutor VARCHAR(200), 
    Papeis VARCHAR(200), 
    ResetNeed BOOLEAN, 
    DiplomaFile VARCHAR(200), 
    LinkCnpq VARCHAR(200), 
    PocaFile VARCHAR(200), 
    RegistroAutoria VARCHAR(200), 
    RegistroMinistrante VARCHAR(200),
    PRIMARY KEY (membro_academico_id)
);

CREATE TABLE IF NOT EXISTS membro_academico(
    id SERIAL NOT NULL,
    identidade INTEGER NOT NULL, 
    nacionalidade varchar(20) NOT NULL,
    pais_de_residencia varchar(19) NOT NULL,
    nome_completo varchar(70) NOT NULL,
    data_nascimento DATE NOT NULL,
    nome_da_mae varchar(70),
    genero varchar(20),
    PRIMARY KEY (id)
);


ALTER TABLE aluno_graduacao
    ADD CONSTRAINT FK_aluno_professor_isf FOREIGN KEY (professor_isf_id) 
    REFERENCES aluno_professor_isf(membro_academico_id);

ALTER TABLE aluno_professor_isf
    ADD CONSTRAINT FK_membro_academico FOREIGN KEY (membro_academico_id) REFERENCES membro_academico(id);

ALTER TABLE orientacao
    ADD CONSTRAINT FK_especialista FOREIGN KEY (membro_academico_id) REFERENCES especialista(membro_academico_id);

ALTER TABLE orientacao
    ADD CONSTRAINT FK_aluno_professor_isf FOREIGN KEY (aluno_professor_isf_id) REFERENCES aluno_professor_isf(membro_academico_id);


ALTER TABLE especialista
    ADD CONSTRAINT FK_membro_academico_id
        FOREIGN KEY (membro_academico_id)
        REFERENCES membro_academico(Id);


-- Inserir dados na tabela membro_academico
INSERT INTO membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
VALUES
    (123456789, 'Brasileira', 'Brasil', 'João da Silva', '1990-05-15', 'Maria da Silva', 'Masculino'),
    (987654321, 'Estrangeira', 'Estados Unidos', 'Alice Johnson', '1985-12-10', 'Sarah Johnson', 'Feminino'),
    (555555555, 'Brasileira', 'Brasil', 'Pedro Oliveira', '1995-08-25', 'Ana Oliveira', 'Masculino'),
    (555423555, 'Brasileira', 'Brasil', 'Pedro Adsg', '1995-08-25', 'Ana Oliveira', 'Masculino');

-- Inserir dados na tabela aluno_professor_isf
INSERT INTO aluno_professor_isf (membro_academico_id, RA)
VALUES
    (1, 'RA12345'),
    (2, 'RA67890'),
    (3, 'RA98765'),
    (4, 'RA98865');

-- Inserir dados na tabela aluno_graduacao
INSERT INTO aluno_graduacao (professor_isf_id, Poca_File, Edital_Selecao_File, Resultado_Selecao_File, Termo_Turma_Compromisso_File, Vinculo_File)
VALUES
    (1, 'poca1.pdf', 'edital1.pdf', 'resultado1.pdf', 'termo1.pdf', 'vinculo1.pdf'),
    (2, 'poca2.pdf', 'edital2.pdf', 'resultado2.pdf', 'termo2.pdf', 'vinculo2.pdf'),
    (3, 'poca3.pdf', 'edital3.pdf', 'resultado3.pdf', 'termo3.pdf', 'vinculo3.pdf'),
    (4, 'poca3.pdf', 'edital3.pdf', 'resultado3.pdf', 'termo3.pdf', 'vinculo3.pdf');

-- Inserir dados na tabela especialista
INSERT INTO especialista (membro_academico_id, Biodata, DispoMinistrar, Titulacao, Lingua, DeclaracaoProficiencia, DispoOriEsp, VinculoFile, Curriculo, DataCredenciamento, DisponibilidadeAutor, Papeis, ResetNeed, DiplomaFile, LinkCnpq, PocaFile, RegistroAutoria, RegistroMinistrante)
VALUES
    (1, 'Biodata1', true, 'Mestre', 'Inglês', 'Declaracao1', true, 'Vinculo1.pdf', 'Curriculo1.pdf', '2023-01-15', 'Disponibilidade1', 'Papeis1', false, 'Diploma1.pdf', 'CNPQ1', 'Poca1.pdf', 'Registro1', 'RegistroMinistrante1'),
    (2, 'Biodata2', true, 'Doutor', 'Espanhol', 'Declaracao2', true, 'Vinculo2.pdf', 'Curriculo2.pdf', '2023-02-20', 'Disponibilidade2', 'Papeis2', false, 'Diploma2.pdf', 'CNPQ2', 'Poca2.pdf', 'Registro2', 'RegistroMinistrante2'),
    (3, 'Biodata3', true, 'Mestre', 'Francês', 'Declaracao3', true, 'Vinculo3.pdf', 'Curriculo3.pdf', '2023-03-25', 'Disponibilidade3', 'Papeis3', false, 'Diploma3.pdf', 'CNPQ3', 'Poca3.pdf', 'Registro3', 'RegistroMinistrante3'),
    (4, 'Biodata3', true, 'Mestre', 'Francês', 'Declaracao3', true, 'Vinculo3.pdf', 'Curriculo3.pdf', '2023-03-25', 'Disponibilidade3', 'Papeis3', false, 'Diploma3.pdf', 'CNPQ3', 'Poca3.pdf', 'Registro3', 'RegistroMinistrante3');

-- Inserir dados na tabela orientacao
INSERT INTO orientacao (membro_academico_id, aluno_professor_isf_id, data_inicial, data_final)
VALUES
    (1, 1, '2023-01-01', '2023-12-31'),
    (2, 2, '2023-02-01', '2023-11-30'),
    (3, 3, '2023-03-01', '2023-10-31');

*/

CREATE OR REPLACE VIEW vGradSemOrientador AS
SELECT  ag.professor_isf_id,
        ag.Poca_File, 
        ag.Edital_Selecao_File, 
        ag.Resultado_Selecao_File, 
        ag.Termo_Turma_Compromisso_File, 
        ag.Vinculo_File
FROM aluno_graduacao ag
LEFT JOIN orientacao o ON ag.professor_isf_id = o.aluno_professor_isf_id
WHERE o.id IS NULL;
