ALTER TABLE Idioma ADD CONSTRAINT fk_especialista FOREIGN KEY (Identidade) REFERENCES especialista(Identidade);
