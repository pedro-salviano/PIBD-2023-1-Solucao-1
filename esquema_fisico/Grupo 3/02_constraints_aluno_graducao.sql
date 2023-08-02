ALTER TABLE andifes.aluno_graduacao
    ADD CONSTRAINT FK_aluno_professor_isf FOREIGN KEY (identidade_aluno_graduacao) 
    REFERENCES andifes.aluno_professor_isf(identidade_aluno_professor_isf),