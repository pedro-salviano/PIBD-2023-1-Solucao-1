ALTER TABLE nomeacao
ADD CONSTRAINT FK_reitoria_Inicio_Periodo FOREIGN KEY (FK_reitoria_Inicio_Periodo) REFERENCES reitoria(Inicio_Periodo);

ALTER TABLE nomeacao
ADD CONSTRAINT FK_coordenador_administrativo_identidade FOREIGN KEY (FK_coordenador_administrativo_identidade) REFERENCES coordenador_administrativo(identidade);
