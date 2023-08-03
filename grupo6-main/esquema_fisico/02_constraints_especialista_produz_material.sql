


ALTER TABLE andifes.especialista_produz_material
    ADD CONSTRAINT FK_especialista_identidade FOREIGN KEY (especialista_identidade) REFERENCES especialista(epescialista_identidade);

ALTER TABLE andifes.especialista_produz_material
    ADD CONSTRAINT FK_material_id FOREIGN KEY (material_id) REFERENCES material(material_id);