CREATE OR REPLACE FUNCTION public.getTurmaOffer()
    RETURNS TABLE(
        data_inicio DATE,
        data_fim DATE,
        idioma VARCHAR(20),
        Nome_completo VARCHAR(50),
        codigo VARCHAR(10)
    ) AS $$
BEGIN
    RETURN QUERY
    SELECT
        data_inicio,
        data_final AS data_fim,
        idioma,
        nome_completo AS Nome_completo,
        codigo
    FROM vTurmaOffer;
END;
$$ LANGUAGE plpgsql;
