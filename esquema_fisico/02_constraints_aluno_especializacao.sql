ALTER TABLE andifes.aluno_especializacao
        ADD CONSTRAINT FK_Identidade
            FOREIGN KEY (identidade)
            REFERENCES alunoProfessorISF(identidade); 