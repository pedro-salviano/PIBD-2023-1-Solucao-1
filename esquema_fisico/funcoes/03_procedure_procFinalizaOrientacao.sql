CREATE OR REPLACE PROCEDURE procDeleteOrientacao(
	id_orientando INTEGER,
	id_orientador INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE 
        vInfoOrientador 
    SET 
        membro_academico_id = id_orientador
        aluno_professor_isf_id = id_orientando
    
    RAISE NOTICE 'Orientacao Finalizada';
EXCEPTION
    WHEN others THEN
        RAISE EXCEPTION 'Erro ao finalizar orientacao: %', SQLERRM;
END;
$$;