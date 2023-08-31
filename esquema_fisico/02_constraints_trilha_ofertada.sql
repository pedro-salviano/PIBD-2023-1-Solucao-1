ALTER TABLE trilha_ofertada
    ADD CONSTRAINT FK_componente_curricular_id
        FOREIGN KEY (componente_curricular_id )
        REFERENCES componente_curricular(id_componente_curricular);