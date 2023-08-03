ALTER TABLE turma ADD CONSTRAINT fk_cursos_para_oferta FOREIGN KEY (Codigo, Sigla) REFERENCES cursos_para_oferta (Codigo, Sigla);
