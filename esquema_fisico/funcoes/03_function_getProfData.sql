CREATE OR REPLACE FUNCTION GetProfData()
RETURNS TABLE (
    aluno_professor_id INTEGER,
    nome_completo VARCHAR,
    pais_de_residencia VARCHAR,
    data_nascimento DATE,
    codigo_pais_telefone INTEGER,
    codigo_area_telefone INTEGER,
    numero_telefone VARCHAR,
    tipo VARCHAR,
    email VARCHAR
)
AS $$
BEGIN
    RETURN QUERY
        SELECT
            prof_isf.membro_academico_id AS aluno_professor_id,
            ma.nome_completo,
            ma.pais_de_residencia,
            ma.data_nascimento,
            ma_telefone.ddi AS codigo_pais_telefone,
            ma_telefone.ddd AS codigo_area_telefone,
            ma_telefone.numero AS numero_telefone,
            ma_email.tipo AS tipo,
            ma_email.valor AS email
        FROM aluno_professor_isf prof_isf
        JOIN membro_academico ma ON prof_isf.membro_academico_id = ma.id
        LEFT JOIN membro_academico_telefone ma_telefone ON ma.id = ma_telefone.membro_academico_id
        LEFT JOIN membro_academico_email ma_email ON ma.id = ma_email.membro_academico_id;
END;
$$ LANGUAGE plpgsql;
