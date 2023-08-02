


ALTER TABLE especialista_produz_material
    ADD CONSTRAINT FK_especialista_identidade FOREIGN KEY (especialista_identidade) REFERENCES especialista(epescialista_identidade);

ALTER TABLE especialista_produz_material
    ADD CONSTRAINT FK_material_id FOREIGN KEY (material_id) REFERENCES material(material_id);

COMMENT ON COLUMN  especialista_produz_material.especialista_identidade IS "FK para especialista";


COMMENT ON COLUMN  especialista_produz_material.material_id IS "FK para material";