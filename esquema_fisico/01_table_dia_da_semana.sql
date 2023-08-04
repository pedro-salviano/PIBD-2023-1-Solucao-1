CREATE TABLE Dia_da_semana (
  Idioma VARCHAR(50) REFERENCES Idioma(Lingua),
  Codigo VARCHAR(20),
  dia VARCHAR(20),
  Dia_da_semana_id SERIAL PRIMARY KEY
);
