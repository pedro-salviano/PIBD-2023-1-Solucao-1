-- CREATE TABLE NovoMaterial (
--   id serial PRIMARY KEY,
--   orientador VARCHAR(50) NOT NULL,
--   orientado VARCHAR(50) NOT NULL,
--   link VARCHAR(300) NOT NULL,
--   status BOOLEAN NOT NULL
-- );

CREATE OR REPLACE PROCEDURE procNovoMaterial(
    m_orientador VARCHAR(50),
    m_orientado VARCHAR(50),
    m_link VARCHAR(300),
    m_status BOOLEAN
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF m_orientador IS NULL THEN
    RAISE EXCEPTION 'O campo orientador não pode ser nulo';
ELSIF m_orientado IS NULL THEN
    RAISE EXCEPTION 'O campo orientado não pode ser nulo';
ELSIF m_link IS NULL THEN
    RAISE EXCEPTION 'O campo link não pode ser nulo';
END IF;

    INSERT INTO NovoMaterial (orientador, orientado, link, status)
    VALUES (m_orientador, m_orientado, m_link, m_status);
END;
$$;


-- Teste 1
-- CALL procNovoMaterial('João da Silva', 'Maria da Silva', 'https://www.google.com', TRUE);
-- SELECT * FROM NovoMaterial;

--Teste 2
-- CALL procNovoMaterial(NULL, 'Maria da Silva', 'https://www.google.com', TRUE);
-- SELECT * FROM NovoMaterial;
