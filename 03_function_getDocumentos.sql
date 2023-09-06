/* SCRIPT PARA TESTES
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
            
CREATE OR REPLACE FUNCTION getDocumentos(cpf_input VARCHAR)
RETURNS TABLE (
    Titulacao VARCHAR(200),
    tempo_de_atuacao BOOLEAN,
    declaracao_proficiencia VARCHAR(200),
    nivel_proficiencia VARCHAR(200),
    diploma VARCHAR(200),
    comprovacao_profissional VARCHAR(200),
    comprovacao_vinculo VARCHAR(200)
)
AS $$
BEGIN
    RETURN QUERY
    SELECT
        e.Titulacao,
        e.DispoMinistrar AS tempo_de_atuacao,
        e.DeclaracaoProficiencia,
        e.Lingua AS nivel_proficiencia,
        e.DiplomaFile AS diploma,
        e.VinculoFile AS comprovacao_profissional,
        e.Curriculo AS comprovacao_vinculo
    FROM
        especialista e
    INNER JOIN
        membro_academico ma ON e.membro_academico_id = ma.id
    WHERE
        ma.cpf = cpf_input;
END;
$$ LANGUAGE plpgsql;       