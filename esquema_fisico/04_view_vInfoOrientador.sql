


-- CREATE TABLE IF NOT EXISTS especialista(
--     membro_academico_id INTEGER NOT NULL,
--     Biodata VARCHAR(200), 
--     DispoMinistrar BOOLEAN, 
--     Titulacao VARCHAR(200), 
--     Lingua VARCHAR(200), 
--     DeclaracaoProficiencia VARCHAR(200), 
--     DispoOriEsp BOOLEAN, 
--     VinculoFile VARCHAR(200), 
--     Curriculo VARCHAR(200), 
--     DataCredenciamento DATE, 
--     DisponibilidadeAutor VARCHAR(200), 
--     Papeis VARCHAR(200), 
--     ResetNeed BOOLEAN, 
--     DiplomaFile VARCHAR(200), 
--     LinkCnpq VARCHAR(200), 
--     PocaFile VARCHAR(200), 
--     RegistroAutoria VARCHAR(200), 
--     RegistroMinistrante VARCHAR(200),
--     PRIMARY KEY (membro_academico_id)
-- );


-- CREATE TABLE IF NOT EXISTS orientacao (
--     id SERIAL PRIMARY KEY,
--     membro_academico_id INT, /*chave primária especialista*/
--     aluno_professor_isf_id INT, /*chave primária aluno esp */
--     data_inicial DATE,
--     data_final DATE
-- );

-- CREATE TABLE IF NOT EXISTS aluno_especializacao(
--     aluno_professor_isf_id INTEGER NOT NULL, 
--     DataIngresso DATE NOT NULL,
--     DataConclusao DATE,
--     DiplomaFile VARCHAR(200),
--     Titulacao VARCHAR(200),
--     RegistroMinistrante VARCHAR(200),
--     PRIMARY KEY (aluno_professor_isf_id)
-- );

-- CREATE TABLE IF NOT EXISTS aluno_professor_isf (
--     membro_academico_id INTEGER,
--     RA VARCHAR(15) NOT NULL,
--     PRIMARY KEY (membro_academico_id)
-- );

-- CREATE TABLE IF NOT EXISTS membro_academico(
--     id SERIAL NOT NULL,
--     identidade INTEGER NOT NULL, 
--     nacionalidade varchar(20) NOT NULL,
--     pais_de_residencia varchar(19) NOT NULL,
--     nome_completo varchar(70) NOT NULL,
--     data_nascimento DATE NOT NULL,
--     nome_da_mae varchar(70),
--     genero varchar(20),
--     PRIMARY KEY (id)
-- );

-- CREATE TABLE IF NOT EXISTS membro_academico_telefone(
--     id SERIAL NOT NULL,
--     membro_academico_id INT NOT NULL, /* Foreign key */
--     ddi varchar(3),
--     ddd varchar(3),
--     numero varchar(15),
--     PRIMARY KEY (id)
-- );

-- CREATE TABLE IF NOT EXISTS membro_academico_email(
--     id SERIAL NOT NULL,
--     membro_academico_id INT NOT NULL, /* Foreign key */
--     valor varchar(10),
--     tipo varchar(15),
--     PRIMARY KEY (id)
-- );

-- ALTER TABLE membro_academico_email
--     ADD CONSTRAINT FK_membro_academico_id FOREIGN KEY (membro_academico_id) REFERENCES membro_academico (id);


-- ALTER TABLE membro_academico_telefone
--     ADD CONSTRAINT FK_membro_academico_id FOREIGN KEY (membro_academico_id) REFERENCES membro_academico (id);

-- ALTER TABLE aluno_professor_isf
--     ADD CONSTRAINT FK_membro_academico FOREIGN KEY (membro_academico_id) REFERENCES membro_academico(id);

-- ALTER TABLE orientacao
--     ADD CONSTRAINT FK_especialista FOREIGN KEY (membro_academico_id) REFERENCES especialista(membro_academico_id);

