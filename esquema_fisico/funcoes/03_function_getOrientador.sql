
CREATE OR REPLACE FUNCTION getOrientador( chaveOrientador INT) returns TABLE(
orientador_id INT,
Biodata VARCHAR(200), 
DispoMinistrar BOOLEAN, 
Titulacao VARCHAR(200), 
Lingua VARCHAR(200), 
DeclaracaoProficiencia VARCHAR(200), 
DispoOriEsp BOOLEAN, 
VinculoFile VARCHAR(200), 
Curriculo VARCHAR(200), 
DataCredenciamento DATE, 
DisponibilidadeAutor VARCHAR(200), 
Papeis VARCHAR(200), 
ResetNeed BOOLEAN, 
DiplomaFile VARCHAR(200), 
LinkCnpq VARCHAR(200), 
PocaFile VARCHAR(200), 
RegistroAutoria VARCHAR(200), 
RegistroMinistrante VARCHAR(200),
identidade INT, 
nacionalidade varchar(20),
pais_de_residencia varchar(19),
nome_completo varchar(70),
data_nascimento DATE,
nome_da_mae varchar(70),
genero varchar(20),
email varchar(50),
tipo_email varchar(40),
ddi varchar(3),
ddd varchar(3),
numero  varchar(15),
complemento varchar(10),
codigo_postal varchar(10),
pais varchar(19),
estado varchar(25),
cidade varchar(25),
bairro varchar(40),
rua varchar(40),
num_endereco INTEGER
) AS 
$func$
BEGIN
RETURN QUERY SELECT * FROM vOrientador WHERE vOrientador.orientador_id = $1;
EXCEPTION
        WHEN others THEN
            RAISE EXCEPTION 'Erro ao obter orientador: %', SQLERRM;
END
$func$
LANGUAGE plpgsql;


-- Test Script

/* 

CREATE VIEW vOrientador AS 
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
LEFT JOIN membro_academico MA ON MA.id = E.membro_academico_id
LEFT JOIN membro_academico_email MAEm ON MAem.membro_academico_id = MA.id
LEFT JOIN membro_academico_telefone MAT ON MAT.membro_academico_id = MA.id
LEFT JOIN membro_academico_endereco MAEn ON MAEn.membro_academico_id = MA.id
WHERE E.DispoOriEsp = True;



INSERT INTO membro_academico_telefone(membro_academico_id, ddi, ddd, numero) VALUES (4, '+55' ,'16', '99999-9999'); 
INSERT INTO membro_academico_email(membro_academico_id, valor, tipo) VALUES (4, 'mail@mail', 'pessoal');
INSERT INTO membro_academico_endereco(membro_academico_id, complemento, codigo_postal, pais, estado, cidade, bairro, rua, numero) VALUES(4, 'compl', 'zipcode', 'brasil', 'estado', 'cidade', 'bairro', 'rua', 10);

UPDATE especialista SET DispoOriEsp = True WHERE membro_academico_id = 4;

SELECT * FROM getOrientador(4);

SELECT * FROM vOrientador WHERE orientador_id = 4;

*/