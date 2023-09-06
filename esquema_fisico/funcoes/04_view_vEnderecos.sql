/* SCRIPT PARA TESTE - PARTE 1
-- Criação das tables necessárias para o teste da vEnderecos

CREATE TABLE IF NOT EXISTS membro_academico(
    id SERIAL NOT NULL,
    identidade INTEGER NOT NULL, 
    nacionalidade varchar(20) NOT NULL,
    pais_de_residencia varchar(19) NOT NULL,
    nome_completo varchar(70) NOT NULL,
    data_nascimento DATE NOT NULL,
    nome_da_mae varchar(70),
    genero varchar(20),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS membro_academico_endereco(
    id SERIAL NOT NULL,
    membro_academico_id INT NOT NULL, /* Foreign key */
    complemento varchar(10),
    codigo_postal varchar(10),
    pais varchar(19),
    estado varchar(25),
    cidade varchar(25),
    bairro varchar(40),
    rua varchar(40),
    numero INTEGER,
    PRIMARY KEY (id)
);

-- Constraints das tabelas criadas

ALTER TABLE membro_academico_endereco
    ADD CONSTRAINT FK_membro_academico_id FOREIGN KEY (membro_academico_id) REFERENCES membro_academico (id);

-- Declaração da View:
/*
    A view vEndereco é uma view que retorna todos os endereços cadastrados de um membro acadêmico.
    incluindo codigo postal, complemento, pais, estado, cidade, bairro, rua e numero. 
    É feito um join entre as tables membro_academico e membro_academico_endereco, através da chave estrangeira membro_academico_id.
    As tables utilizadas são: membro_academico e membro_academico_endereco.

*/

*/


CREATE OR REPLACE VIEW vEnderecos AS
SELECT 
    ma.nome_completo,
    mae.complemento,
    mae.codigo_postal,
    mae.pais,
    mae.estado,
    mae.cidade,
    mae.bairro,
    mae.rua,
    mae.numero
FROM 
    membro_academico ma
JOIN 
    membro_academico_endereco mae ON mae.membro_academico_id = ma.id;

/* SCRIPT PARA TESTE - PARTE 2
    -- Teste de chamada da View 

    SELECT * FROM vEnderecos;

    INSERT INTO membro_academico(identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
    VALUES(123456789, 'Brasileiro', 'Brasil', 'João da Silva', DATE '1990-01-01', 'Maria da Silva', 'Masculino');

    INSERT INTO membro_academico_endereco(membro_academico_id, complemento, codigo_postal, pais, estado, cidade, bairro, rua, numero)
    VALUES(1, 'Casa', '12345678', 'Brasil', 'São Paulo', 'São Paulo', 'Centro', 'Rua da Consolação', 123);

    SELECT * FROM vEnderecos;
*/