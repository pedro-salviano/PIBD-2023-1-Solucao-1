ALTER TABLE especialista ADD CONSTRAINT fk_membro FOREIGN KEY (membro_academico_id) REFERENCES membroAcademico(id);
