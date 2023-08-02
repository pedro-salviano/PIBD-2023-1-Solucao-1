ALTER TABLE andifes.aluno_graduacao_ministra_turma
    ADD CONSTRAINT FK_turma_ministrada FOREIGN KEY (sigla_turma) REFERENCES andifes.turma(sigla)
    
ALTER TABLE andifes.aluno_graduacao_ministra_turma
    ADD CONSTRAINT FK_aluno_ministrante FOREIGN KEY REFERENCES andifes.aluno_graduacao(identidade_aluno_graduacao)
