CREATE TABLE IF NOT EXISTS membro_academico(
    id SERIAL NOT NULL,
    identidade INTEGER NOT NULL, 
    nacionalidade VARCHAR(20) NOT NULL,
    pais_de_residencia VARCHAR(19) NOT NULL,
    nome_completo VARCHAR(70) NOT NULL,
    data_nascimento DATE NOT NULL,
    nome_da_mae VARCHAR(70),
    genero VARCHAR(20),
    login VARCHAR(255),
    senha VARCHAR(255),
    tipo_usuario_id INT, -- Chave estrangeira para a tabela de tipos de usuário
    PRIMARY KEY (id),
    FOREIGN KEY (tipo_usuario_id) REFERENCES tipos_usuario(id)
);

CREATE TABLE IF NOT EXISTS aluno_especializacao(
    aluno_professor_isf_id INTEGER NOT NULL, 
    DataIngresso DATE NOT NULL,
    DataConclusao DATE,
    DiplomaFile VARCHAR(200),
    Titulacao VARCHAR(200),
    RegistroMinistrante VARCHAR(200),
    PRIMARY KEY (aluno_professor_isf_id)
);

CREATE TABLE IF NOT EXISTS especialista(
    membro_academico_id INTEGER NOT NULL,
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
    PRIMARY KEY (membro_academico_id)
);
-- Adicione as colunas login e senha
ALTER TABLE membro_academico
ADD COLUMN login VARCHAR(255),
ADD COLUMN senha VARCHAR(255);

CREATE OR REPLACE VIEW vLogin AS
SELECT
    ma.id AS surrogate,
    ma.login,
    ma.senha -- Remova a vírgula extra daqui
FROM
    membro_academico ma;

-- LEFT JOIN com a tabela especialista
CREATE OR REPLACE VIEW vEspecialista AS
SELECT
    ma.id AS membro_academico_id,
    e.Biodata,
    e.DispoMinistrar,
    e.Titulacao,
    e.Lingua,
    e.DeclaracaoProficiencia,
    e.DispoOriEsp,
    e.VinculoFile,
    e.Curriculo,
    e.DataCredenciamento,
    e.DisponibilidadeAutor,
    e.Papeis,
    e.ResetNeed,
    e.DiplomaFile,
    e.LinkCnpq,
    e.PocaFile,
    e.RegistroAutoria,
    e.RegistroMinistrante
FROM
    membro_academico ma
LEFT JOIN
    especialista e ON ma.id = e.membro_academico_id;

-- LEFT JOIN com a tabela aluno_especializacao
CREATE OR REPLACE VIEW vAlunoEspecializacao AS
SELECT
    ma.id AS aluno_professor_isf_id,
    ae.DataIngresso,
    ae.DataConclusao,
    ae.DiplomaFile,
    ae.Titulacao,
    ae.RegistroMinistrante
FROM
    membro_academico ma
LEFT JOIN
    aluno_especializacao ae ON ma.id = ae.aluno_professor_isf_id;