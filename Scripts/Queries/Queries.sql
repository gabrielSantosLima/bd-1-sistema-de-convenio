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

-- Listando o CPF e o nome de todos os Beneficiarios e quantos dependentes cada um possui em ordem decrescente*/
SELECT b.CPF, p.nome AS nome_beneficiario, COUNT(d.CPF_dependente) AS total_dependentes
FROM Beneficiario b
INNER JOIN PessoaFisica p ON b.CPF = p.CPF
LEFT JOIN Dependente d ON b.CPF = d.CPF_responsavel
GROUP BY b.CPF, nome_beneficiario
order BY total_dependentes DESC;

/* Listagem contendo o nome e CPF do funcionário, por empresa, que possui o maior número
de procedimentos médicos realizados entre 2019 e 2023
*/
SELECT e.nome_fantasia AS "Empresa em que trabalha", f.cpf, p.nome as "Nome do funcionário", COUNT(*) AS "Qtd. de procedimentos"
FROM Funcionario f, PessoaFisica p, Empresa e
JOIN RealizaProcedimentoTitular pm ON f.CPF = pm.CPF_paciente
WHERE (pm.data BETWEEN '2019-01-01' AND '2023-12-31') AND f.CPF == p.CPF AND cnpj_empresa = e.CNPJ
GROUP BY e.nome_fantasia, f.CPF
HAVING COUNT(*) = (
  SELECT COUNT(*) AS maior_numero_procedimento
  FROM Funcionario f2
  JOIN RealizaProcedimentoTitular pm2 ON f2.CPF = pm2.CPF_paciente
  WHERE f2.CNPJ_empresa = f.CNPJ_empresa
    AND pm2.data BETWEEN '2019-01-01' AND '2023-12-31'
  GROUP BY f2.CPF
  ORDER BY maior_numero_procedimento DESC
  LIMIT 1
)

-- CPF, nome e total gasto da pessoa que mais gastou em procedimentos médicos no ano de 2022
SELECT p.cpf, p.nome as "Nome", SUM(pr.preco) AS "Total gasto com procedimentos"
FROM PessoaFisica p, RealizaProcedimentoTitular pm, Procedimentos pr
WHERE p.cpf = pm.cpf_paciente
		AND pr.id_procedimento = pm.ID_procedimento AND pm.data LIKE "2022%"

