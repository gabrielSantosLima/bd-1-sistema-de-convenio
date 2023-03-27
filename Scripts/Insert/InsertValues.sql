INSERT INTO "Operadoras"(CNPJ, email, registro_de_operadora, nome_fantasia, telefone) 
VALUES ("33333333333333", 'exemplo@gmail.com', 001922, 'Hapvida Assistência Médica', '92911111111'),
    ("00000000000000", 'exemplo@gmail.com', 001924, 'Bradesco Saúde', '92911111112'),
    ("11111111111111", 'exemplo@gmail.com', 001923, 'Amil Assistência Médica', '92911111113');

INSERT INTO PlanoDeSaude (preco, tipo, titulo, CNPJ) 
VALUES (220.5, 'F', 'Plano de Exemplo', '33333333333333'),
	(120.5, 'I', 'Plano de Exemplo', '33333333333333'),
    (220.5, 'E', 'Plano de Exemplo', '33333333333333');


INSERT INTO Farmacias (CNPJ, nome_empresarial, nome_fantasia, CNES, municipio, numero, CEP, UF, logradouro) VALUES
('12345678901234', 'Farmácia São Paulo', 'São Paulo', 1234567, 'São Paulo', 123, '01234567', 'SP', 'Rua A'),
('23456789012345', 'Farmácia Popular', 'Popular', 2345678, 'Rio de Janeiro', 456, '12345678', 'RJ', 'Rua B'),
('34567890123456', 'Farmácia do Povo', 'Povo', 3456789, 'Belo Horizonte', 789, '23456789', 'MG', 'Rua C');

INSERT INTO "Farmacias"(CEP, CNES, CNPJ, logradouro, municipio, nome_empresarial, nome_fantasia, numero, UF)
VALUES ('11111111', 001, '22222222222222', 'Rua Girassol', 'Manaus', 'FAA', 'Farmácia 1', 1, 'AM'),
    ('11111112', 001, '22222222222223', 'Rua Girassol', 'Manaus', 'FBB', 'Farmácia 2', 2, 'SP');

INSERT INTO Medicamentos (nome, preco, tipo, diretriz_de_utilizacao) VALUES
('Paracetamol', 5.50, 'Analgésico', 123),
('Amoxicilina', 10.00, 'Antibiótico', 448),
('Dipirona', 4.00, 'Analgésico', 315),
('Ibuprofeno', 14.00, 'Analgésico', 313);

INSERT INTO "Medicamentos"(nome, preco, tipo, diretriz_de_utilizacao)
VALUES ('MED1', 12.4, 'A', 456),
    ('MED2', 12.4, 'B', 670);

INSERT INTO EstabelecimentoMedico (CNPJ, nome_empresarial, nome_fantasia, natureza_juridica, CNES, tipo_de_gestao, logradouro, UF, CEP, número) VALUES
('45678901234567', 'Hospital das Clínicas', 'HC', 'Público', 4567890, 'Estadual', 'Rua D', 'SP', '12345678', 101),
('56789012345678', 'Hospital Santa Casa', 'Santa Casa', 'Filantrópico', 5678901, 'Privado', 'Rua E', 'RJ', '23456789', 202),
('67890123456789', 'Hospital Moinhos de Vento', 'Moinhos de Vento', 'Privado', 6789012, 'Filantrópico', 'Rua F', 'RS', '34567890', 303);

INSERT INTO EstabelecimentoMedico(CNPJ, nome_empresarial, natureza_juridica, nome_fantasia, CNES, tipo_de_gestao, logradouro,UF, CEP, número)
VALUES ('11111111111114', 'MED1', 'SL', 'Medico Manaus', 002, 'P', 'Rua jasmin', 'AM', '11111111', 1),
    ('11111111111115', 'MED2', 'EE', 'Medico Amazonas', 003, 'P', 'Rua Anacora', 'AM', '11111112', 4);

