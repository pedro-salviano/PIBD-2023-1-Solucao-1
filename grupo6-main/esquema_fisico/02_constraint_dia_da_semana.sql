ALTER TABLE Dia_da_semana ADD CONSTRAINT fk_trilha_escolhida FOREIGN KEY (Idioma) REFERENCES trilha_escolhida(Idioma);
ALTER TABLE Dia_da_semana ADD  CONSTRAINT fk_componente_curricular FOREIGN KEY (Codigo) REFERENCES Componente_Curricular_Especializacao(Codigo);
