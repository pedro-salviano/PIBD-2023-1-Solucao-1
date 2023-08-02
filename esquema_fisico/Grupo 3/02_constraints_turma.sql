ALTER TABLE andifes.turma 
ADD CONSTRAINT fk_codigo_curso FOREIGN KEY(codigo) REFERENCES curso_para_oferta(codigo);