INSERT INTO Procedimentos (descricao, preco, subtipo_do_procedimento, tipo, segmento, PAC, diretriz_de_utilizacao) VALUES
('Consulta médica com clínico geral', 150.00, 'Consulta', 'Médico', 'Ambulatorial', TRUE, 123456),
('Ressonância magnética da coluna lombar', 1500.00, 'Exame', 'Imagem', 'Hospitalar', FALSE, 234567),
('Retirada de amígdalas', 6000.00, 'Cirurgia', 'Cirurgia Geral', 'Hospitalar', FALSE, 345678),
('Consulta com psicólogo', 180.00, 'Consulta', 'Psicologia', 'Ambulatorial', TRUE, 456789),
('Endoscopia digestiva alta', 4200.00, 'Exame', 'Endoscopia', 'Hospitalar', FALSE, 567890),
('Tratamento de canal dentário', 900.00, 'Procedimento Odontológico', 'Odontologia', 'Ambulatorial', TRUE, 678901);

INSERT INTO "Procedimentos"(descricao, diretriz_de_utilizacao, "PAC", segmento, preco, subtipo_do_procedimento,tipo)
VALUES ('Cirurgia de braço', 345, 1, 'ambulatoria', 1000, 'cirurgia', 'procedimento cirúrgico'),
    ('Cirurgia de perna', 999, 1, 'ambulatoria', 1000, 'cirurgia', 'procedimento cirúrgico');

--INSERIR NA TABELA Empresa
INSERT INTO Empresa VALUES
('12345678901234', 'Empresa Raio de Sol', 'Empresa Raio de Sol LTDA', '010101010101', '1980-01-11', 'Rua A, 123', 'SP', 'Centro', '01010101', 100),
('98765432109876', 'Empresa Rio Negro', 'Empresa Rio Negro S.A.', '020202020202', '2002-05-15', 'Rua B, 456', 'RJ', 'Laranjeiras', '02020202', 200),
('45678901234567', 'Empresa Margarida', 'Empresa Margarida ME', '030303030303', '2010-08-10', 'Rua C, 789', 'MG', 'Savassi', '03030303', 300);

INSERT INTO EmpresaMEI VALUES ('12345678901234', 'CCMEI.pdf', 2);
INSERT INTO EmpresasDiversas VALUES('98765432109876','contrato.pdf', 'fgts.PDF', 'EMP', 2);

--INSERIR NA TABELA PessoaFisica
INSERT INTO PessoaFisica VALUES
('10987654321', '12345111', 'João da Silva', 'Brasileira', 'M', 'joao.silva@email.com', 'S', 'Rua A', 100, 'Centro', '12345678', 'SP', '1990-01-01'),
('21098765432', '23456111', 'Maria Santos', 'Brasileira', 'F', 'maria.santos@email.com', 'C', 'Rua B', 200, 'Vila Nova', '23456789', 'MG', '1988-02-02'),
('32109876543', '34567111', 'Pedro Souza', 'Brasileira', 'M', 'pedro.souza@email.com', 'S', 'Rua C', 300, 'Jardim São Paulo', '34567890', 'PE', '1985-03-03'),
('43210987654', '45678111', 'Ana Oliveira', 'Brasileira', 'F', 'ana.oliveira@email.com', 'C', 'Rua D', 400, 'Liberdade', '45678901', 'RS', '1980-04-04'),
('54321098765', '56789111', 'Luiz Costa', 'Brasileira', 'M', 'luiz.costa@email.com', 'S', 'Rua E', 500, 'Praia do Canto', '56789012', 'ES', '1995-05-05'),
('67890123456', '67890123', 'Carla Rodrigues', 'Brasileira', 'F', 'carla.rodrigues@email.com', 'C', 'Rua F', 600, 'Santa Lúcia', '67890123', 'ES', '1998-06-06'),
('78901234567', '78901234', 'Rafael Silva', 'Brasileira', 'M', 'rafael.silva@email.com', 'S', 'Rua G', 700, 'Barro Vermelho', '78901234', 'ES', '1975-07-07'),
('89012345678', '89012345', 'Julia Costa', 'Brasileira', 'F', 'julia.costa@email.com', 'C', 'Rua H', 800, 'São Pedro', '89012345', 'SP', '1972-08-08'),
('90123456789', '90123456', 'Gustavo Oliveira', 'Brasileira', 'M', 'gustavo.oliveira@email.com', 'C', 'Rua I', 900, 'Jardim América', '90123456', 'SP', '1987-09-09'),
('01234567890', '01234567', 'Bianca Santos', 'Brasileira', 'F', 'bianca.santos@email.com', 'S', 'Rua J', 1000, 'Jardim Botânico', '01234567', 'RJ', '1982-10-10'),
('56789012345', '56789012', 'Mohammed Ali', 'Brasileiro', 'M', 'mohammedali@gmail.com', 'S', 'Rua 3', 500, 'Aleixo', '56789012', 'AM', '1980-10-11'),
('45678901234', '45678901', 'Maria Santos', 'Brasileira', 'F','mariasantos@gmail.com', 'C', 'Visconde Augusto', 400, 'Paraisopolis', '45678901', 'AM','1998-07-10'),
('34567890123', '34567890', 'Davi Lee', 'Brasileiro', 'M', 'davilee@gmail.com', 'S', 'Liberdade', 300, 'Centro', '34567890', 'RJ', '1985-12-31'),
('23456789012', '23456789', 'Janaina Santos', 'Brasileira', 'F', 'janaina@gmail.com', 'C', 'Avenida Frederico', 200, 'Flores', '23456789', 'SP', '1995-02-15'),
('12345678901', '12345678', 'John Smith', 'Irlandes', 'M', 'johnsmith@gmail.com', 'S', 'Rua ABC', 100, 'Centro', '12345678', 'AM', '1990-01-01')

