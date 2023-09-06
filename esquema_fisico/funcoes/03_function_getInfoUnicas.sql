/*
--Script comentado para ser usado em testes

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

ALTER TABLE aluno_professor_isf
    ADD CONSTRAINT FK_membro_academico FOREIGN KEY (membro_academico_id) REFERENCES membro_academico(id);

ALTER TABLE aluno_especializacao
    ADD CONSTRAINT FK_aluno_prof_id
        FOREIGN KEY (aluno_professor_isf_id)
        REFERENCES aluno_professor_isf(membro_academico_id);

INSERT INTO membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
VALUES
    ('123456789', 'Brasileira', 'Brasil', 'João da Silva', '1990-05-15', 'Maria da Silva', 'Masculino'),
    ('987654321', 'Estrangeira', 'Estados Unidos', 'Alice Johnson', '1985-12-10', 'Sarah Johnson', 'Feminino'),
    ('555555555', 'Brasileira', 'Brasil', 'Pedro Oliveira', '1995-08-25', 'Ana Oliveira', 'Masculino'),
    ('555423555', 'Brasileira', 'Brasil', 'Pedro Adsg', '1995-08-25', 'Ana Oliveira', 'Masculino');

INSERT INTO aluno_professor_isf (membro_academico_id, RA)
VALUES
    (1, 'RA12345'),
    (2, 'RA67890'),
    (3, 'RA98765'),
    (4, 'RA98865');

INSERT INTO aluno_especializacao (aluno_professor_isf_id, DataIngresso, DataConclusao, DiplomaFile, Titulacao, RegistroMinistrante)
VALUES
    (1, '1990-05-15', NULL, 'diploma1', 'titulacao1', 'registro1'),
    (2, '1990-05-15', NULL, 'diploma2', 'titulacao2', 'registro2'),
    (3, '1990-05-15', NULL, 'diploma3', 'titulacao3', 'registro3'),
    (4, '1990-05-15', NULL, 'diploma4', 'titulacao4', 'registro4');


CREATE OR REPLACE VIEW vInfoUnicas AS
SELECT
  ma.id,
  ma.nome_completo,
  ma.nacionalidade,
  ma.identidade,
  ma.nome_da_mae,
  ma.data_nascimento,
  ma.genero,
  ma.pais_de_residencia,
  ae.DataIngresso,
  ae.DataConclusao
FROM
	membro_academico ma
JOIN
	aluno_especializacao ae ON ae.aluno_professor_isf_id = ma.id;
*/

CREATE OR REPLACE FUNCTION getInfoUnicas(user_id INT)
RETURNS TABLE (
  nome_completo VARCHAR(70),
  nacionalidade VARCHAR(20),
  identidade VARCHAR(20),
  nome_da_mae VARCHAR(70),
  data_nascimento DATE,
  genero VARCHAR(20),
  pais_de_residencia VARCHAR(19),
  DataIngresso DATE,
  DataConclusao DATE
)
AS $func$
BEGIN
    RETURN QUERY (
        SELECT
            v.nome_completo,
            v.nacionalidade,
            v.identidade,
            v.nome_da_mae,
            v.data_nascimento,
            v.genero,
            v.pais_de_residencia,
            v.DataIngresso,
            v.DataConclusao
        FROM
          vInfoUnicas v
        JOIN
          	membro_academico ma ON v.id = ma.id
        WHERE
          ma.id = user_id
    );
EXCEPTION
    WHEN others THEN
        RAISE EXCEPTION 'Erro ao obter as informações';
END;
$func$
LANGUAGE plpgsql;
