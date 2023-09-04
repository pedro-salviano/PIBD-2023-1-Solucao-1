--Criação da function que pode receber 2 inputs para visualizar os orientados
--É possível filtrar todos os orientados do orientador, basta inserir apenas o nome do orientador
--É possível também verificar quem orienta determinado orientado, basta inserir apenas o nome do orientado
--É possível escrever nos dois inputs, será filtrado pelo mesmo
--Para funcionar necessita apenas da existencia da table orientacao/membro_academico e da view vOrientados

CREATE OR REPLACE FUNCTION get_orientados(
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

--Inserindo exemplos de pessoas
------------Inserção dos membros academicos
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

------------Inserindo Aluno_Professor_ISF
INSERT INTO aluno_professor_isf(membro_academico_id, RA)
VALUES((SELECT MAX(id) from membro_academico WHERE nome_completo = 'Fidalgo Alexandria'), 'algumRA')

INSERT INTO aluno_professor_isf(membro_academico_id, RA)
VALUES((SELECT MAX(id) from membro_academico WHERE nome_completo = 'Hirokawa da Silva'), 'algumRA')

INSERT INTO aluno_professor_isf(membro_academico_id, RA)
VALUES((SELECT MAX(id) from membro_academico WHERE nome_completo = 'Pingo Pinga'), 'algumRA')

------------Inserindo Aluno_especializacao
INSERT INTO aluno_especializacao(aluno_professor_isf_id, DataIngresso)
VALUES((SELECT MAX(id) from membro_academico WHERE nome_completo = 'Fidalgo Alexandria'), NOW())

INSERT INTO aluno_especializacao(aluno_professor_isf_id, DataIngresso)
VALUES((SELECT MAX(id) from membro_academico WHERE nome_completo = 'Hirokawa da Silva'), NOW())

INSERT INTO aluno_especializacao(aluno_professor_isf_id, DataIngresso)
VALUES((SELECT MAX(id) from membro_academico WHERE nome_completo = 'Pingo Pinga'), NOW())

------------ Finalmente inserindo as relações

INSERT INTO orientacao (membro_academico_id, aluno_professor_isf_id, data_inicial)
VALUES (123456, (SELECT MAX(id) from membro_academico WHERE nome_completo = 'Fidalgo Alexandria'), NOW());

INSERT INTO orientacao (membro_academico_id, aluno_professor_isf_id, data_inicial)
VALUES (123456, (SELECT MAX(id) from membro_academico WHERE nome_completo = 'Hirokawa da Silva'), NOW());

INSERT INTO orientacao (membro_academico_id, aluno_professor_isf_id, data_inicial)
VALUES (785963, (SELECT MAX(id) from membro_academico WHERE nome_completo = 'Pingo Pinga'), NOW());

--Exemplos da function
SELECT * FROM get_orientados(NULL, NULL); Retorna tudo
SELECT * FROM get_orientados('João da Silva', NULL); Retorna apenas os orientados com aquele orientador
SELECT * FROM get_orientados(NULL, 'Hirokawa da Silva'); Retorna apenas aquele orientado
*/
