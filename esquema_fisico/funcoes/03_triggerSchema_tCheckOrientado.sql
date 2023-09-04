--Criação da tabela onde será colocado o log de tentativas 
--de cadastro orientados que já possuem orientador ativo
--Para funcionar necessita da existencia das tables:
-- orientacao/membro_academico/aluno_especializacao/aluno_professor_isf/
-- e da view vOrientados

-------------------------Tables necessárias:
-------------------------------Table membro_academico
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
-------------------------------Table orientacao
/*
CREATE TABLE IF NOT EXISTS orientacao (
    id SERIAL PRIMARY KEY,
    membro_academico_id INT, /*chave primária especialista*/
    aluno_professor_isf_id INT, /*chave primária aluno esp */
    data_inicial DATE,
    data_final DATE
);
ALTER TABLE orientacao 
ADD CONSTRAINT FK_especialista FOREIGN KEY (membro_academico_id) 
REFERENCES membro_academico(identidade);

ALTER TABLE orientacao 
ADD CONSTRAINT FK_aluno_esp FOREIGN KEY (aluno_professor_isf_id) 
REFERENCES aluno_especializacao(aluno_professor_isf_id);
*/
-------------------------------Table aluno_especializacao
/*
CREATE TABLE IF NOT EXISTS aluno_especializacao(
	id SERIAL PRIMARY KEY,
	aluno_professor_isf_id INTEGER NOT NULL UNIQUE, 
    DataIngresso DATE NOT NULL,
    DataConclusao DATE,
    DiplomaFile VARCHAR(200),
    Titulacao VARCHAR(200),
    RegistroMinistrante VARCHAR(200)
);

ALTER TABLE aluno_especializacao
        ADD CONSTRAINT FK_aluno_prof_id
            FOREIGN KEY (aluno_professor_isf_id)
            REFERENCES aluno_professor_isf(membro_academico_id); 
*/

-------------------------------Table aluno_professor_isf
/*
CREATE TABLE IF NOT EXISTS aluno_professor_isf (
	id SERIAL PRIMARY KEY,
    membro_academico_id INTEGER UNIQUE NOT NULL,
    RA VARCHAR(15) NOT NULL
);		
ALTER TABLE aluno_professor_isf
    ADD CONSTRAINT FK_membro_academico 
	FOREIGN KEY (membro_academico_id) 
	REFERENCES membro_academico(id);
*/

-------------------------------vOrientados
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
    aluno_especializacao ae ON oe.aluno_professor_isf_id = ae.aluno_professor_isf_id
LEFT JOIN
    aluno_professor_isf ap ON ae.aluno_professor_isf_id = ap.membro_academico_id
LEFT JOIN
    membro_academico a ON ap.membro_academico_id = a.id; -- Orientados
*/
-------------------------------------------------------------------------------------------------------
--Trigger tCheckOrientado


CREATE TABLE avisos_orientados (
    quando date DEFAULT now(),
    quem varchar(50)
);

--Function que será ativada no trigger
CREATE OR REPLACE FUNCTION insert_avisos_orientados()
RETURNS TRIGGER AS $$
BEGIN
    BEGIN--Verificação se o orientado já possui um orientador ativo
        IF EXISTS (
            SELECT 1
                FROM vOrientados
				LEFT JOIN
					membro_academico a ON NEW.aluno_professor_isf_id = a.id -- Orientados
    				WHERE vOrientados.orientado_id = a.identidade
    				AND vOrientados.status = 'ativo'
        ) THEN
			RAISE EXCEPTION 'Orientado já possui orientador ativo no momento'; 
        END IF;
    END;
    RETURN NEW;
EXCEPTION WHEN others THEN  -- Caso possua, é inserido uma tupla na tabela avisos_orientados
    INSERT INTO avisos_orientados (quando, quem)
	VALUES (now(), NEW.membro_academico_id || ' -> ' || NEW.aluno_professor_isf_id);
	RAISE NOTICE 'Orientado já possui orientador ativo no momento'; 
    RETURN NULL;   -- E interrompido a criação na tabela orientacao
END;
$$ LANGUAGE plpgsql;

--Criação do trigger
CREATE TRIGGER tCheckOrientacao
BEFORE INSERT ON orientacao --Antes de cada inserção na table orientacao será executada a função acima
FOR EACH ROW
EXECUTE FUNCTION insert_avisos_orientados();

/*
--Scripts para testar

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

--Basta tentar inserir as relações novamente, que serão criadas novas tuplas na tabela avisos_orientados

--Verificação da inserção na nova table:
SELECT * FROM avisos_orientados

*/
