CREATE TABLE IF NOT EXISTS Gestor_Andifes_IsF(
    Id SERIAL PRIMARY KEY,
    Data_Inicial TIMESTAMP,
    Data_Final TIMESTAMP,
    Funcao_Administrativa VARCHAR(50),
    Membro_Academico_Id INTEGER
);