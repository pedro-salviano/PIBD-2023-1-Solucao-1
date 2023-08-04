ALTER TABLE trilha_escolhida
    ADD CONSTRAINT FK_idioma
        FOREIGN KEY (idioma)
        REFERENCES trilha_ofertada(idioma);

ALTER TABLE trilha_escolhida
    ADD CONSTRAINT FK_codigo
        FOREIGN KEY (codigo)
        REFERENCES componente_curricular(codigo);

