CREATE OR REPLACE FUNCTION getMaterial(orientado_id INT)
RETURNS TABLE (
    material_id INT,
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
    JOIN
        especialista_produz_material epm
    ON
        m.material_id = epm.material_id
    WHERE
        epm.membro_academico_id = orientado_id;

END;
$$ LANGUAGE plpgsql;
