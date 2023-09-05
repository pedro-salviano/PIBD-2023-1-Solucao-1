/* SCRIP PARA TESTE - PARTE 1

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

CREATE TABLE IF NOT EXISTS aluno_especializacao(
    aluno_professor_isf_id INTEGER NOT NULL, 
    DataIngresso DATE NOT NULL,
    DataConclusao DATE,
    DiplomaFile VARCHAR(200),
    Titulacao VARCHAR(200),
    RegistroMinistrante VARCHAR(200),
    PRIMARY KEY (aluno_professor_isf_id)
);

-- Constraints das tabelas criadas
ALTER TABLE especialista
    ADD CONSTRAINT FK_membro_academico_id
        FOREIGN KEY (membro_academico_id)
        REFERENCES membro_academico(Id);

ALTER TABLE aluno_especializacao
        ADD CONSTRAINT FK_aluno_prof_id
            FOREIGN KEY (aluno_professor_isf_id)
            REFERENCES aluno_professor_isf(membro_academico_id); 
*/

-- Declaração da View:

/*
	Seleciona os documentos que cada individuo possui (Titulação, Tempo de atuação,Nivel de proeficiencia, Diploma, Comprovação profissional, 
	Comprovação de vinculo), mostrando a qualificação para exercer a vaga. 
*/

CREATE OR REPLACE VIEW vDocumentos as 
SELECT 
		esp.Titulacao as Titulacao,
		esp.Tempo_de_atuacao as DisponibilidadeAutor,
		esp.Nivel_de_proficiencia as DeclaracaoProficiencia,
		esp.Diploma as Diploma, 
		ae.Comprovacao_profissional as RegistroMinistrante,
		esp.Comprovacao_de_vinculo as VinculoFile
FROM 
		especialista esp 
JOIN 
		aluno_especializacao ae ON  = ae.esp

/*
--SCRIPT PARA TESTE - PARTE 2
-- Teste de chamada da View

SELECT * FROM vDocumentos;

INSERT INTO especialista(Titulacao, Diploma, DeclaracaoProficiencia)
VALUES('Doutorado', 'Academia de letras do brasil', 'Certificado e proficiencia');

SELECT * FROM vDocumentos;
*/