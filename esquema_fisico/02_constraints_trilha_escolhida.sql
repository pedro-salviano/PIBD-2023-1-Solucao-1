ALTER TABLE trilha_escolhida
    ADD CONSTRAINT FK_trilha_ofertada_id
        FOREIGN KEY (trilha_ofertada_id)
        REFERENCES trilha_ofertada(id);

ALTER TABLE trilha_escolhida
    ADD CONSTRAINT FK_componente_curricular_id
        FOREIGN KEY (componente_curricular_id)
        REFERENCES componente_curricular(id_componente_curricular);