

CREATE TABLE IF NOT EXISTS especialista_produz_material(
    produz_material_id SERIAL CONSTRAINT PK_codigo PRIMARY KEY,
    especialista_identidade INTEGER,
    material_id INTEGER
);