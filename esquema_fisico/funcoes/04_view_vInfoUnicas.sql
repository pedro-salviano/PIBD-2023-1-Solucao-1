CREATE OR REPLACE VIEW vInfoUnicas AS
SELECT
  ma.nome_completo,
  ma.nacionalidade,
  ma.identidade,
  ma.nome_da_mae,
  ma.data_nascimento,
  ma.genero,
  ma.pais_de_residencia,
  ae.DataIngresso,
  ae.DataConclusao,
FROM
	membro_academico ma
JOIN
	aluno_especializacao ae ON ae.aluno_professor_isf_id = ma.id
