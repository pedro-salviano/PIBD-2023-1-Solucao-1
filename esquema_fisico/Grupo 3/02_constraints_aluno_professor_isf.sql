ALTER TABLE aluno_professor_isf
    ADD CONSTRAINT FK_membro_academico FOREIGN KEY (id_membro_academico) REFERENCES membro_academico(id_membro_academico)