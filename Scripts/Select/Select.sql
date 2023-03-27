SELECT * FROM Empresa;
SELECT * FROM PessoaFisica;
SELECT * FROM Telefone;
SELECT * from Dependente;
SELECT * FROM Beneficiario;

SELECT D.nome, P.nome
FROM Dependente as d, PessoaFisica as P
WHERE D.cpf_responsavel = P.CPF

/*1. Listando o CPF e o nome de todos os Beneficiarios e quantos dependentes cada um possui*/
SELECT b.CPF, p.nome AS nome_beneficiario, COUNT(d.CPF_dependente) AS total_dependentes
FROM Beneficiario b
INNER JOIN PessoaFisica p ON b.CPF = p.CPF
LEFT JOIN Dependente d ON b.CPF = d.CPF_responsavel
GROUP BY b.CPF, nome_beneficiario;

/* 1. Listagem contendo o nome e CPF do funcionário, por empresa, que possui o maior número de procedimentos médicos realizados entre 2020 e 2023 
	obs: esperando conclusão para testar
*/
SELECT , f.cpf, p.nome as nome_funcionario, COUNT(*) AS quantidade_de_procedimentos
FROM Funcionario f, PessoaFisica p
JOIN RealizaProcedimento pm ON f.CPF = pm.CPF_paciente
WHERE (pm.data BETWEEN '2020-01-01' AND '2023-12-31') AND f.CPF == p.CPF
GROUP BY f.CNPJ_empresa, f.CPF
HAVING COUNT(*) = (
  SELECT COUNT(*) AS maior_numero_procedimento
  FROM Funcionario f2
  JOIN RealizaProcedimento pm2 ON f2.CPF = pm2.CPF_paciente
  WHERE f2.CNPJ_empresa = f.CNPJ_empresa
    AND pm2.data BETWEEN '2020-01-01' AND '2023-12-31'
  GROUP BY f2.CPF
  ORDER BY maior_numero_procedimento DESC
  LIMIT 1
)


