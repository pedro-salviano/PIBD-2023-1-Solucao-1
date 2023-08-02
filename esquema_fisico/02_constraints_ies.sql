ALTER TABLE andifes.Membro_institucional
ADD CONSTRAINT FK_Endereco_ID FOREIGN KEY (FK_Endereco_ID) REFERENCES andifes.Endereco (Endereco_ID);