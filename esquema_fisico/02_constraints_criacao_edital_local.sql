ALTER TABLE Criacao_Edital_Local 
ADD CONSTRAINT FK_Edital_Id FOREIGN KEY (Edital_Id) REFERENCES Edital (Id);

ALTER TABLE Criacao_Edital_Local 
ADD CONSTRAINT FK_membro_institucional FOREIGN KEY (membro_academico_id) REFERENCES Membro_institucional (membro_academico_id);


edital_Id INTEGER,
membro_academico_id INTEGER /*chave estrangeira que representa membro institucional*/