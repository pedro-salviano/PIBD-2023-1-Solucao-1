CREATE TABLE IF NOT EXISTS andifes.aluno_graduacao_ministra_turma (
   aluno_ministrante INTEGER REFERENCES andifes.aluno_graduacao(identidade_aluno_graduacao) COMMENT "Ja esta declarada",
   sigla_turma VARCHAR(10) COMMENT "FK para a turma que o aluno ministra"
);