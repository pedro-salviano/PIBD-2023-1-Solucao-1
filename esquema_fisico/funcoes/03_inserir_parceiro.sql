CREATE OR REPLACE FUNCTION inserir_parceiro(
     p_Nome VARCHAR(50),
     p_tipo_parceiro tipo_parceiro,
     p_Num_Identificador VARCHAR(50),
     p_Pais_Origem VARCHAR(50),
     p_DDI VARCHAR(4),
     p_DDD VARCHAR(2),
     p_Telefone VARCHAR(11),
     p_Pais VARCHAR(50),
     p_Codigo_postal VARCHAR(50),
     p_Estado VARCHAR(50),
     p_Cidade VARCHAR(50),
     p_Numero VARCHAR(5),
     p_Rua VARCHAR(50),
     p_Bairro VARCHAR(50),
     p_Complemento VARCHAR(50) DEFAULT NULL
)
returns void
LANGUAGE plpgsql
AS $$
DECLARE
    v_Parceiro_Id INTEGER;
BEGIN
    -- Inserir na tabela Parceiro e obter o Id gerado
    INSERT INTO Parceiro(Num_Identificador, Pais_Origem, Nome, tipo)
    VALUES(p_Num_Identificador, p_Pais_Origem, p_Nome, p_tipo_parceiro)
    RETURNING Id INTO v_Parceiro_Id;

    -- Chamar o procedimento para adicionar o endereço
    perform inserir_parceiro_endereco(
        p_Codigo_postal,
        p_Pais,
        p_Bairro,
        p_Rua,
        p_Numero,
        p_Cidade,
        p_Estado,
        p_Complemento,
        v_Parceiro_Id
    );
    -- Chamar o procedimento para adicionar o telefone
    perform inserir_parceiro_telefone(
        p_DDI,
        p_DDD,
        p_Telefone,
        v_Parceiro_Id
    );
END;
$$;