ALTER TABLE andifes.idioma_aluno_professor_isf
    ADD CONSTRAINT FK_id_idioma FOREIGN KEY (id_idiomas) REFERENCES idioma(id_idioma)