

CREATE TABLE IF NOT EXISTS andifes.componente_curricular (
    codigo varchar(10) CONSTRAINT PK_codigo PRIMARY KEY 
        COMMENT "Codigo que define uma componente, composto por abreviação do idioma, dias da semana, e caractere caso haja mutiplas",
    carga_horaria integer NOT NULL,
    Eixo_tematico varchar(30),
    Obrigatoriedade bool,
    Tipo_disciplina varchar(30),
    Nome_completo varchar(50)
);