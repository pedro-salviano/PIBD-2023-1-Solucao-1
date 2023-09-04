CREATE OR REPLACE PROCEDURE procEditaOrientador(chaveOrientador INT, chaveAluno INT, novaDataInicial TIMESTAMP)
LANGUAGE SQL
AS $$
BEGIN
    -- Verifique se a orientação existe
    IF NOT EXISTS (SELECT 1 FROM orientacao WHERE membro_academico_id = chaveOrientador AND aluno_professor_isf_id = chaveAluno) THEN
        RAISE EXCEPTION 'Orientação não encontrada para o orientador % e aluno %.', chaveOrientador, chaveAluno;
    END IF;

    -- Atualize a data inicial da orientação
    UPDATE orientacao
    SET data_inicial = novaDataInicial
    WHERE membro_academico_id = chaveOrientador AND aluno_professor_isf_id = chaveAluno;

    RAISE NOTICE 'Edição de orientação concluída.';
EXCEPTION
    WHEN others THEN
        RAISE EXCEPTION 'Erro ao editar orientação: %', SQLERRM;
END;
$$;