-- ALTER TABLE orientacao
--     ADD CONSTRAINT FK_aluno_professor_isf FOREIGN KEY (aluno_professor_isf_id) REFERENCES aluno_professor_isf(membro_academico_id);

-- ALTER TABLE especialista
--     ADD CONSTRAINT FK_membro_academico_id
--         FOREIGN KEY (membro_academico_id)
--         REFERENCES membro_academico(Id);

-- ALTER TABLE aluno_especializacao
--     ADD CONSTRAINT FK_aluno_prof_id
--         FOREIGN KEY (aluno_professor_isf_id)
--         REFERENCES aluno_professor_isf(membro_academico_id); 





-- INSERT into membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento) 
-- values
-- (1, 'Brasil', 'Brasil', 'Vinicius', DATE '2023-7-10'),
-- (2, 'Brasil', 'Brasil', 'Viniciu', DATE '2023-7-10'),
-- (3, 'Brasil', 'Brasil', 'Vinici', DATE '2023-7-10'),
-- (4, 'Brasil', 'Brasil', 'Vinic', DATE '2023-7-10'),
-- (5, 'Brasil', 'Brasil', 'Vini', DATE '2023-7-10'),
-- (6, 'Brasil', 'Brasil', 'Vin', DATE '2023-7-10');


-- INSERT into membro_academico_telefone (membro_academico_id, ddi, ddd, numero)
-- values 
-- (1, '+55','011', '994161652'),
-- (1, '+55','011', '994161653'),
-- (2, '+55','011', '994161652');


-- INSERT into membro_academico_email(membro_academico_id, valor, tipo) VALUES
-- (1, 'abc', '@gmail.com'),
-- (2, 'bcd', '@gmail.com'),
-- (2, 'cde', '@gmail.com');



-- INSERT INTO aluno_professor_isf(membro_academico_id, RA) values
-- (1, '1'),
-- (2, '2'),
-- (3, '3'),
-- (4, '4'),
-- (5, '5');


-- INSERT INTO especialista(membro_academico_id) values
-- (6);



-- Insert INTO aluno_especializacao (aluno_professor_isf_id, DataIngresso) values
-- (1, DATE '2023-7-9');


-- Insert INTO orientacao(membro_academico_id, aluno_professor_isf_id, data_inicial, data_final) values
-- (6,1, DATE '2023-7-10', NULL),
-- (6,2, DATE '2023-7-10', NULL),
-- (6,3, DATE '2023-7-9', DATE '2023-7-10');


CREATE OR REPLACE VIEW vInfoOrientador AS
SELECT 
    oe.membro_academico_id,
    oe.aluno_professor_isf_id,
    ma.Nome_completo,
    ap.RA,
    oe.data_inicial,
    oe.data_final,
    mt.ddi,
    mt.ddd,
    mt.numero,
    me.valor,
    me.tipo
FROM 
    orientacao oe
LEFT JOIN 
    aluno_professor_isf ap ON oe.aluno_professor_isf_id = ap.membro_academico_id
LEFT JOIN
    membro_academico ma ON oe.aluno_professor_isf_id = ma.id
LEFT JOIN (
    SELECT
        mt1.membro_academico_id,
        mt1.ddi,
        mt1.ddd,
        mt1.numero,
        ROW_NUMBER() OVER (PARTITION BY mt1.membro_academico_id ORDER BY mt1.id) AS row_num
    FROM
        membro_academico_telefone mt1
) mt ON ma.id = mt.membro_academico_id AND mt.row_num = 1
LEFT JOIN (
    SELECT
        me1.membro_academico_id,
        me1.valor,
        me1.tipo,
        ROW_NUMBER() OVER (PARTITION BY me1.membro_academico_id ORDER BY me1.id) AS row_num
    FROM
        membro_academico_email me1
) me ON ma.id = me.membro_academico_id AND me.row_num = 1
WHERE   
    oe.data_final IS NULL;

-- Select * from vInfoOrientador
