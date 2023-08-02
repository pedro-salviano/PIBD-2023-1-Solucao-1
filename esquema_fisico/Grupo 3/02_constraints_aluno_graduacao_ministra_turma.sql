ALTER TABLE aluno_graduacao_ministra_turma
    ADD CONSTRAINT FK_turma_ministrada FOREIGN KEY (sigla_turma) REFERENCES turma(sigla)
    
ALTER TABLE andifes.aluno_graduacao_ministra_turma
    ADD CONSTRAINT FK_aluno_ministrante FOREIGN KEY (aluno_ministrante) REFERENCES aluno_graduacao(id_aluno_graduacao)
