CREATE TABLE IF NOT EXISTS curso_para_oferta(
 id INTEGER PRIMARY KEY,
 codigo varchar(50),
 coordenador_pedagogico_id INT,
 nome_completo varchar(100),
 nivel varchar(10),
 categoria varchar(40),
 idioma varchar(15),
 carga_horaria INTEGER,
 link_ementa text
);