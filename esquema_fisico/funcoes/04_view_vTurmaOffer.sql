/* SCRIP PARA TESTE - PARTE 1
-- Criação das tables necessárias para o teste da vTurmaOffer

CREATE TABLE if NOT EXISTS trilha_ofertada(
    id SERIAL,
    componente_curricular_id INTEGER,
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

DROP TABLE turma_especializacao;

CREATE TABLE IF NOT EXISTS turma_especializacao( 
	id SERIAL NOT NULL,
	Data_Fim DATE,
	Data_Inicio DATE NOT NULL,
	trilha_pertencente_id INT,
	componente_curricular_id INT,
	PRIMARY KEY(id)
);

-- Constraints das tabelas criadas
ALTER TABLE trilha_ofertada ADD CONSTRAINT FK_componente_curricular_id FOREIGN KEY (componente_curricular_id )
REFERENCES componente_curricular(id_componente_curricular);
	
ALTER TABLE turma_especializacao ADD CONSTRAINT FK_trilha_pertencente_id FOREIGN KEY (trilha_pertencente_id) 
REFERENCES trilha_ofertada(id);

ALTER TABLE turma_especializacao ADD CONSTRAINT FK_componente_curricular_id FOREIGN KEY (componente_curricular_id) 
REFERENCES componente_curricular(id_componente_curricular);

-- Inserções
INSERT INTO componente_curricular(codigo, carga_horaria, Eixo_tematico, Obrigatoriedade,
										TIpo_disciplina, Nome_completo) 
VALUES('GB_1', 60, 'Gramática', TRUE, 'Geral', 'Gramática Básica 1');

INSERT INTO trilha_ofertada(componente_curricular_id, carga_horaria, idioma, link_ementa,
						   horas_teoricas, horas_praticas)
VALUES (1, 600, 'Inglês', 'bit.ly/123456', '400', '200');

INSERT INTO componente_curricular(codigo, carga_horaria, Eixo_tematico, Obrigatoriedade,
										TIpo_disciplina, Nome_completo) 
VALUES('SPK_2', 60, 'Conversação', TRUE, 'Geral', 'Speaking 2');

INSERT INTO trilha_ofertada(componente_curricular_id, carga_horaria, idioma, link_ementa,
						   horas_teoricas, horas_praticas)
VALUES (2, 600, 'Inglês', 'bit.ly/123456', '400', '200');

INSERT INTO turma_especializacao(Data_Fim, Data_Inicio, trilha_pertencente_id, componente_curricular_id)
VALUES(DATE '2023-12-10', DATE '2023-7-10', 1, 1);

INSERT INTO turma_especializacao(Data_Fim, Data_Inicio, trilha_pertencente_id, componente_curricular_id)
VALUES(DATE '2023-06-10', DATE '2023-02-10', 1, 2);

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
	te.Data_Inicio,
	te.Data_Fim,
	tof.idioma,
	cc.Nome_completo
FROM
	turma_especializacao te
JOIN
	trilha_ofertada tof ON te.trilha_pertencente_id = tof.id
JOIN
	componente_curricular cc ON te.componente_curricular_id = cc.id_componente_curricular;

/* SCRIPT PARA TESTE - PARTE 2
-- Teste de chamada da View

SELECT * FROM vTurmaOffer;

INSERT INTO turma_especializacao(Data_Fim, Data_Inicio, trilha_pertencente_id, componente_curricular_id)
VALUES(DATE '2024-06-10', DATE '2024-02-10', 1, 2);

SELECT * FROM vTurmaOffer;
*/