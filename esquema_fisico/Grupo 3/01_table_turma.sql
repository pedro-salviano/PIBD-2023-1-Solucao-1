CREATE TABLE IF NOT EXISTS turma(
 codigo varchar(50),
 sigla varchar(10),
 data_inicial DATE,
 data_final DATE,
 Qtd_Inscritos INTEGER,
 Qtd_Evadidos INTEGER,
 Qtd_Desistentes INTEGER,
 Qtd_Concluintes INTEGER,
 PRIMARY KEY (codigo, sigla)
);