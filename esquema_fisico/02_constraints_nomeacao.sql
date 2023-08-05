ALTER TABLE nomeacao
ADD CONSTRAINT FK_reitoria_id FOREIGN KEY (reitoria_id) REFERENCES reitoria(id);

ALTER TABLE nomeacao
ADD CONSTRAINT FK_coordenador_administrativo_identidade FOREIGN KEY (coordenador_administrativo_identidade) REFERENCES membro_institucional(membro_academico_id);
