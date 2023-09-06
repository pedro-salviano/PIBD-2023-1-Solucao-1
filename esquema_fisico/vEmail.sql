CREATE OR REPLACE VIEW vEmail AS
SELECT 
    ma.nome_completo,
    mae.valor,
    mae.tipo
FROM 
    membro_academico ma
JOIN 
    membro_academico_email mae ON mae.membro_academico_id = ma.id;
