ALTER TABLE Aprovacao_Parceiro 
ADD CONSTRAINT FK_Parceiro_Id FOREIGN KEY (Parceiro_Id) REFERENCES Parceiro (Id);

ALTER TABLE Aprovacao_Parceiro 
ADD CONSTRAINT FK_Gestor_Andifes_Isf_Id FOREIGN KEY (Gestor_Andifes_Isf_Id) REFERENCES Gestor_Andifes_Isf (Id);
