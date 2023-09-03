--Criação da function que pode receber 2 inputs para visualizar os orientados
--É possível filtrar todos os orientados do orientador, basta inserir apenas o nome do orientador
--É possível também verificar quem orienta determinado orientado, basta inserir apenas o nome do orientado
--É possível escrever nos dois inputs, será filtrado pelo mesmo
--Para funcionar necessita apenas da existencia da table orientacao/membro_academico e da view vOrientados

-------------------------Tables necessárias:
--membro_academico
/*
CREATE TABLE IF NOT EXISTS membro_academico(
    id SERIAL NOT NULL,
    identidade INTEGER NOT NULL UNIQUE, 
    nacionalidade varchar(20) NOT NULL,
    pais_de_residencia varchar(19) NOT NULL,
    nome_completo varchar(70) NOT NULL,
    data_nascimento DATE NOT NULL,
    nome_da_mae varchar(70),
    genero varchar(20),
    PRIMARY KEY (id)
);
*/
--orientacao
/*
CREATE TABLE IF NOT EXISTS orientacao (
    id SERIAL PRIMARY KEY,
    membro_academico_id INT, /*chave primária especialista*/
    aluno_professor_isf_id INT, /*chave primária aluno esp */
    data_inicial DATE,
    data_final DATE
);
ALTER TABLE orientacao 
ADD CONSTRAINT FK_especialista FOREIGN KEY (membro_academico_id) REFERENCES membro_academico(identidade);
*/

--View necessária:
--vOrientados:
/*
CREATE OR REPLACE VIEW vOrientados AS
SELECT 
    o.identidade AS orientador_id,
    o.nome_completo AS orientador_nome,
    a.identidade AS orientado_id,
    a.nome_completo AS orientado_nome,
	CASE WHEN oe.data_final IS NULL OR oe.data_final > CURRENT_DATE THEN 'ativo' ELSE 'inativo' END AS status
FROM 
    orientacao oe
LEFT JOIN
    membro_academico o ON oe.membro_academico_id = o.identidade -- Orientadores
LEFT JOIN
    membro_academico a ON oe.aluno_professor_isf_id = a.identidade; -- Orientados
*/
-------------------------------------------------------------------------------------------------------
--Function getOrientados

CREATE OR REPLACE FUNCTION getOrientados(
    orientador_input text,
    orientado_input text
)
RETURNS TABLE (
    orientador_id integer,
    orientador_nome character varying(70), -- mesmo tipo da view
    orientado_id integer,
    orientado_nome character varying(70), -- mesmo tipo da view,
	status text
) AS
$$
BEGIN
    RETURN QUERY
    SELECT * FROM vOrientados --Utiliza a view vOrientados para retornar a table
    WHERE
        (orientador_input IS NULL OR vOrientados.orientador_nome = orientador_input) AND
        (orientado_input IS NULL OR vOrientados.orientado_nome = orientado_input);
END;
$$
LANGUAGE plpgsql;


/*
--Scripts para testar
--Inserindo exemplos de pessoas
INSERT INTO membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
VALUES (123456, 'Brasileira', 'Brasil', 'João da Silva', '1990-01-15', 'Mario da Silva', 'Masculino');

INSERT INTO membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
VALUES (23457, 'Japonesa', 'Brasil', 'Hirokawa da Silva', '1990-01-15', 'Julia Oliveira', 'Masculino');

INSERT INTO membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
VALUES (89798789, 'Brasileira', 'Brasil', 'Filho de Algo', '1990-01-15', 'Oport da Silva', 'Masculino');

INSERT INTO membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
VALUES (1593557, 'Brasileira', 'Brasil', 'Fidalgo Alexandria', '1990-01-15', 'Nista da Silva', 'Masculino');

INSERT INTO membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
VALUES (258369, 'Brasileira', 'Brasil', 'Pingo Pinga', '1990-01-15', 'Lorena da Silva', 'Masculino');

INSERT INTO membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
VALUES (147258, 'Brasileira', 'Brasil', 'Yukihira Akame', '1990-01-15', 'Paloma da Silva', 'Masculino');

INSERT INTO membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
VALUES (785963, 'Brasileira', 'Brasil', 'Trilecas Alexandria', '1990-01-15', 'Iodeto da Silva', 'Masculino');

--Inserindo relações
INSERT INTO orientacao (membro_academico_id, aluno_professor_isf_id, data_inicial)
VALUES (123456, 23457, NOW());

INSERT INTO orientacao (membro_academico_id, aluno_professor_isf_id, data_inicial)
VALUES (89798789, 1593557, NOW());

INSERT INTO orientacao (membro_academico_id, aluno_professor_isf_id, data_inicial)
VALUES (89798789, 258369, NOW());

INSERT INTO orientacao (membro_academico_id, aluno_professor_isf_id, data_inicial)
VALUES (123456, 147258, NOW());

INSERT INTO orientacao (membro_academico_id, aluno_professor_isf_id, data_inicial)
VALUES (123456, 785963, NOW());

--Exemplos da function
SELECT * FROM getOrientados(NULL, NULL); Retorna tudo
SELECT * FROM getOrientados('João da Silva', NULL); Retorna apenas os orientados com aquele orientador
SELECT * FROM getOrientados(NULL, 'Yukihira Akame'); Retorna apenas aquele orientado
*/