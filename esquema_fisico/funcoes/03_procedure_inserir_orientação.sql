CREATE OR REPLACE PROCEDURE procOrientGrad(chaveOrientador int, chaveAluno int)
LANGUAGE SQL
AS $$
    INSERT INTO orientacao (membro_academico_id, aluno_professor_isf_id, data_inicial)
    VALUES (
        chaveOrientador,
        chaveAluno,
        NOW()
    );
$$;

--SCRIPT PARA TESTE
/*

INSERT INTO membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
VALUES (390, 'brasil', 'brasil', 'c390', '2015-02-03', 'embraer', 'aviao');

INSERT INTO especialista(
    membro_academico_id
)
VALUES ( (SELECT MAX(id) from membro_academico WHERE nome_completo = 'c390'))
;

INSERT INTO membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
VALUES (2, 'brasil', 'brasil', 'astros', '0001-01-01', 'avibras', 'artilharia');

INSERT INTO membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
VALUES (3, 'brasil', 'brasil', 'guara', '0001-01-01', 'avibras', 'blindado');

SELECT * FROM membro_academico;

INSERT INTO aluno_professor_isf VALUES ((SELECT MAX(id) from membro_academico WHERE nome_completo = 'astros'), 'RALEGAL');
INSERT INTO aluno_professor_isf VALUES ((SELECT MAX(id) from membro_academico WHERE nome_completo = 'guara'), 'RALEGAL');

INSERT INTO aluno_especializacao VALUES ((SELECT MAX(id) from membro_academico WHERE nome_completo = 'astros'), '2023-05-06');
INSERT INTO aluno_graduacao VALUES ((SELECT MAX(id) from membro_academico WHERE nome_completo = 'guara'), 'poca_file', 'edital', 'resultado', 'termo', 'vinculo');
SELECT * FROM aluno_professor_isf;
CALL procOrientGrad(4,5);
CALL procOrientGrad(4,7);

*/