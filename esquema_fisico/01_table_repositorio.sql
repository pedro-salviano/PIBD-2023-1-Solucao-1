CREATE TABLE if NOT EXISTS  repositorio(
    codigo_rep INTEGER UNIQUE NOT NULL,
    link_ementa VARCHAR(200),
    data_fim DATE, 
  	referencia VARCHAR(200),
  	nome_completo VARCHAR(200),
  PRIMARY Key(codigo_rep)
)
