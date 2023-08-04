ALTER TABLE aluno_graduacao_ministra_turma
    ADD CONSTRAINT FK_turma_ministrada FOREIGN KEY (turma_id) REFERENCES turma(id)
    
ALTER TABLE andifes.aluno_graduacao_ministra_turma
    ADD CONSTRAINT FK_aluno_ministrante FOREIGN KEY (aluno_graduacao_id) REFERENCES aluno_graduacao(id)
