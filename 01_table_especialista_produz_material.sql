

CREATE TABLE IF NOT EXISTS andifes.especialista_produz_material(
    produz_material_id SERIAL CONSTRAINT PK_codigo PRIMARY KEY,
    especialista_identidade INT COMMENT "FK para especialista",
    material_id INT COMMENT "FK para material"
);