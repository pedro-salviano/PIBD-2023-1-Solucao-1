ALTER TABLE andifes.IES
ADD CONSTRAINT FK_Endereco_ID FOREIGN KEY (Endereco_ID) REFERENCES andifes.Endereco (Endereco_ID);