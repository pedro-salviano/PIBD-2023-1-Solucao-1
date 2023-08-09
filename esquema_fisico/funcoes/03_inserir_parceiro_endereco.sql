CREATE OR REPLACE FUNCTION inserir_parceiro_endereco(
	 p_Codigo_postal VARCHAR(50),
	 p_Pais VARCHAR(50),
	 p_Bairro VARCHAR(50),
	 p_Rua VARCHAR(50),
	 p_Numero VARCHAR(5),
	 p_Cidade VARCHAR(50),
	 p_Estado VARCHAR(50),
	 p_Complemento VARCHAR(50),
	 p_Parceiro_Id INTEGER)
returns void
LANGUAGE plpgsql
AS $$
BEGIN
	IF p_Codigo_postal IS NULL OR p_Pais IS NULL OR p_Bairro IS NULL OR p_Rua IS NULL OR p_Numero IS NULL OR p_Cidade IS NULL OR p_Estado IS NULL THEN
		RAISE EXCEPTION 'Campos NOT NULL não podem ser nulos';
	END IF;

	INSERT INTO Parceiro_Endereco (Codigo_postal, Pais, Bairro, Rua, Numero, Cidade, Estado, Complemento, Parceiro_Id)
	VALUES (p_Codigo_postal, p_Pais, p_Bairro, p_Rua, p_Numero, p_Cidade, p_Estado, p_Complemento, p_Parceiro_Id);
END;
$$;
