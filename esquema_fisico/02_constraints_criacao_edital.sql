ALTER TABLE Criacao_Edital 
ADD CONSTRAINT FK_Edital_Id FOREIGN KEY (Edital_Id) REFERENCES Edital (Id);

ALTER TABLE Criacao_Edital 
ADD CONSTRAINT FK_Gestor_Andifes_Isf_Id FOREIGN KEY (Gestor_Andifes_Isf_Id) REFERENCES Gestor_Andifes_Isf (Id);
