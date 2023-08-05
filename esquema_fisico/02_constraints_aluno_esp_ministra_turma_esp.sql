ALTER TABLE aluno_esp_cursa_turma_esp
    ADD CONSTRAINT FK_turma_esp FOREIGN KEY (turma_especializacao_id) REFERENCES turma_especializacao(id);
    
ALTER TABLE aluno_esp_cursa_turma_esp
    ADD CONSTRAINT FK_aluno_esp FOREIGN KEY (aluno_professor_isf_id) REFERENCES aluno_especializacao(aluno_professor_isf_id);
