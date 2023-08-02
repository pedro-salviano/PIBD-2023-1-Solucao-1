CREATE TABLE IF NOT EXISTS andifes.aluno_graduacao_ministra_turma (
   aluno_ministrante INTEGER COMMENT "FK para o aluno ministrante",
   sigla_turma VARCHAR(10) COMMENT "FK para a turma que o aluno ministra"
);
