/*teste

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

ALTER TABLE aluno_professor_isf
    ADD CONSTRAINT FK_membro_academico FOREIGN KEY (membro_academico_id) REFERENCES membro_academico(id);
    
ALTER TABLE membro_academico_email
    ADD CONSTRAINT FK_membro_academico_id FOREIGN KEY (membro_academico_id) REFERENCES membro_academico (id);
    
ALTER TABLE membro_academico_telefone
    ADD CONSTRAINT FK_membro_academico_id FOREIGN KEY (membro_academico_id) REFERENCES membro_academico (id);

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


*/

CREATE OR REPLACE FUNCTION getProfData(professor_id INT)
RETURNS TABLE (
    aluno_professor_id INTEGER,
    nome_completo VARCHAR(70),
    pais_de_residencia VARCHAR(20),
    data_nascimento DATE,
    codigo_pais_telefone VARCHAR(3),
    codigo_area_telefone VARCHAR(3),
    numero_telefone VARCHAR(20),
    tipo VARCHAR(20),
    email VARCHAR(70)
)
AS $func$
BEGIN
    RETURN QUERY(
        SELECT
            v.aluno_professor_id,
            v.nome_completo,
            v.pais_de_residencia,
            v.data_nascimento,
            v.codigo_pais_telefone,
            v.codigo_area_telefone,
            v.numero_telefone,
            v.tipo,
            v.email
        FROM 
            vProfData v
        WHERE
            v.aluno_professor_id = professor_id
 );
EXCEPTION
    WHEN others THEN
        RAISE EXCEPTION 'Erro ao obter as informações';
END;
$func$
LANGUAGE plpgsql;
