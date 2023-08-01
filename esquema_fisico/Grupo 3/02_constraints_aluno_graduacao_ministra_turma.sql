ALTER TABLE andifes.aluno_graduacao_ministra_turma
    ADD CONSTRAINT FK_turma_ministrada FOREIGN KEY (sigla_turma) REFERENCES andifes.turma(sigla)