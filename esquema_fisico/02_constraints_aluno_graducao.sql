ALTER TABLE aluno_graduacao
    ADD CONSTRAINT FK_aluno_professor_isf FOREIGN KEY (professor_isf_id) 
    REFERENCES aluno_professor_isf(id)