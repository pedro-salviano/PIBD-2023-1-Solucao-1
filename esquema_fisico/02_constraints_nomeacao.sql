ALTER TABLE nomeacao
ADD CONSTRAINT FK_reitoria_Inicio_Periodo FOREIGN KEY (inicio_periodo) REFERENCES reitoria(Inicio_Periodo);

ALTER TABLE nomeacao
ADD CONSTRAINT FK_coordenador_administrativo_identidade FOREIGN KEY (coordenador_administrativo_identidade) REFERENCES membro_institucional(membro_academico_id);
