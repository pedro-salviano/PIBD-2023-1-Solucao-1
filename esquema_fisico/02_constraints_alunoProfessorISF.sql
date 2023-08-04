ALTER TABLE IF NOT EXISTS andifes.alunoProfessorISF
    ADD CONSTRAINT FK_Identidade 
            FOREIGN KEY (identidade)
            REFERENCES membro_academico(identidade);