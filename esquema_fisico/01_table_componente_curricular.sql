CREATE TABLE IF NOT EXISTS componente_curricular (
    id_componente_curricular SERIAL NOT NULL,
    codigo varchar(10),
    carga_horaria integer NOT NULL,
    Eixo_tematico varchar(30),
    Obrigatoriedade bool,
    Tipo_disciplina varchar(30),
    Nome_completo varchar(50),
    PRIMARY KEY(id_componente_curricular)
);