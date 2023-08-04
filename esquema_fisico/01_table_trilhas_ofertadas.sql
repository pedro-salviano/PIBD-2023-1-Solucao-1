CREATE TABLE trilhas_ofertadas(
    idioma VARCHAR(20) UNIQUE NOT NULL,
    link_ementa VARCHAR(200),
    horas_teoricas INTEGER,
    horas_praticas INTEGER,
)
