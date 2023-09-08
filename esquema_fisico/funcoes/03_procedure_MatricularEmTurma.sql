CREATE or REPLACE PROCEDURE MatricularEmTurma(userID INT, turma_especial INT)
AS
$$

BEGIN
	INSERT INTO aluno_esp_cursa_turma_esp(status_inscricao, nota_final,aluno_professor_isf_id, turma_especializacao_id)
	VALUES ("INSCRITO", NULL, userID, turma_especial)
	
END;
$$
language 'plpgsql'

