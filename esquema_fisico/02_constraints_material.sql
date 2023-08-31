ALTER TABLE material ADD CONSTRAINT FK_componente_curricular FOREIGN KEY (id_componente_curricular) REFERENCES componente_curricular(id_componente_curricular);
ALTER TABLE material ADD CONSTRAINT FK_material_anterior FOREIGN KEY (material_anterior_id) REFERENCES material(material_id);
