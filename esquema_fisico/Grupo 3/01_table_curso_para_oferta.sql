CREATE TABLE IF NOT EXISTS curso_para_oferta(
 codigo varchar(50) PRIMARY KEY,
 nome_completo varchar(100),
 nivel varchar(10),
 categoria varchar(40),
 idioma varchar(15),
 carga_horaria INTEGER,
 link_ementa text,
 /*coord_pedago_curso INTEGER
  checar o tipo de dado de identidade na tabela coordenador_pedago*/
);