
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








-- CREATE TABLE IF NOT EXISTS componente_curricular (
--     id_componente_curricular SERIAL NOT NULL,
--     codigo varchar(10),
--     carga_horaria integer NOT NULL,
--     Eixo_tematico varchar(30),
--     Obrigatoriedade bool,
--     Tipo_disciplina varchar(30),
--     Nome_completo varchar(50),
--     PRIMARY KEY(id_componente_curricular)
-- );







-- CREATE TABLE IF NOT EXISTS material( 
-- 	material_id SERIAL CONSTRAINT PK_material PRIMARY KEY,     /* surrogate sequencial */
-- 	endereco_link VARCHAR(100) NOT NULL,                       /* link do caminho do material */
-- 	id_componente_curricular INT,                              /* FK para componente_curricular */
-- 	estado VARCHAR(20),                                        /* estado: obsoleto, incompleto, completo */
-- 	material_anterior_id INT,                                   /* FK para material, para versionamento */
-- 	especialista_id INTEGER NOT NULL
-- );

-- ALTER TABLE material ADD CONSTRAINT 
-- FK_componente_curricular FOREIGN KEY 
-- (id_componente_curricular) REFERENCES 
-- componente_curricular(id_componente_curricular);

-- ALTER TABLE material ADD CONSTRAINT 
-- FK_material_anterior FOREIGN KEY 
-- (material_anterior_id) REFERENCES 
-- material(material_id);

-- ALTER TABLE material ADD CONSTRAINT 
-- FK_especialista_id FOREIGN KEY 
-- (especialista_id) REFERENCES 
-- especialista(membro_academico_id);







CREATE OR REPLACE VIEW vMaterial AS
SELECT 
	especialista_id,
	endereco_link,
	id_componente_curricular,
	estado,
	material_anterior_id,
	CC.codigo,
    CC.carga_horaria,
    CC.Eixo_tematico,
    CC.Obrigatoriedade,
    CC.Tipo_disciplina,
    CC.Nome_completo,
	E.Biodata , 
    E.DispoMinistrar, 
    E.Titulacao , 
    E.Lingua , 
    E.DeclaracaoProficiencia, 
    E.DispoOriEsp , 
    E.VinculoFile, 
    E.Curriculo , 
    E.DataCredenciamento , 
    E.DisponibilidadeAutor , 
    E.Papeis , 
    E.ResetNeed , 
    E.DiplomaFile , 
    E.LinkCnpq , 
    E.PocaFile , 
    E.RegistroAutoria , 
    E.RegistroMinistrante,
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
	material M
LEFT JOIN
	componente_curricular CC ON CC.id_componente_curricular = M.id_componente_curricular
LEFT JOIN
	especialista E ON E.membro_academico_id = M.especialista_id
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

-- INSERT INTO membro_academico (identidade, nacionalidade, pais_de_residencia, nome_completo, data_nascimento, nome_da_mae, genero)
-- VALUES (147258, 'Brasileira', 'Brasil', 'Yukihira Akame', '1990-01-15', 'Paloma da Silva', 'Masculino');
-- INSERT INTO especialista(membro_academico_id, Biodata , DispoMinistrar, Titulacao , 
-- Lingua , DeclaracaoProficiencia, DispoOriEsp , VinculoFile, Curriculo , DataCredenciamento , 
-- DisponibilidadeAutor , Papeis , ResetNeed , DiplomaFile , LinkCnpq , PocaFile , 
-- RegistroAutoria , RegistroMinistrante)
-- VALUES (1, 'Bio', true, 'Titulo', 'Ingles', 'Proficiente', false, 'VinculoFile', 'Curriculo vasto', 
-- '1990-01-15', 'Disponivel Autor', '2 papeis', false, 'Diploma garantido', 'LinkCnpq', 'PocaFile', 'Registrado Autoria', 'Registrado Ministrante');
-- INSERT INTO membro_academico_telefone(membro_academico_id, ddi, ddd, numero) VALUES (1, '+55' ,'16', '99999-9999'); 
-- INSERT INTO membro_academico_email(membro_academico_id, valor, tipo) VALUES (1, 'mail@mail', 'pessoal');
-- INSERT INTO membro_academico_endereco(membro_academico_id, complemento, codigo_postal, pais, estado, cidade, bairro, rua, numero) VALUES(1, 'compl', 'zipcode', 'brasil', 'estado', 'cidade', 'bairro', 'rua', 10);
-- INSERT INTO componente_curricular(id_componente_curricular, codigo, carga_horaria
-- Eixo_tematico, Obrigatoriedade, Tipo_disciplina, Nome_completo)
-- VALUES (10, 'cod', 16, 'Tema legal', true, 'Espanhol', 'Espanhol para niños');
-- INSERT INTO material(material_id, endereco_link, id_componente_curricular, estado, material_anterior_id, especialista_id)
-- VALUES(1, 'link', 10, 'ativo', NULL, 1);

-- SELECT * FROM vMaterial WHERE especialista_id = 1;