CREATE OR REPLACE FUNCTION ConsultarMateriais(
    orientador VARCHAR(100),
    orientado VARCHAR(100),
    status VARCHAR(20)
) RETURNS TABLE (
    material_id SERIAL,
    endereco_link VARCHAR(100),
    id_componente_curricular INT,
    estado VARCHAR(20),
    material_anterior_id INT
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        m.material_id,
        m.endereco_link,
        m.id_componente_curricular,
        m.estado,
        m.material_anterior_id
    FROM
        material m
    WHERE
        m.endereco_link LIKE '%' || orientador || '%' -- Procura por orientador no link
        AND m.endereco_link LIKE '%' || orientado || '%' -- Procura por orientado no link
        AND m.estado = status;
END;
$$ LANGUAGE plpgsql;
