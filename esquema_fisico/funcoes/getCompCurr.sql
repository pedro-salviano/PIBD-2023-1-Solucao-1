/*
Utiliza a view Componente Curricular


CREATE OR REPLACE VIEW vCompCurr AS
    SELECT 
        cc.*, ae.aluno_professor_isf_id
        FROM componente_curricular cc
    LEFT JOIN trilha_escolhida te 
        ON cc.codigo = te.codigo
    LEFT JOIN turma_especializacao turma 
			ON te.trilha_ofertada_id = turma.trilha_escolhida_id
    LEFT JOIN aluno_esp_cursa_turma_esp aecte 
        ON turma.id = aecte.turma_especializacao_id
    LEFT JOIN aluno_especializacao ae 
        ON aecte.aluno_professor_isf_id = ae.aluno_professor_isf_id;

*/

--Basicamente você determina o ID do aluno_professor_isf que ele retorna o componente curricular dele

CREATE OR REPLACE FUNCTION getCompCurr(apISF_id int)
    RETURNS TABLE(
        id_componente_curricular INT,
        codigo VARCHAR(30),
        carga_horaria INT,
        Eixo_tematico VARCHAR(30)
    ) 
AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM vCompCurr
    WHERE vCompCurr.aluno_professor_isf_id = apISF_id;
END;
$$
LANGUAGE 'plpgsql';


--SELECT * FROM getCompCurr(1);