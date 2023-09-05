-- SCRIP PARA TESTE - PARTE 1
-- Criação das tables necessárias para o teste da vProfData

/*
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

CREATE TABLE IF NOT EXISTS membro_academico_email(
    id SERIAL NOT NULL,
    membro_academico_id INT NOT NULL, -- Foreign key 
    valor varchar(10),
    tipo varchar(15),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS membro_academico_telefone(
    id SERIAL NOT NULL,
    membro_academico_id INT NOT NULL, -- Foreign key 
    ddi varchar(3),
    ddd varchar(3),
    numero varchar(15),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS aluno_professor_isf (
    membro_academico_id INTEGER,
    RA VARCHAR(15) NOT NULL,
    PRIMARY KEY (membro_academico_id)
);
*/

-- Constraints das tabelas criadas

/*
ALTER TABLE aluno_professor_isf
    ADD CONSTRAINT FK_membro_academico FOREIGN KEY (membro_academico_id) REFERENCES membro_academico(id);
    
ALTER TABLE membro_academico_email
    ADD CONSTRAINT FK_membro_academico_id FOREIGN KEY (membro_academico_id) REFERENCES membro_academico (id);
    
ALTER TABLE membro_academico_telefone
    ADD CONSTRAINT FK_membro_academico_id FOREIGN KEY (membro_academico_id) REFERENCES membro_academico (id);
*/
-- Inserções
/*
INSERT INTO membro_academico(identidade, nacionalidade, pais_de_residencia, 
nome_completo, data_nascimento, nome_da_mae, genero) VALUES
(10, 'Brasileiro', 'Brasil', 'Professor ISF 1', '1999-01-01', 'Mãe Professor ISF 1',
'Masculino');

INSERT INTO membro_academico(identidade, nacionalidade, pais_de_residencia, 
nome_completo, data_nascimento, nome_da_mae, genero) VALUES
(11, 'Mexicano', 'Mexico', 'Professor ISF 2', '1980-01-01', 'Mãe Professor ISF 2',
'Masculino');

INSERT INTO membro_academico_telefone(membro_academico_id, ddi, ddd, numero) 
VALUES(1, '55', '16', '997980987');

INSERT INTO membro_academico_telefone(membro_academico_id, ddi, ddd, numero) 
VALUES(2, '52', '67', '997998787');

INSERT INTO membro_academico_email(membro_academico_id, valor, tipo) 
VALUES(1, 'valorBR', 'tipoBR');

INSERT INTO membro_academico_email(membro_academico_id, valor, tipo) 
VALUES(2, 'valorMX', 'tipoMX');

INSERT INTO aluno_professor_isf(membro_academico_id, RA) 
VALUES(1, '769821');

INSERT INTO aluno_professor_isf(membro_academico_id, RA) 
VALUES(2, '760929');

SELECT * FROM membro_academico;

SELECT * FROM membro_academico_telefone;

SELECT * FROM membro_academico_email;

SELECT * FROM aluno_professor_isf;
*/

-- Declaração da View:
/*
Seleciona as informações dos professores IsF (especialização e graduação) que estão no banco até o momento. 
Exibe as informações Nome, Telefone, email, número de horas dadas). A view deve possibilitar edição pelo 
trigger instead of.
*/

CREATE OR REPLACE VIEW vProfData AS
SELECT
    prof_isf.membro_academico_id AS aluno_professor_id,
    ma.nome_completo,
    ma.pais_de_residencia,
    ma.data_nascimento,
    ma_telefone.ddi AS codigo_pais_telefone,
    ma_telefone.ddd AS codigo_area_telefone,
    ma_telefone.numero AS numero_telefone,
    ma_email.tipo AS tipo,
    ma_email.valor AS email
FROM aluno_professor_isf prof_isf
JOIN membro_academico ma ON prof_isf.membro_academico_id = ma.id
LEFT JOIN membro_academico_telefone ma_telefone ON ma.id = ma_telefone.membro_academico_id
LEFT JOIN membro_academico_email ma_email ON ma.id = ma_email.membro_academico_id;

-- SCRIPT PARA TESTE - PARTE 2
-- Teste de chamada da View
/*
SELECT * FROM vProfData;

INSERT INTO membro_academico(identidade, nacionalidade, pais_de_residencia, 
nome_completo, data_nascimento, nome_da_mae, genero) VALUES
(12, 'Argentino', 'Argentina', 'Professor ISF 3', '1999-01-23', 'Mãe Professor ISF 3',
'Feminino');

INSERT INTO membro_academico_telefone(membro_academico_id, ddi, ddd, numero) 
VALUES(3, '70', '16', '989090987');

INSERT INTO membro_academico_email(membro_academico_id, valor, tipo) 
VALUES(3, 'valorAR', 'tipoAR');

INSERT INTO aluno_professor_isf(membro_academico_id, RA) 
VALUES(3, '769034');

SELECT * FROM vProfData;
*/
