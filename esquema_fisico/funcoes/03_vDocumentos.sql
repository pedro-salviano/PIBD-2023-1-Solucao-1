/* SCRIP PARA TESTE - PARTE 1
CREATE TABLE IF NOT EXISTS membro_academico(
    id SERIAL NOT NULL,
    identidade VARCHAR(20) NOT NULL, 
    nacionalidade varchar(20) NOT NULL,
    pais_de_residencia varchar(19) NOT NULL,
    nome_completo varchar(70) NOT NULL,
    data_nascimento DATE NOT NULL,
    nome_da_mae varchar(70),
    genero varchar(20),
    PRIMARY KEY (id)
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

CREATE TABLE IF NOT EXISTS aluno_professor_isf (
    membro_academico_id INTEGER,
    RA VARCHAR(15) NOT NULL,
    PRIMARY KEY (membro_academico_id)
);




CREATE TABLE IF NOT EXISTS aluno_especializacao(
    aluno_professor_isf_id INTEGER NOT NULL, 
    DataIngresso DATE NOT NULL,
    DataConclusao DATE,
    DiplomaFile VARCHAR(200),
    Titulacao VARCHAR(200),
    RegistroMinistrante VARCHAR(200),
    PRIMARY KEY (aluno_professor_isf_id)
);

-- Constraints das tabelas criadas
ALTER TABLE especialista
    ADD CONSTRAINT FK_membro_academico_id
        FOREIGN KEY (membro_academico_id)
        REFERENCES membro_academico(Id);

ALTER TABLE aluno_especializacao
        ADD CONSTRAINT FK_aluno_prof_id
            FOREIGN KEY (aluno_professor_isf_id)
            REFERENCES aluno_professor_isf(membro_academico_id); 

ALTER TABLE aluno_professor_isf
    ADD CONSTRAINT FK_membro_academico FOREIGN KEY (membro_academico_id) REFERENCES membro_academico(id);
*/

-- Declaração da View:

/*
	Seleciona os documentos que cada individuo possui (Titulação, Tempo de atuação,Nivel de proeficiencia, Diploma, Comprovação profissional, 
	Comprovação de vinculo), mostrando a qualificação para exercer a vaga. 
*/

-- Declaração da View
/*
cria a view vDocumentos ou a substitui se ela já existir.
*/

CREATE OR REPLACE VIEW vDocumentos AS
SELECT 
    e.membro_academico_id AS Id_Individuo,
    e.Titulacao AS Titulacao,
    e.DisponibilidadeAutor AS DisponibilidadeAutor,
    e.DeclaracaoProficiencia AS DeclaracaoProficiencia,
    ae.DiplomaFile AS Diploma,
    ae.RegistroMinistrante AS RegistroMinistrante,
    e.VinculoFile AS VinculoFile
FROM
    membro_academico ma
LEFT JOIN
    especialista e ON ma.id = e.membro_academico_id --Pega a tabela especialista mediante o id membro_academico
LEFT JOIN
	aluno_professor_isf apISF ON ma.id = apISF.membro_academico_id --Para chegar em Aluno_Especialização necessário intermédio dessa tabela
LEFT JOIN
	aluno_especializacao ae ON apISF.membro_academico_id = ae.aluno_professor_isf_id; --Chegamos na tabela ae


/*
--SCRIPT PARA TESTE - PARTE 2
-- Teste de chamada da View

SELECT * FROM vDocumentos;

INSERT INTO membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
VALUES ('123456789', 'Brasileiro', 'Brasil', 'Johny Cage', '1990-01-15', 'Mary Doe', 'Male');

SELECT * FROM membro_academico;

INSERT INTO especialista (
    membro_academico_id, 
    Biodata, 
    DispoMinistrar, 
    Titulacao, 
    Lingua, 
    DeclaracaoProficiencia, 
    DispoOriEsp, 
    VinculoFile, 
    Curriculo, 
    DataCredenciamento, 
    DisponibilidadeAutor, 
    Papeis, 
    ResetNeed, 
    DiplomaFile, 
    LinkCnpq, 
    PocaFile, 
    RegistroAutoria, 
    RegistroMinistrante
)
VALUES (
    (SELECT MAX(id) from membro_academico WHERE nome_completo = 'Johny Cage'), 
    'Some biodata information goes here', 
    true, 
    'PhD in Computer Science', 
    'English', 
    'Proficient', 
    true, 
    'path_to_vinculo_file.pdf', 
    'path_to_curriculo.pdf', 
    '2023-09-07', 
    'Available for authorship', 
    'Reviewer, Author', 
    false, 
    'path_to_diploma_file.pdf', 
    'https://www.example.com/cnpq', 
    'path_to_poca_file.pdf', 
    'Author123', 
    'Ministrante456'
);



SELECT * FROM especialista;

INSERT INTO aluno_professor_isf (membro_academico_id, RA)
VALUES ((SELECT MAX(id) from membro_academico WHERE nome_completo = 'Johny Cage'), '12345');

INSERT INTO aluno_especializacao (
    aluno_professor_isf_id, 
    DataIngresso, 
    DataConclusao, 
    DiplomaFile, 
    Titulacao, 
    RegistroMinistrante
)
VALUES (
    (SELECT MAX(id) from membro_academico WHERE nome_completo = 'Johny Cage'), 
    '2022-01-15', 
    '2023-12-31', 
    'path_to_diploma.pdf', 
    'Master of Arts in Linguistics', 
    'Ministrante123'
);

SELECT * FROM vDocumentos;
*/
