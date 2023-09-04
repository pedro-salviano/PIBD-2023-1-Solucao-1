/* Feito por: Kenzo Inanami de Faria */
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
