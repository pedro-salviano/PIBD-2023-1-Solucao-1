ALTER TABLE especialista ADD CONSTRAINT fk_membro FOREIGN KEY (Identidade) REFERENCES membroAcademico(Identidade);
