
--Tabelas necessárias

/*CREATE TABLE IF NOT EXISTS membro_academico(
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

CREATE TABLE if NOT EXISTS colaboracao_repositorio(
    id SERIAL NOT NULL,
    orientacao_id INTEGER NOT NULL,
    codigo_rep INTEGER NOT NULL, 
    PRIMARY KEY(id)
);

CREATE TABLE if NOT EXISTS  repositorio(
    codigo_rep INTEGER UNIQUE NOT NULL,
    link_ementa VARCHAR(200),
    data_fim DATE, 
  	referencia VARCHAR(200),
  	nome_completo VARCHAR(200),
   PRIMARY Key(codigo_rep)
);

CREATE TABLE IF NOT EXISTS orientacao (
    id SERIAL PRIMARY KEY,
    membro_academico_id INT, /*chave primária especialista*/
    aluno_professor_isf_id INT, /*chave primária aluno esp */
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

--CONSTRAINTS

ALTER TABLE orientacao
ADD CONSTRAINT FK_especialista FOREIGN KEY (membro_academico_id) REFERENCES especialista(membro_academico_id);

ALTER TABLE orientacao
ADD CONSTRAINT FK_aluno_professor_isf FOREIGN KEY (aluno_professor_isf_id) REFERENCES aluno_professor_isf(membro_academico_id);


ALTER TABLE colaboracao_repositorio
    ADD CONSTRAINT FK_orientado_id 
        FOREIGN KEY(orientacao_id)
        REFERENCES orientacao(id);

ALTER TABLE colaboracao_repositorio
    ADD CONSTRAINT FK_codigo_rep 
  		FOREIGN KEY(codigo_rep)
  			REFERENCES repositorio(codigo_rep);
			
ALTER TABLE especialista
    ADD CONSTRAINT FK_membro_academico_id
        FOREIGN KEY (membro_academico_id)
        REFERENCES membro_academico(Id);

ALTER TABLE aluno_professor_isf
    ADD CONSTRAINT FK_membro_academico FOREIGN KEY (membro_academico_id) REFERENCES membro_academico(id);

--Area de selects

SELECT * FROM membro_academico
SELECT * FROM colaboracao_repositorio
SELECT * FROM repositorio
SELECT * FROM orientacao
SELECT * FROM aluno_professor_isf
SELECT * FROM especialista


*/


CREATE OR REPLACE FUNCTION ConsultarMateriais(
    orientador Integer,
    orientado Integer
) RETURNS TABLE (
    codigo_rep INTEGER,
    link_ementa VARCHAR(200),
    data_fim DATE, 
  	referencia VARCHAR(200),
  	nome_completo VARCHAR(200)
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        r.codigo_rep,
    	r.link_ementa,
    	r.data_fim, 
  		r.referencia,
  		r.nome_completo
    FROM
        orientacao o
	LEFT JOIN
		colaboracao_repositorio colabrep ON o.id = colabrep.orientacao_id
	LEFT JOIN
		repositorio r ON colabrep.codigo_rep = r.codigo_rep
	WHERE 
		o.membro_academico_id = orientador AND o.aluno_professor_isf_id = orientado;
    
END;
$$ LANGUAGE plpgsql;

/*
--Teste SQL
INSERT INTO membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
VALUES ('1597', 'Brasileiro', 'Brasil', 'Sonea Bleide', '1990-01-15', 'Mary Doe', 'Male');

INSERT INTO membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
VALUES ('1597', 'Brasileiro', 'Brasil', 'Jex Briguis', '1990-01-15', 'Mary Doe', 'Male');

INSERT INTO aluno_professor_isf (membro_academico_id, RA)
VALUES ((SELECT MAX(id) from membro_academico WHERE nome_completo = 'Sonea Bleide'), '12345');

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
    (SELECT MAX(id) from membro_academico WHERE nome_completo = 'Jex Briguis'), 
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

INSERT INTO orientacao (membro_academico_id, aluno_professor_isf_id, data_inicial)
VALUES ((SELECT MAX(id) from membro_academico WHERE nome_completo = 'Jex Briguis'), 
		(SELECT MAX(id) from membro_academico WHERE nome_completo = 'Sonea Bleide'), NOW());

SELECT * FROM orientacao

INSERT INTO repositorio (
    codigo_rep,
    link_ementa,
    data_fim,
    referencia,
    nome_completo
)
VALUES (
    1, 
    'https://example.com/link_to_ementa',
    '2023-12-31', 
    'Some reference', 
    'Full Name'
);

INSERT INTO colaboracao_repositorio(orientacao_id, codigo_rep)
VALUES (1, 1)

SELECT * FROM ConsultarMateriais('2','1')
*/
