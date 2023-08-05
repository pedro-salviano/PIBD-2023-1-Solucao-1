ALTER TABLE material ADD CONSTRAINT FK_componente_curricular FOREIGN KEY (componente_curricular_codigo) REFERENCES componente_curricular(codigo);
ALTER TABLE material ADD CONSTRAINT FK_material_anterior FOREIGN KEY (material_anterior_id) REFERENCES material(material_id);
