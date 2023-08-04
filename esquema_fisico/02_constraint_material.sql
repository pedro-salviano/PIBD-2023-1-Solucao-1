ALTER TABLE material ADD CONSTRAINT fk_especialista FOREIGN KEY (Identidade) REFERENCES Especialista(Identidade);
ALTER TABLE material ADD CONSTRAINT fk_componente_curricular FOREIGN KEY (Codigo) REFERENCES Componente_Curricular_Especializacao(Codigo);
