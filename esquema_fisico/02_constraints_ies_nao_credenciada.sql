ALTER TABLE andifes.ies_nao_credenciada
    ADD CONSTRAINT FK_eis_nao_credenciada FOREIGN KEY (IES_Sigla) REFERENCES IES_Nao_Credenciada (IES_Sigla);
