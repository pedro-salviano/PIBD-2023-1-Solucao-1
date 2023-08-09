CREATE OR REPLACE FUNCTION inserir_parceiro_telefone(
    p_DDI VARCHAR(4),
    p_DDD VARCHAR(2),
    p_Telefone VARCHAR(11),
    p_Parceiro_Id INTEGER
)
returns void
LANGUAGE plpgsql
AS $$
BEGIN
    IF p_DDI IS NULL OR p_Telefone IS NULL THEN
        RAISE EXCEPTION 'DDI e Telefone não podem ser nulos';
    END IF;

    INSERT INTO Parceiro_Telefone (DDI, DDD, Telefone, Parceiro_Id)	
    VALUES (p_DDI, p_DDD, p_Telefone, p_Parceiro_Id);
END;
$$;
