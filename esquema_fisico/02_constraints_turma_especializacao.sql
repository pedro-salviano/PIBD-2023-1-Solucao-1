ALTER TABLE turma_especializacao ADD CONSTRAINT FK_trilha_pertencente_id FOREIGN KEY (trilha_pertencente_id) REFERENCES trilha_ofertada(id);

ALTER TABLE turma_especializacao ADD CONSTRAINT FK_componente_curricular_id FOREIGN KEY (componente_curricular_id) REFERENCES componente_curricular(id_componente_curricular);