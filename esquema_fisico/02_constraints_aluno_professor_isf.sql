ALTER TABLE aluno_professor_isf
    ADD CONSTRAINT FK_membro_academico FOREIGN KEY (membro_academico_id) REFERENCES membro_academico(id);