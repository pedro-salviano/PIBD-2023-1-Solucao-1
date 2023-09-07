CREATE OR REPLACE FUNCTION verifica_orientacao() RETURNS TRIGGER AS $$
BEGIN

    IF EXISTS (
        SELECT 1 FROM orientacao 
        WHERE 
            membro_academico_id = NEW.membro_academico_id 
            AND aluno_professor_isf_id = NEW.aluno_professor_isf_id 
            AND (data_final IS NULL OR data_final >= CURRENT_DATE)
    ) THEN

        RAISE EXCEPTION 'Já existe uma orientação com período aberto para este Orientando e Orientador.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tCheckOrienta
BEFORE INSERT ON orientacao
FOR EACH ROW
EXECUTE FUNCTION verifica_orientacao();