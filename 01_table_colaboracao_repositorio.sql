CREATE TABLE colaboracao_repositorio(
    id SERIALIZABLE UNIQUE NOT NULL,
    CONSTRAINT
  		FOREIGN KEY(codigo_rep)
  			REFERENCES repositorio(codigo_rep)
  				ON DELETE CASCADE
  				On Update Cascade
    -- fk  esp especialista cod
    -- fk prof orientador cod
    PRIMARY KEY(id)
)

