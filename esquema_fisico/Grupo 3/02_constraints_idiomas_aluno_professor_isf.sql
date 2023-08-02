ALTER TABLE idiomas 
    ADD CONSTRAINT FK_membro_academico
    FOREIGN KEY (id_aluno_professor_isf) REFERENCES aluno_professor_isf(id_aluno_professor_isf);