--INSERIR NA TABELA Telefone
INSERT INTO Telefone (CPF, telefone) 
VALUES ('12345678901', '+55 92 99109-1456');
INSERT INTO Telefone (CPF, telefone)
VALUES ('23456789012', '+55 92 8712-9012');
INSERT INTO Telefone (CPF, telefone) 
VALUES ('34567890123', '+1 345-678-9012');
INSERT INTO Telefone (CPF, telefone)
VALUES ('45678901234', '+55 11 1234-5678');
INSERT INTO Telefone (CPF, telefone)
VALUES ('56789012345', '+20 12 3456-7890');

-- INSERIR NA TABELA Beneficiario
INSERT INTO Beneficiario (CPF, comprovante_renda) 
VALUES 
('12345678901', 'comprovante_renda_1'),
('34567890123', 'comprovante_renda_3'),
('45678901234', 'comprovante_renda_4');

-- Inserir na tabela Funcionario |CPF, cnpj_empresa, clt, CBO, data_admissao
INSERT INTO Funcionario (CPF, cnpj_empresa, clt, CBO, data_admissao)
VALUES
('01234567890', '12345678901234', '111111111', '654321', '2019-02-03'),
('90123456789', '12345678901234', '222222222', '543210', '2020-10-23'),
('89012345678', '12345678901234', '333333333', '432109', '2007-06-16'),
('78901234567', '98765432109876', '999999999', '321098', '2014-07-06'),
('67890123456', '98765432109876', '444444444', '210987', '2019-08-24'),
('54321098765', '98765432109876', '555555555', '109876', '2021-11-13'),
('43210987654', '45678901234567', '666666666', '098765', '2011-08-01'),
('32109876543', '45678901234567', '777777777', '9876543', '2016-01-10'),
('21098765432', '45678901234567', '888888888', '8765432', '2022-01-01');


--INSERIR NA TABELA Dependente
INSERT INTO Dependente (CPF_dependente, RG_dependente, nome, data_nascimento, CPF_responsavel)
VALUES ('11111111111', '11111111', 'Alice', '2005-01-01', '12345678901');
INSERT INTO Dependente (CPF_dependente, RG_dependente, nome, data_nascimento, CPF_responsavel)
VALUES ('22222222222', '22222222', 'Bob', '2007-02-01', '12345678901');
INSERT INTO Dependente (CPF_dependente, RG_dependente, nome, data_nascimento, CPF_responsavel)
VALUES ('33333333333', '33333333', 'Charlie', '2010-03-01', '12345678901');
INSERT INTO Dependente (CPF_dependente, RG_dependente, nome, data_nascimento, CPF_responsavel)
VALUES ('77777777777', '77777777', 'Gabriel', '2013-07-01', '45678901234');
INSERT INTO Dependente (CPF_dependente, RG_dependente, nome, data_nascimento, CPF_responsavel)
VALUES ('88888888888', '88888888', 'Hannah', '2008-08-01', '45678901234');
INSERT INTO Dependente (CPF_dependente, RG_dependente, nome, data_nascimento, CPF_responsavel)
VALUES ('99999999999', '99999999', 'Isabella', '2010-09-01', '56789012345');
INSERT INTO Dependente (CPF_dependente, RG_dependente, nome, data_nascimento, CPF_responsavel)
VALUES ('10101010101', '10101010', 'James', '2012-10-01', '56789012345');

