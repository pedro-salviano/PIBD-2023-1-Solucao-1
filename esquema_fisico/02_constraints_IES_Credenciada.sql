ALTER TABLE andifes.IES_Credenciada
    ADD CONSTRAINT FK_IES_Credenciada FOREIGN KEY (IES_Sigla) REFERENCES IES_Credenciada (IES_Sigla);
