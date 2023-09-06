CREATE OR REPLACE FUNCTION closeOrientacao()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE 
  	orientacao
  SET 
  	data_final = CURRENT_TIMESTAMP
  WHERE 
  	aluno_professor_isf_id = NEW.aluno_professor_isf_id AND
    membro_academico_id = NEW.membro_academico_id;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tCloseOrientacao
INSTEAD OF UPDATE
ON vinfoorientador
FOR EACH ROW
EXECUTE FUNCTION closeOrientacao();

-- UPDATE
-- 	vinfoorientador
-- SET
-- 	aluno_professor_isf_id = 1

