CREATE OR REPLACE FUNCTION public.getTurmaOffer()
	RETURNS TABLE(
		data_inicio DATE,
		data_fim DATE,
		idioma VARCHAR(20),
		Nome_completo VARCHAR(50),
		codigo VARCHAR(10)
	) AS $$
BEGIN
	RETURN QUERY SELECT * FROM vTurmaOffer;
END;
$$ LANGUAGE plpgsql;