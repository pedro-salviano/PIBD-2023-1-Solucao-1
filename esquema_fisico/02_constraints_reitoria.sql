ALTER TABLE andifes.reitoria
ADD CONSTRAINT FK_IES_IES_Sigla FOREIGN KEY (IES_IES_Sigla) REFERENCES andifes.IES (IES_Sigla);