--Criação da tabela onde será colocado o log de tentativas 
--de cadastro orientados que já possuem orientador ativo
--Para funcionar necessita apenas da existencia da table orientacao/membro_academico e da view vOrientados

-------------------------Tables necessárias:
-------------------------------membro_academico
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
-------------------------------orientacao
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
    membro_academico a ON oe.aluno_professor_isf_id = a.identidade; -- Orientados
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
            WHERE (vOrientados.orientado_id = NEW.aluno_professor_isf_id) AND (vOrientados.status = 'ativo')
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

--Inserção dos membros academicos
INSERT INTO membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
VALUES (123456, 'Brasileira', 'Brasil', 'João da Silva', '1990-01-15', 'Mario da Silva', 'Masculino');

INSERT INTO membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
VALUES (23457, 'Japonesa', 'Brasil', 'Hirokawa da Silva', '1990-01-15', 'Julia Oliveira', 'Masculino');

INSERT INTO membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
VALUES (89798789, 'Brasileira', 'Brasil', 'Fidalgo Lopes', '1990-01-15', 'Oport da Silva', 'Masculino');

--Inserção dos relacionamentos
CALL procOrientGrad(123456, 23457);
--Deve dar errado pelo orientado já possuir um orientador ativo, acrescentando uma nova linha na tabela avisos
CALL procOrientGrad(89798789, 23457);

Essa procedure acima se não tiver implementada utilize:
INSERT INTO orientacao (membro_academico_id, aluno_professor_isf_id, data_inicial)
VALUES (123456, 23457, NOW());
INSERT INTO orientacao (membro_academico_id, aluno_professor_isf_id, data_inicial)
VALUES (123456, 23457, NOW());



--Verificação da inserção na nova table:
SELECT * FROM avisos_orientados

*/