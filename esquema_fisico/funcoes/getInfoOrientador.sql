CREATE OR REPLACE FUNCTION getInfoOrientador(p_id_orientador integer) RETURNS SETOF vInfoOrientador AS
$$
BEGIN
    RETURN QUERY 
    SELECT *
    FROM vInfoOrientador
    WHERE membro_academico_id = p_id_orientador;

    RETURN;
END;
$$
LANGUAGE plpgsql;