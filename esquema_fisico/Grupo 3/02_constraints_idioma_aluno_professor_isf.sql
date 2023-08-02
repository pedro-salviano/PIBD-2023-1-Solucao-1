ALTER TABLE andifes.idioma_aluno_professor_isf
    ADD CONSTRAINT FK_id_idioma FOREIGN KEY (id_idiomas) REFERENCES idioma(id_idioma)

ALTER TABLE andifes.idioma_aluno_professor_isf
    ADD CONSTRAINT FK_aluno_professor_isf FOREIGN KEY (identidade_aluno_professor_isf) 
    REFERENCES aluno_professor_isf(identidade_aluno_professor_isf)