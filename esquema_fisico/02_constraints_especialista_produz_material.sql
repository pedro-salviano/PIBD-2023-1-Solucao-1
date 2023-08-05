


ALTER TABLE especialista_produz_material
    ADD CONSTRAINT FK_especialista_id FOREIGN KEY (especialista_id) REFERENCES especialista(membro_academico_id);

ALTER TABLE especialista_produz_material
    ADD CONSTRAINT FK_material_id FOREIGN KEY (material_id) REFERENCES material(material_id);

COMMENT ON COLUMN  especialista_produz_material.especialista_identidade IS "FK para especialista";


COMMENT ON COLUMN  especialista_produz_material.material_id IS "FK para material";