ALTER TABLE Parceiro_Telefone 
    ADD CONSTRAINT FK_Parceiro_Id FOREIGN KEY (Parceiro_Id) REFERENCES Parceiro (Id);