INSERT INTO MedicamentosSuportados (id_medicamento, CNPJ, id_plano) VALUES
(1, '12345678901234', 1),
(2, '12345678901234', 1),
(3, '34567890123456', 1),
(4, '34567890123456', 2),
(1, '23456789012345', 2),
(2, '23456789012345', 2),
(3, '12345678901234', 1),
(4, '12345678901234', 1),
(1, '34567890123456', 1),
(4, '23456789012345', 2);

INSERT INTO ProcedimentosSuportados (id_procedimento, CNPJ, id_plano) VALUES
(1, '45678901234567', 1),
(2, '45678901234567', 2),
(3, '45678901234567', 1),
(4, '56789012345678', 2),
(5, '56789012345678', 1),
(6, '56789012345678', 2),
(7, '67890123456789', 1),
(8, '67890123456789', 2),
(1, '67890123456789', 1),
(2, '67890123456789', 2);
  
  
INSERT INTO AquisicaoPlanoFamilia VALUES
('12345678901', '11111111111', 3);
INSERT INTO AquisicaoPlanoFamilia VALUES
  ('12345678901', '22222222222', 3);
  
INSERT INTO AquisicaoPlanoFamilia VALUES
('45678901234', '77777777777', 3);
INSERT INTO AquisicaoPlanoFamilia VALUES
('45678901234', '88888888888', 3);
  
  
INSERT INTO AquisicaoPlanoIndividual VALUES
('34567890123', 1);

-- Inserir em RealizaProcedimentoTitutlar
INSERT INTO RealizaProcedimentoTitular VALUES ('34567890123', 1, 1, '67890123456789', '2021-05-10', '09:30:00');
INSERT INTO RealizaProcedimentoTitular VALUES ('01234567890', 2, 2, '67890123456789', '2022-03-15', '14:00:00');
INSERT INTO RealizaProcedimentoTitular VALUES ('01234567890', 2, 3, '67890123456789', '2023-01-20', '10:45:00');
INSERT INTO RealizaProcedimentoTitular VALUES ('67890123456', 1, 4, '56789012345678', '2019-08-05', '13:15:00');
INSERT INTO RealizaProcedimentoTitular VALUES ('67890123456', 1, 5, '45678901234567', '2020-06-12', '16:30:00');
INSERT INTO RealizaProcedimentoTitular VALUES ('89012345678', 2, 6, '45678901234567', '2021-11-25', '08:00:00');
INSERT INTO RealizaProcedimentoTitular VALUES ('90123456789', 1, 1, '56789012345678', '2022-09-01', '11:20:00');
INSERT INTO RealizaProcedimentoTitular VALUES ('90123456789', 2, 2, '56789012345678', '2020-10-03', '12:40:00');
INSERT INTO RealizaProcedimentoTitular VALUES ('21098765432', 1, 3, '45678901234567', '2020-02-25', '19:35:00');
INSERT INTO RealizaProcedimentoTitular VALUES ('90123456789', 2, 4, '45678901234567', '2023-02-03', '12:40:00');
INSERT INTO RealizaProcedimentoTitular VALUES ('21098765432', 2, 2, '67890123456789', '2020-05-21', '19:35:00');

INSERT INTO RealizaProcedimentoDependente VALUES ('22222222222', 3, 2, '67890123456789', '2021-10-11', '09:30:00');

INSERT INTO SolicitacaoMedicamento VALUES('34567890123', 1, 1, '12345678901234', '2022-10-09', '12:34:19', NULL)
