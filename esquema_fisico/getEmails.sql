/*
-- Abaixo estao as tabelas e views necessarias para a function funcionar, caso elas ja estejam no banco nao precisa criar novamente.
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

CREATE TABLE IF NOT EXISTS membro_academico_email(
    id SERIAL NOT NULL,
    membro_academico_id INT NOT NULL, /* Foreign key */
    valor varchar(10),
    tipo varchar(15),
    PRIMARY KEY (id)
);

CREATE OR REPLACE VIEW vEmail AS
SELECT 
    ma.nome_completo,
    mae.valor,
    mae.tipo
FROM 
    membro_academico ma
JOIN 
    membro_academico_email mae ON mae.membro_academico_id = ma.id;
*/
-- Cria ou substitui uma função chamada getEmails
-- Ela aceita um parâmetro p_nome_completo e retorna uma tabela
CREATE OR REPLACE FUNCTION getEmails(p_nome_completo varchar) RETURNS TABLE (
    tipo vEmail.tipo%TYPE, -- Define o tipo da coluna 'tipo' com base na visualização vEmail
    valor vEmail.valor%TYPE -- Define o tipo da coluna 'valor' com base na visualização vEmail
) AS $$
BEGIN
	-- Retorna o resultado de uma consulta em visualizacao vEmail
    RETURN QUERY
    SELECT vEmail.tipo, vEmail.valor
    FROM vEmail
    WHERE vEmail.nome_completo = p_nome_completo; -- Filtra por nome_completo igual ao parametro
END;
$$ LANGUAGE plpgsql;

/* --Script de teste: Insere nas tabelas em questao e chama a function criada para conferir se o retorno esta correto.
INSERT into membro_academico(identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero) values (2, 'a', 'a','a','2000-01-06','a','a');
INSERT INTO membro_academico_email(membro_academico_id, valor, tipo) VALUES (1, 'a', 'a');
SELECT * FROM getEmails('a');
-- Do jeito que o script esta estruturado o retorno deve ser tipo = a / valor = a
*/

