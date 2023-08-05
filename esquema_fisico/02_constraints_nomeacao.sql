ALTER TABLE nomeacao
ADD CONSTRAINT FK_reitoria_id FOREIGN KEY (reitoria_id) REFERENCES reitoria(id);

ALTER TABLE nomeacao
ADD CONSTRAINT FK_membro_institucional FOREIGN KEY (membro_institucional_id) REFERENCES membro_institucional(membro_academico_id);
