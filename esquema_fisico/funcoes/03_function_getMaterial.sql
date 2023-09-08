CREATE OR REPLACE FUNCTION getMaterial(orientado_id INT)
RETURNS TABLE (
    codigo_rep INT,
    link_ementa VARCHAR(200),
    data_fim DATE,
    referencia VARCHAR(200),
    nome_completo VARCHAR(200)
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        r.codigo_rep,
        r.link_ementa,
        r.data_fim,
        r.referencia,
        r.nome_completo
    FROM
        colaboracao_repositorio cr
    INNER JOIN
        repositorio r ON cr.codigo_rep = r.codigo_rep
    WHERE
        cr.orientado_id = orientado_id;
END;
$$ LANGUAGE plpgsql;
