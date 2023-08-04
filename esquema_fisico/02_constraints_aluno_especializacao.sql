ALTER TABLE andifes.aluno_especializacao
        ADD CONSTRAINT FK_aluno_prof_id
            FOREIGN KEY (id)
            REFERENCES aluno_professor_ISF(id); 
