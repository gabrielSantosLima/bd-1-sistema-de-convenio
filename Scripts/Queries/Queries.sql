-- Mostra o nome de todos os medicamentos e, caso exista, o plano de saúde que os suporta
SELECT m.nome, p.titulo
FROM "Medicamentos" as m
LEFT JOIN "MedicamentosSuportados" as ms
ON ms.id_medicamento = m.id_medicamento
LEFT JOIN "PlanoDeSaude" as p
ON ms.id_plano = p.id_plano;

-- Mostrar o nome e CNPJ de todos os hospitais de gestão pública ('P') e os planos que suporta
-- informações do preço, tipo e título
SELECT h."CNPJ", h.nome_fantasia, ps.titulo, ps.preco, ps.tipo
FROM "EstabelecimentoMedico" as h
LEFT JOIN "PlanoHospitalar" as p
ON p.CNPJ = h.CNPJ
LEFT JOIN "PlanoDeSaude" as ps
ON p.id_plano = ps.id_plano
WHERE h.tipo_de_gestao = 'P'

-- Mostrar nome de todos os medicamentos de uma farmácia em ordem decrescente de preços
SELECT m.nome, m.preco, f.nome_fantasia
FROM "Medicamentos" as m
INNER JOIN "MedicamentosSuportados" as ms
ON ms.id_medicamento = m.id_medicamento
INNER JOIN "Farmacias" as f
ON ms."CNPJ" = f."CNPJ"
ORDER BY m.preco DESC;