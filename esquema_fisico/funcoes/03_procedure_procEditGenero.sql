/*SCRIPT PARA TESTE: PARTE 1

--Criação das tables necessárias para o teste da procEditaGenero

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

ALTER TABLE aluno_professor_isf
    ADD CONSTRAINT FK_membro_academico FOREIGN KEY (membro_academico_id) REFERENCES membro_academico(id);
	
ALTER TABLE aluno_especializacao
        ADD CONSTRAINT FK_aluno_prof_id
            FOREIGN KEY (aluno_professor_isf_id)
            REFERENCES aluno_professor_isf(membro_academico_id); 
			
-- Inserções
INSERT INTO membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
VALUES (390, 'brasil', 'brasil', 'c390', '2015-02-03', 'embraer', 'aviao');

INSERT INTO membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
VALUES (2, 'brasil', 'brasil', 'astros', '0001-01-01', 'avibras', 'artilharia');

INSERT INTO membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
VALUES (3, 'brasil', 'brasil', 'guara', '0001-01-01', 'avibras', 'blindado');


INSERT INTO aluno_professor_isf VALUES ((SELECT MAX(id) from membro_academico WHERE nome_completo = 'astros'), 'RALEGAL');
INSERT INTO aluno_professor_isf VALUES ((SELECT MAX(id) from membro_academico WHERE nome_completo = 'guara'), 'RALEGAL');

INSERT INTO aluno_especializacao VALUES ((SELECT MAX(id) from membro_academico WHERE nome_completo = 'astros'), '2023-05-06');
INSERT INTO aluno_especializacao VALUES ((SELECT MAX(id) from membro_academico WHERE nome_completo = 'guara'), '2023-10-10');
*/

-- Declaração da Procedure:
/* 
    Explicação do que a Procedure faz:
    Recebe dois parametros, o id do aluno_professor_isf e o novo gênero que será atualizado. A partir da table aluno_especialização, a procedure
    localiza a linha que possui o id do aluno_professor_isf e atualiza o gênero do membro acadêmico que está na tabela membro_academico.
    Para utilizar a procedure, basta usar: CALL procEditGenero(aluno_professor_isf_id_param, novo_genero_param)
*/
CREATE OR REPLACE PROCEDURE procEditGenero3(
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

/* SCRIPT PARA TESTE - PARTE 2
-- Visualização antes da troca de genero e depois da troca.
SELECT membro.id, membro.genero, membro.nome_completo FROM membro_academico AS membro
JOIN aluno_especializacao AS ae ON membro.id = ae.aluno_professor_isf_id;

CALL procEditGenero3(2, 'Troca 1');
CALL procEditGenero3(3, 'Troca 2');

SELECT membro.id, membro.genero, membro.nome_completo FROM membro_academico AS membro
JOIN aluno_especializacao AS ae ON membro.id = ae.aluno_professor_isf_id;

CALL procEditGenero3(2, 'artilharia');
CALL procEditGenero3(3, 'blindado');

SELECT membro.id, membro.genero, membro.nome_completo FROM membro_academico AS membro
JOIN aluno_especializacao AS ae ON membro.id = ae.aluno_professor_isf_id;
*/