

CREATE TABLE IF NOT EXISTS especialista_produz_material(
    produz_material_id SERIAL CONSTRAINT PK_especialista_produz_material PRIMARY KEY,
    membro_academico_id INTEGER,
    material_id INTEGER
);
