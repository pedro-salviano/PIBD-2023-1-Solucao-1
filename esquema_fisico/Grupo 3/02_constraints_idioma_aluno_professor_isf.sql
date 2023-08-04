ALTER TABLE idiomas 
    ADD CONSTRAINT FK_membro_academico
    FOREIGN KEY (aluno_professor_isf_id) REFERENCES aluno_professor_isf(id);