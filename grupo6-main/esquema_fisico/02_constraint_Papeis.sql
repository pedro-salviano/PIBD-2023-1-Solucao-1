ALTER TABLE Papeis ADD CONSTRAINT fk_especialista 
    FOREIGN KEY (Identidade) REFERENCES especialista(Identidade)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
