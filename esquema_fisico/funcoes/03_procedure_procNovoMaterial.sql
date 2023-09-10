CREATE OR REPLACE PROCEDURE procNovoMaterial(
    orientador VARCHAR(50),
    orientado VARCHAR(50),
    link VARCHAR(300),
    status BOOLEAN
);

RETURNS INTEGER AS $$
DECLARE
    material_id INTEGER;

BEGIN
    -- Insere o registro na tabela material
    INSERT INTO material(orientador, orientado, link, status) 
    VALUES (orientador, orientado, link, status)
    RETURNING id INTO material_id;

    -- Insere o registro na tabela especialista_produz_material
    INSERT INTO especialista_produz_material(especialista_id, material_id) 
    VALUES (material_id);

    RETURN material_id;
END;
$$ LANGUAGE plpgsql;

SELECT procNovoMaterial('orientador', 'orientado', 'link', 'status')
