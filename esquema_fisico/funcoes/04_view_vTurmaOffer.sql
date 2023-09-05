--SCRIP PARA TESTE - PARTE 1
-- Criação das tables necessárias para o teste da vTurmaOffer
/*
CREATE TABLE if NOT EXISTS trilha_ofertada(
    id SERIAL,
    carga_horaria INTEGER,
    idioma VARCHAR(20) NOT NULL,
    link_ementa VARCHAR(200),
    horas_teoricas INTEGER,
    horas_praticas INTEGER,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS componente_curricular (
    id_componente_curricular SERIAL NOT NULL,
    codigo varchar(10),
    carga_horaria integer NOT NULL,
    Eixo_tematico varchar(30),
    Obrigatoriedade bool,
    Tipo_disciplina varchar(30),
    Nome_completo varchar(50),
    PRIMARY KEY(id_componente_curricular)
);

CREATE TABLE if NOT EXISTS trilha_escolhida(
    id SERIAL,
    trilha_ofertada_id INTEGER NOT NULL,
    componente_curricular_id INTEGER NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE IF NOT EXISTS turma_especializacao( 
	id SERIAL NOT NULL,
	Data_Fim DATE,
	Data_Inicio DATE NOT NULL,
	trilha_escolhida_id INT,
	PRIMARY KEY(id)
);

-- Constraints das tabelas criadas
	
ALTER TABLE trilha_escolhida
    ADD CONSTRAINT FK_trilha_ofertada_id
        FOREIGN KEY (trilha_ofertada_id)
        REFERENCES trilha_ofertada(id);

ALTER TABLE trilha_escolhida
    ADD CONSTRAINT FK_componente_curricular_id
        FOREIGN KEY (componente_curricular_id)
        REFERENCES componente_curricular(id_componente_curricular);
        

ALTER TABLE turma_especializacao ADD CONSTRAINT FK_trilha_escolhida 
FOREIGN KEY (trilha_escolhida_id) REFERENCES trilha_escolhida(id);


-- Inserções
INSERT INTO componente_curricular(codigo, carga_horaria, Eixo_tematico, Obrigatoriedade,
										Tipo_disciplina, Nome_completo) 
VALUES('GB_1', 60, 'Gramática', TRUE, 'Geral', 'Gramática Básica 1');

INSERT INTO trilha_ofertada(carga_horaria, idioma, link_ementa,
						   horas_teoricas, horas_praticas)
VALUES (600, 'Inglês', 'bit.ly/123456', '400', '200');

INSERT INTO componente_curricular(codigo, carga_horaria, Eixo_tematico, Obrigatoriedade,
										TIpo_disciplina, Nome_completo) 
VALUES('SPK_2', 60, 'Conversação', TRUE, 'Geral', 'Speaking 2');

INSERT INTO trilha_escolhida(trilha_ofertada_id, componente_curricular_id)
VALUES(1, 1);

INSERT INTO trilha_escolhida(trilha_ofertada_id, componente_curricular_id)
VALUES(1, 2);

INSERT INTO turma_especializacao(Data_Fim, Data_Inicio, trilha_escolhida_id)
VALUES(DATE '2023-12-10', DATE '2023-7-10', 1);

INSERT INTO turma_especializacao(Data_Fim, Data_Inicio, trilha_escolhida_id)
VALUES(DATE '2023-06-10', DATE '2023-02-10', 1);


SELECT * FROM turma_especializacao;

SELECT * FROM trilha_escolhida;

SELECT * FROM trilha_ofertada;

SELECT * FROM componente_curricular;
*/

-- Declaração da View:
/*
	A view vTurmaOffer é uma view que mostra as turmas de especialização que estão sendo ofertadas, nesse caso,
    ela mostra a data de início e fim da turma, o idioma da trilha que a turma pertence e o nome do componente curricular, 
	que seria a materia sendo ofertada. As tabelas utilizadas são: turma_especializacao, trilha_ofertada e componente_curricular, 
	as quais foram alteradas de acordo com os feedbacks da professora Denise.
*/
CREATE OR REPLACE VIEW vTurmaOffer AS
SELECT
    trilha_of.id AS trilha_ofertada_id,
    trilha_of.idioma AS idioma,
    comp_cur.Nome_completo AS nome_completo,
    comp_cur.codigo AS codigo,
    turma_esp.Data_Inicio AS data_inicio,
    turma_esp.Data_Fim AS data_final
FROM
    turma_especializacao turma_esp
INNER JOIN
    trilha_escolhida trilha_esco ON turma_esp.trilha_escolhida_id = trilha_esco.id
INNER JOIN
    trilha_ofertada trilha_of ON trilha_esco.trilha_ofertada_id = trilha_of.id
INNER JOIN
    componente_curricular comp_cur ON trilha_esco.componente_curricular_id = comp_cur.id_componente_curricular;


/*
--SCRIPT PARA TESTE - PARTE 2
-- Teste de chamada da View

SELECT * FROM vTurmaOffer;

INSERT INTO turma_especializacao(Data_Fim, Data_Inicio, trilha_escolhida_id)
VALUES(DATE '2024-06-10', DATE '2024-02-10', 2);

SELECT * FROM vTurmaOffer;
*/
