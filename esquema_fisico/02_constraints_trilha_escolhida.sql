ALTER TABLE trilha_escolhida
    ADD CONSTRAINT FK_trilha_ofertada_id
        FOREIGN KEY (trilha_ofertada_id)
        REFERENCES trilha_ofertada(id);

ALTER TABLE trilha_escolhida
    ADD CONSTRAINT FK_codigo
        FOREIGN KEY (codigo)
        REFERENCES componente_curricular(codigo);

