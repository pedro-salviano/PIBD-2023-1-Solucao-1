ALTER TABLE aluno_graduacao
    ADD CONSTRAINT FK_aluno_professor_isf FOREIGN KEY (id_professor_isf) 
    REFERENCES aluno_professor_isf(id_aluno_professor_isf),