ALTER TABLE andifes.curso_para_oferta 
ADD CONSTRAINT fk_coord_pedago_curso FOREIGN KEY(coord_pedago_curso) REFERENCES coordenador_pedago(identidade);