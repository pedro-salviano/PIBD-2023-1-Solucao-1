ALTER TABLE telefone_membro
ADD CONSTRAINT FK_membro_identidade FOREIGN KEY (FK_membro_identidade) REFERENCES membro(identidade);
