-- Tables e inserções para testes

/*CREATE TABLE IF NOT EXISTS aluno_professor_isf (
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
)

ALTER TABLE aluno_especializacao
        ADD CONSTRAINT FK_aluno_prof_id
            FOREIGN KEY (aluno_professor_isf_id)
            REFERENCES aluno_professor_isf(membro_academico_id);
			
INSERT INTO membro_academico(identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
VALUES(123456, 'Brasileiro', 'Brasil', 'Pietro Moralles', '1999-09-08', 'Maria', 'Masculino');

INSERT INTO aluno_professor_isf(membro_academico_id, RA)
VALUES(1, '792238');

INSERT INTO aluno_especializacao(aluno_professor_isf_id, DataIngresso, DataConclusao, DiplomaFile, Titulacao, RegistroMinistrante)
VALUES(1, '2023-01-01', '2022-12-31', 'bit.ly/123', 'Mestre', 'XXXXXX')*/



/* 
    Explicação do que a Procedure faz:
    Recebe dois parametros, o id do aluno_professor_isf e o novo gênero que será atualizado. A partir da table aluno_especialização, a procedure
    localiza a linha que possui o id do aluno_professor_isf e atualiza o gênero do membro acadêmico que está na tabela membro_academico.
    Para utilizar a procedure, basta usar: CALL procEditGenero(aluno_professor_isf_id_param, novo_genero_param)
*/

CREATE OR REPLACE PROCEDURE procEditGenero(
	aluno_professor_isf_id_param INTEGER,
	novo_genero_param VARCHAR(20)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE membro_academico AS m
    SET genero = novo_genero_param
    FROM aluno_especializacao AS ae
    WHERE ae.aluno_professor_isf_id = m.id
	AND m.id = aluno_professor_isf_id_param;
    
    RAISE NOTICE 'Atualização de gênero concluída.';
EXCEPTION
    WHEN others THEN
        RAISE EXCEPTION 'Erro ao atualizar gênero: %', SQLERRM;
END;
$$;