CREATE TABLE orientacao_especialista_aluno (
  FK_MembroAcademicoEspecialista IdentidadeEspecialista NOT NULL,
  FK_MembroAcademicoOrientado IdentidadeOrientado NOT NULL,
  período VARCHAR(50) NOT NULL,
  orientacao_especialista_aluno_id SERIAL PRIMARY KEY
);
