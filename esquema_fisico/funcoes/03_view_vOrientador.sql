-- Tabelas necessarias para funcionamento



-- CREATE TABLE IF NOT EXISTS especialista(
--     membro_academico_id INTEGER NOT NULL,
--     Biodata VARCHAR(200), 
--     DispoMinistrar BOOLEAN, 
--     Titulacao VARCHAR(200), 
--     Lingua VARCHAR(200), 
--     DeclaracaoProficiencia VARCHAR(200), 
--     DispoOriEsp BOOLEAN, 
--     VinculoFile VARCHAR(200), 
--     Curriculo VARCHAR(200), 
--     DataCredenciamento DATE, 
--     DisponibilidadeAutor VARCHAR(200), 
--     Papeis VARCHAR(200), 
--     ResetNeed BOOLEAN, 
--     DiplomaFile VARCHAR(200), 
--     LinkCnpq VARCHAR(200), 
--     PocaFile VARCHAR(200), 
--     RegistroAutoria VARCHAR(200), 
--     RegistroMinistrante VARCHAR(200),
--     PRIMARY KEY (membro_academico_id)
-- );

-- ALTER TABLE especialista
--     ADD CONSTRAINT FK_membro_academico_id
--         FOREIGN KEY (membro_academico_id)
--         REFERENCES membro_academico(Id);





-- CREATE TABLE IF NOT EXISTS membro_academico(
--     id SERIAL NOT NULL,
--     identidade VARCHAR(20) NOT NULL, 
--     nacionalidade varchar(20) NOT NULL,
--     pais_de_residencia varchar(19) NOT NULL,
--     nome_completo varchar(70) NOT NULL,
--     data_nascimento DATE NOT NULL,
--     nome_da_mae varchar(70),
--     genero varchar(20),
--     PRIMARY KEY (id)
-- );






-- CREATE TABLE IF NOT EXISTS membro_academico_email(
--     id SERIAL NOT NULL,
--     membro_academico_id INT NOT NULL, /* Foreign key */
--     valor varchar(10),
--     tipo varchar(15),
--     PRIMARY KEY (id)
-- );

-- ALTER TABLE membro_academico_email
-- ADD CONSTRAINT 
--     FK_membro_academico_id 
-- FOREIGN KEY (membro_academico_id) REFERENCES membro_academico (id);






-- CREATE TABLE IF NOT EXISTS membro_academico_endereco(
--     id SERIAL NOT NULL,
--     membro_academico_id INT NOT NULL, /* Foreign key */
--     complemento varchar(10),
--     codigo_postal varchar(10),
--     pais varchar(19),
--     estado varchar(25),
--     cidade varchar(25),
--     bairro varchar(40),
--     rua varchar(40),
--     numero INTEGER,
--     PRIMARY KEY (id)
-- );

-- ALTER TABLE membro_academico_endereco
-- ADD CONSTRAINT 
--     FK_membro_academico_id 
-- FOREIGN KEY (membro_academico_id) REFERENCES membro_academico (id);






-- CREATE TABLE IF NOT EXISTS membro_academico_telefone(
--     id SERIAL NOT NULL,
--     membro_academico_id INT NOT NULL, /* Foreign key */
--     ddi varchar(3),
--     ddd varchar(3),
--     numero varchar(15),
--     PRIMARY KEY (id)
-- );

-- ALTER TABLE membro_academico_telefone
-- ADD CONSTRAINT 
--     FK_membro_academico_id 
-- FOREIGN KEY (membro_academico_id) REFERENCES membro_academico (id);



CREATE OR REPLACE VIEW vOrientador AS 
SELECT 
	E.membro_academico_id AS orientador_id,
	Biodata , 
    DispoMinistrar, 
    Titulacao , 
    Lingua , 
    DeclaracaoProficiencia, 
    DispoOriEsp , 
    VinculoFile, 
    Curriculo , 
    DataCredenciamento , 
    DisponibilidadeAutor , 
    Papeis , 
    ResetNeed , 
    DiplomaFile , 
    LinkCnpq , 
    PocaFile , 
    RegistroAutoria , 
    RegistroMinistrante,
	MA.identidade , 
	MA.nacionalidade ,
	MA.pais_de_residencia ,
	MA.nome_completo ,
	MA.data_nascimento ,
	MA.nome_da_mae ,
	MA.genero ,
	MAEm.valor AS email,
	MAEm.tipo AS tipo_email,
	MAT.ddi,
	MAT.ddd,
	MAT.numero,
	MAEn.complemento,
    MAEn.codigo_postal,
    MAEn.pais,
    MAEn.estado ,
    MAEn.cidade,
    MAEn.bairro ,
    MAEn.rua ,
    MAEn.numero AS num_endereco
FROM 
    especialista E
LEFT JOIN 
    membro_academico MA ON MA.id = E.membro_academico_id
LEFT JOIN 
    membro_academico_email MAEm ON MAem.membro_academico_id = MA.id
LEFT JOIN 
    membro_academico_telefone MAT ON MAT.membro_academico_id = MA.id
LEFT JOIN 
    membro_academico_endereco MAEn ON MAEn.membro_academico_id = MA.id
WHERE E.DispoOriEsp = True;



-- Scripts Para Teste

-- INSERT INTO membro_academico_telefone(membro_academico_id, ddi, ddd, numero) VALUES (4, '+55' ,'16', '99999-9999'); 
-- INSERT INTO membro_academico_email(membro_academico_id, valor, tipo) VALUES (4, 'mail@mail', 'pessoal');
-- INSERT INTO membro_academico_endereco(membro_academico_id, complemento, codigo_postal, pais, estado, cidade, bairro, rua, numero) VALUES(4, 'compl', 'zipcode', 'brasil', 'estado', 'cidade', 'bairro', 'rua', 10);
-- UPDATE especialista SET DispoOriEsp = True WHERE membro_academico_id = 4;

-- SELECT * FROM vOrientador WHERE orientador_id = 4;