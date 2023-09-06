-- Crie o tipo de enumeracao caso nao exista
-- CREATE TYPE status_inscricao_enum AS ENUM ('Espera', 'Inscrito', 'Desistente', 'Evadido', 'Deferido');


-- Cria o store procedure para realizar a inscricao dada pela tabela aluno_esp_cursa_turma_esp
/*
Caso deseje que o status seja sempre = 'Inscrito': 
- Basta retirar dos parametros da funcao a linha do p_status_inscricao.
- Dentro do insert into da funcao colocar: status_inscricao = 'Inscrito'.
- No script de teste tirar a passagem do parametro 'Inscrito', nesse caso a funcao deve ter apenas 3 paramentros.

*/
CREATE OR REPLACE FUNCTION procMatricularTurma(
    p_status_inscricao status_inscricao_enum,
    p_nota_final DECIMAL,
    p_aluno_professor_isf_id INT,
    p_turma_especializacao_id INT
) RETURNS VOID AS $$
BEGIN
    INSERT INTO aluno_esp_cursa_turma_esp (
        status_inscricao,
        nota_final,
        aluno_professor_isf_id,
        turma_especializacao_id
    )
    VALUES (
        p_status_inscricao,
        p_nota_final,
        p_aluno_professor_isf_id,
        p_turma_especializacao_id
    );
END;
$$ LANGUAGE plpgsql;


/*
Script de test(deletar essa linha para testar)
DO $$
BEGIN
    PERFORM procMatricularTurma('Inscrito', 0.0, 123, 456);
END $$;
-- Select apenas para checar se a tupla foi realmente inserida
select * from aluno_esp_cursa_turma_esp; 
*/
