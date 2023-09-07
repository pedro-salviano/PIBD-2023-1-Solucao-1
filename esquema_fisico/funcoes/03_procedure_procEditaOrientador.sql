CREATE OR REPLACE PROCEDURE procEditaOrientador(
    IN chaveEspecialista INT,
    IN novo_Biodata VARCHAR(200),
    IN novo_DispoMinistrar BOOLEAN,
    IN novo_Titulacao VARCHAR(200),
    IN novo_Lingua VARCHAR(200),
    IN novo_DeclaracaoProficiencia VARCHAR(200),
    IN novo_DispoOriEsp BOOLEAN,
    IN novo_VinculoFile VARCHAR(200),
    IN novo_Curriculo VARCHAR(200),
    IN novo_DataCredenciamento DATE,
    IN novo_DisponibilidadeAutor VARCHAR(200),
    IN novo_Papeis VARCHAR(200),
    IN novo_ResetNeed BOOLEAN,
    IN novo_DiplomaFile VARCHAR(200),
    IN novo_LinkCnpq VARCHAR(200),
    IN novo_PocaFile VARCHAR(200),
    IN novo_RegistroAutoria VARCHAR(200),
    IN novo_identidade INTEGER,
    IN novo_nacionalidade VARCHAR(20),
    IN novo_pais_de_residencia VARCHAR(19),
    IN novo_nome_completo VARCHAR(70),
    IN novo_data_nascimento DATE,
    IN novo_nome_da_mae VARCHAR(70),
    IN novo_genero VARCHAR(20),
    IN novo_email_valor VARCHAR(10),
    IN novo_email_tipo VARCHAR(15),
    IN novo_endereco_complemento VARCHAR(10),
    IN novo_endereco_codigo_postal VARCHAR(10),
    IN novo_endereco_pais VARCHAR(19),
    IN novo_endereco_estado VARCHAR(25),
    IN novo_endereco_cidade VARCHAR(25),
    IN novo_endereco_bairro VARCHAR(40),
    IN novo_endereco_rua VARCHAR(40),
    IN novo_endereco_numero INTEGER,
    IN novo_telefone_ddi VARCHAR(3),
    IN novo_telefone_ddd VARCHAR(3),
    IN novo_telefone_numero VARCHAR(15)
)
LANGUAGE SQL
AS $$
BEGIN
    -- Verifique se o especialista existe
    IF NOT EXISTS (SELECT 1 FROM especialista WHERE membro_academico_id = chaveEspecialista) THEN
        RAISE EXCEPTION 'Especialista não encontrado com ID %.', chaveEspecialista;
    END IF;

    -- Atualize os campos da tabela especialista
    UPDATE especialista
    SET 
        Biodata = novo_Biodata,
        DispoMinistrar = novo_DispoMinistrar,
        Titulacao = novo_Titulacao,
        Lingua = novo_Lingua,
        DeclaracaoProficiencia = novo_DeclaracaoProficiencia,
        DispoOriEsp = novo_DispoOriEsp,
        VinculoFile = novo_VinculoFile,
        Curriculo = novo_Curriculo,
        DataCredenciamento = novo_DataCredenciamento,
        DisponibilidadeAutor = novo_DisponibilidadeAutor,
        Papeis = novo_Papeis,
        ResetNeed = novo_ResetNeed,
        DiplomaFile = novo_DiplomaFile,
        LinkCnpq = novo_LinkCnpq,
        PocaFile = novo_PocaFile,
        RegistroAutoria = novo_RegistroAutoria,
        RegistroMinistrante = novo_RegistroMinistrante
    WHERE membro_academico_id = chaveEspecialista;

    -- Verifique se o membro_academico associado ao especialista existe
    IF NOT EXISTS (SELECT 1 FROM membro_academico WHERE id = chaveEspecialista) THEN
        RAISE EXCEPTION 'Membro acadêmico não encontrado com ID %.', chaveEspecialista;
    END IF;

    -- Atualize os campos da tabela membro_academico
    UPDATE membro_academico
    SET 
        identidade = novo_identidade,
        nacionalidade = novo_nacionalidade,
        pais_de_residencia = novo_pais_de_residencia,
        nome_completo = novo_nome_completo,
        data_nascimento = novo_data_nascimento,
        nome_da_mae = novo_nome_da_mae,
        genero = novo_genero
    WHERE id = chaveEspecialista;

    -- Verifique se o email associado ao membro_academico existe
    IF NOT EXISTS (SELECT 1 FROM membro_academico_email WHERE membro_academico_id = chaveEspecialista) THEN
        RAISE EXCEPTION 'Email não encontrado para o membro acadêmico com ID %.', chaveEspecialista;
    END IF;

    -- Atualize os campos da tabela membro_academico_email
    UPDATE membro_academico_email
    SET 
        valor = novo_email_valor,
        tipo = novo_email_tipo
    WHERE membro_academico_id = chaveEspecialista;

    -- Verifique se o endereço associado ao membro_academico existe
    IF NOT EXISTS (SELECT 1 FROM membro_academico_endereco WHERE membro_academico_id = chaveEspecialista) THEN
        RAISE EXCEPTION 'Endereço não encontrado para o membro acadêmico com ID %.', chaveEspecialista;
    END IF;

    -- Atualize os campos da tabela membro_academico_endereco
    UPDATE membro_academico_endereco
    SET 
        complemento = novo_endereco_complemento,
        codigo_postal = novo_endereco_codigo_postal,
        pais = novo_endereco_pais,
        estado = novo_endereco_estado,
        cidade = novo_endereco_cidade,
        bairro = novo_endereco_bairro,
        rua = novo_endereco_rua,
        numero = novo_endereco_numero
    WHERE membro_academico_id = chaveEspecialista;

    -- Verifique se o telefone associado ao membro_academico existe
    IF NOT EXISTS (SELECT 1 FROM membro_academico_telefone WHERE membro_academico_id = chaveEspecialista) THEN
        RAISE EXCEPTION 'Telefone não encontrado para o membro acadêmico com ID %.', chaveEspecialista;
    END IF;

    -- Atualize os campos da tabela membro_academico_telefone
    UPDATE membro_academico_telefone
    SET 
        ddi = novo_telefone_ddi,
        ddd = novo_telefone_ddd,
        numero = novo_telefone_numero
    WHERE membro_academico_id = chaveEspecialista;

    RAISE NOTICE 'Edição de especialista e membro acadêmico concluída.';
EXCEPTION
    WHEN others THEN
        RAISE EXCEPTION 'Erro ao editar especialista e membro acadêmico: %', SQLERRM;
END;
$$;
