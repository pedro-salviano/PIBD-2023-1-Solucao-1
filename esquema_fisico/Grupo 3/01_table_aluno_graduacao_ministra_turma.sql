CREATE TABLE IF NOT EXISTS aluno_graduacao_ministra_turma (
   id_ministra_turma INTEGER SERIAL PRIMARY KEY,
   aluno_ministrante INTEGER,
   sigla_turma VARCHAR(10)
);
