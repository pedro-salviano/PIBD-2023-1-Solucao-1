CREATE TABLE turma (/*temos que ver os atributos que são calculadors*/
  Codigo INT NOT NULL,
  Sigla VARCHAR(10) NOT NULL,
  Data_Inicial DATE NOT NULL,
  Data_Final DATE NOT NULL,
  Qtd_Inscritos INT NOT NULL,
  Qtd_Evadidos INT NOT NULL,
  Qtd_Desistentes INT NOT NULL,
  Qtd_Concluintes INT NOT NULL,
  turma_id SERIAL PRIMARY KEY
);
