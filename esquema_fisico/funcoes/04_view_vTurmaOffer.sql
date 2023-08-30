/* 
    Explicação do que a View faz:
    A view vTurmaOffer é uma view que mostra as turmas de especialização que estão sendo ofertadas, nesse caso,
    ela mostra a data de início e fim da turma, o idioma da trilha que a turma pertence e o nome do componente curricular, que seria a materia sendo ofertada.
    As tabelas utilizadas são: turma_especializacao, trilha_ofertada e componente_curricular, as quais foram alteradas de acordo com os feedbacks da
    professora Denise.
*/

CREATE OR REPLACE VIEW vTurmaOffer AS
SELECT
	te.Data_Fim,
	te.Data_Inicio,
	tof.idioma,
	cc.Nome_completo
FROM
	turma_especializacao te
JOIN
	trilha_ofertada tof ON te.trilha_pertencente_id = tof.id
JOIN
	componente_curricular cc ON te.componente_curricular_id = cc.id_componente_curricular;