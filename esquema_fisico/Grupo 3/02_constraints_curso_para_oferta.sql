ALTER TABLE curso_para_oferta ADD CONSTRAINT fk_coord_pedago_curso 
FOREIGN KEY(coordenador_pedagogico_id) REFERENCES coordenador_pedagogico(id);