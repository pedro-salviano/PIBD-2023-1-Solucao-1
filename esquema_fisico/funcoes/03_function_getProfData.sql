CREATE OR REPLACE FUNCTION getProfData(professor_id INT)
RETURNS TABLE (
    aluno_professor_id INTEGER,
    nome_completo VARCHAR(70),
    pais_de_residencia VARCHAR(20),
    data_nascimento DATE,
    codigo_pais_telefone INTEGER,
    codigo_area_telefone INTEGER,
    numero_telefone VARCHAR(20),
    tipo VARCHAR(20),
    email VARCHAR(70)
)
AS $func$
BEGIN
    RETURN QUERY(
        SELECT
            v.aluno_professor_id,
            v.nome_completo,
            v.pais_de_residencia,
            v.data_nascimento,
            v.codigo_pais_telefone,
            v.codigo_area_telefone,
            v.numero_telefone,
            v.tipo,
            v.email
        FROM 
            vProfData v
        WHERE
            v.aluno_professor_id = professor_id
 );
EXCEPTION
    WHEN others THEN
        RAISE EXCEPTION 'Erro ao obter as informações';
END;
$func$
LANGUAGE plpgsql;
