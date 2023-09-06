--SCRIPT PARA TESTE: PARTE 1

--Criação das tables necessárias para o teste da procEditTelefone
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

CREATE TABLE IF NOT EXISTS aluno_especializacao(
    aluno_professor_isf_id INTEGER NOT NULL, 
    DataIngresso DATE NOT NULL,
    DataConclusao DATE,
    DiplomaFile VARCHAR(200),
    Titulacao VARCHAR(200),
    RegistroMinistrante VARCHAR(200),
    PRIMARY KEY (aluno_professor_isf_id)
);
*/
-- Constraints das tabelas criadas
/*
ALTER TABLE membro_academico_telefone
    ADD CONSTRAINT FK_membro_academico_id FOREIGN KEY (membro_academico_id) REFERENCES membro_academico (id);

ALTER TABLE aluno_professor_isf
    ADD CONSTRAINT FK_membro_academico FOREIGN KEY (membro_academico_id) REFERENCES membro_academico(id);
	
ALTER TABLE aluno_especializacao
        ADD CONSTRAINT FK_aluno_prof_id
            FOREIGN KEY (aluno_professor_isf_id)
            REFERENCES aluno_professor_isf(membro_academico_id); 
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

INSERT INTO aluno_professor_isf(membro_academico_id, RA) 
VALUES(1, '769821');

INSERT INTO aluno_professor_isf(membro_academico_id, RA) 
VALUES(2, '760929');

INSERT INTO aluno_especializacao(aluno_professor_isf_id, DataIngresso, DataConclusao, DiplomaFile, Titulacao, RegistroMinistrante) 
VALUES(1, '1999-01-01', '2000-01-01', 'DiplomaFileBR', 'TitulacaoBR', 'RegistroMinistranteBR');

INSERT INTO aluno_especializacao(aluno_professor_isf_id, DataIngresso, DataConclusao, DiplomaFile, Titulacao, RegistroMinistrante) 
VALUES(2, '1999-01-01', '2000-01-01', 'DiplomaFileMX', 'TitulacaoMX', 'RegistroMinistranteMX');

SELECT * FROM membro_academico;

SELECT * FROM membro_academico_telefone;

SELECT * FROM aluno_professor_isf;

SELECT * FROM aluno_especializacao;
*/
-- Declaração da Procedure:
/* 
    Explicação do que a Procedure faz:
    Esta função permite a inserção, edição ou exclusão de números de telefone
    associados a membros acadêmicos na tabela 'membro_academico_telefone'.

   Parâmetros de entrada:
   membro_id: O ID do membro acadêmico para o qual a ação será realizada.
   ddi: O código DDI do telefone.
   ddd: O código DDD do telefone.
   numero: O número de telefone.
   acao: A ação a ser executada - 'inserir' para adicionar, 'editar' para modificar,
   ou 'excluir' para remover um número de telefone.

   A função verifica a ação solicitada e executa a operação correspondente na tabela.
   Se 'inserir', insere um novo número de telefone.
   Se 'editar', atualiza um número de telefone existente.
   Se 'excluir', remove um número de telefone associado ao membro acadêmico.
   Se a ação não for 'inserir', 'editar' ou 'excluir', uma exceção é lançada.
   
   Neste caso, a "procedure" foi implementada como uma função PL/pgSQL, que é uma maneira 
   comum de realizar tarefas semelhantes no PostgreSQL. Você pode criar a função e usá-la 
   da mesma maneira que uma procedure para realizar as operações desejadas em telefones 
   de membros acadêmicos.

*/

CREATE OR REPLACE FUNCTION procEditTelefone(
    IN membro_id INT,
    IN ddi_param varchar(3),
    IN ddd_param varchar(3),
    IN numero_param varchar(15),
    IN acao varchar(10) -- 'inserir', 'editar', ou 'excluir'
)
RETURNS VOID AS $$
BEGIN
    IF acao = 'inserir' THEN
        -- Inserir um novo telefone
        INSERT INTO membro_academico_telefone(membro_academico_id, ddi, ddd, numero)
        VALUES (membro_id, ddi_param, ddd_param, numero_param);
    ELSIF acao = 'editar' THEN
        -- Editar um telefone existente
        UPDATE membro_academico_telefone
        SET ddi = ddi_param, ddd = ddd_param, numero = numero_param
        WHERE membro_academico_id = membro_id;
    ELSIF acao = 'excluir' THEN
        -- Excluir um telefone
        DELETE FROM membro_academico_telefone
        WHERE membro_academico_id = membro_id;
    ELSE
        -- Ação inválida
        RAISE EXCEPTION 'Ação inválida. Use "inserir", "editar" ou "excluir".';
    END IF;
END;
$$ LANGUAGE plpgsql;


--SCRIPT PARA TESTE - PARTE 2
-- Visualização antes da troca de números de telefone e depois da troca.

/*
SELECT m.id, t.ddi, t.ddd, t.numero
FROM membro_academico AS m
JOIN membro_academico_telefone AS t ON m.id = t.membro_academico_id;

-- Inserção de um novo número de telefone para o membro com ID 2
SELECT procEditTelefone(2, '55', '16', '9988776655', 'inserir');

-- Visualização após a inserção
SELECT m.id, t.ddi, t.ddd, t.numero
FROM membro_academico AS m
JOIN membro_academico_telefone AS t ON m.id = t.membro_academico_id;


-- Edição do número de telefone para o membro com ID 2
SELECT procEditTelefone(2, '55', '16', '9999887766', 'editar');

-- Visualização após a edição
SELECT m.id, t.ddi, t.ddd, t.numero
FROM membro_academico AS m
JOIN membro_academico_telefone AS t ON m.id = t.membro_academico_id;

-- Exclusão do número de telefone do membro com ID 1
SELECT procEditTelefone(1, '', '', '', 'excluir');

-- Visualização após a exclusão
SELECT m.id, t.ddi, t.ddd, t.numero
FROM membro_academico AS m
JOIN membro_academico_telefone AS t ON m.id = t.membro_academico_id;
*/