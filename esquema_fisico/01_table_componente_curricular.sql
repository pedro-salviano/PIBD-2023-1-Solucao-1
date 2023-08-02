

CREATE TABLE IF NOT EXISTS componente_curricular (
    codigo varchar(10) CONSTRAINT PK_codigo PRIMARY KEY,
    carga_horaria integer NOT NULL,
    Eixo_tematico varchar(30),
    Obrigatoriedade bool,
    Tipo_disciplina varchar(30),
    Nome_completo varchar(50)
);