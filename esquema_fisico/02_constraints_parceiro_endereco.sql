ALTER TABLE Parceiro_Endereco 
    ADD CONSTRAINT FK_Parceiro_Id FOREIGN KEY (Parceiro_Id) REFERENCES Parceiro (Id);