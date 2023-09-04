CREATE VIEW vTelefone AS
SELECT
    rt.id AS telefone_id,
    rt.reitoria_id,
    rt.Numero_telefone,
    rt.DDD_telefone,
    rt.DDI_telefone,
FROM
    reitoria_telefone rt
LEFT JOIN
    reitoria r ON rt.reitoria_id = r.id;
