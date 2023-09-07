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
-- );

-- ALTER TABLE material ADD CONSTRAINT 
-- FK_componente_curricular FOREIGN KEY 
-- (id_componente_curricular) REFERENCES 
-- componente_curricular(id_componente_curricular);

-- ALTER TABLE material ADD CONSTRAINT 
-- FK_material_anterior FOREIGN KEY 
-- (material_anterior_id) REFERENCES 
-- material(material_id);



-- CREATE TABLE IF NOT EXISTS especialista_produz_material(
--     produz_material_id SERIAL CONSTRAINT PK_especialista_produz_material PRIMARY KEY,
--     membro_academico_id INTEGER,
--     material_id INTEGER
-- );

-- ALTER TABLE especialista_produz_material
--     ADD CONSTRAINT FK_especialista_id 
	-- FOREIGN KEY (especialista_id) REFERENCES especialista(membro_academico_id);

-- ALTER TABLE especialista_produz_material
--     ADD CONSTRAINT FK_material_id 
	-- FOREIGN KEY (material_id) REFERENCES material(material_id);





-- CREATE TABLE if NOT EXISTS colaboracao_repositorio(
--     id SERIAL NOT NULL,
--     orientacao_id INTEGER NOT NULL,
--     orientado_id INTEGER NOT NULL,
--     codigo_rep INTEGER NOT NULL, 
--     PRIMARY KEY(id)
-- )




-- ALTER TABLE colaboracao_repositorio
--     ADD CONSTRAINT FK_orientado_id 
--         FOREIGN KEY(orientado_id)
--         REFERENCES aluno_especializacao(id);

-- ALTER TABLE colaboracao_repositorio
--     ADD CONSTRAINT FK_orientacao_id 
--         FOREIGN KEY(orientacao_id)
--         REFERENCES especialista(membro_academico_id);

-- ALTER TABLE colaboracao_repositorio
--     ADD CONSTRAINT FK_codigo_rep 
--   		FOREIGN KEY(codigo_rep)
--   			REFERENCES repositorio(codigo_rep);



-- CREATE TABLE if NOT EXISTS  repositorio(
--     codigo_rep INTEGER UNIQUE NOT NULL,
--     link_ementa VARCHAR(200),
--     data_fim DATE, 
--   	referencia VARCHAR(200),
--   	nome_completo VARCHAR(200),
--   PRIMARY Key(codigo_rep)
-- )



CREATE OR REPLACE VIEW vMaterial AS
SELECT 
	material_id,
	endereco_link,
	id_componente_curricular,
	M.estado as Material_Estado,
	material_anterior_id,
	CC.codigo,
    CC.carga_horaria,
    CC.Eixo_tematico,
    CC.Obrigatoriedade,
    CC.Tipo_disciplina,
    CC.Nome_completo as Nome_Componente,
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
    CR.orientacao_id AS Especialista_id,
    CR.orientado_id AS Orientado_id,
    CR.codigo_rep AS Codigo_Repositorio,
    R.link_ementa,
    R.referencia,
    R.nome_completo AS Nome_Repositorio,
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
	especialista_produz_material EPM ON EPM.material_id = M.material_id
LEFT JOIN
	especialista E ON E.membro_academico_id = EPM.membro_academico_id
LEFT JOIN
    colaboracao_repositorio CR ON EPM.membro_academico_id = CR.orientacao_id
LEFT JOIN
    repositorio R ON R.codigo_rep = CR.codigo_rep
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
-- INSERT INTO repositorio(codigo_rep, link_ementa, data_fim, referencia, nome_completo)
-- VALUES(1, 'link_ementa', '2024-02-10', 'refere', 'Repositorio Legal')
-- INSERT INTO colaboracao_repositorio(id, orientacao_id, orientado_id, codigo_rep)
-- VALUES (1, 1, 2, 1)

-- SELECT * FROM vMaterial WHERE orientado_id = 2;