-- Active: 1679926847247@@127.0.0.1@3306
INSERT INTO "Operadoras"(CNPJ, email, registro_de_operadora, nome_fantasia, telefone) 
VALUES ("33333333333333", 'exemplo@gmail.com', 001922, 'Hapvida Assistência Médica', '92911111111'),
    ("00000000000000", 'exemplo@gmail.com', 001924, 'Bradesco Saúde', '92911111112'),
    ("11111111111111", 'exemplo@gmail.com', 001923, 'Amil Assistência Médica', '92911111113');

INSERT INTO PlanoDeSaude (preco, tipo, titulo, CNPJ) 
VALUES (120.5, 'I', 'Plano de Exemplo', '33333333333333'),
    (220.5, 'E', 'Plano de Exemplo', '33333333333333');


INSERT INTO "Farmacias"(CEP, CNES, CNPJ, logradouro, municipio, nome_empresarial, nome_fantasia, numero, UF)
VALUES ('11111111', 001, '22222222222222', 'Rua Girassol', 'Manaus', 'FAA', 'Farmácia 1', 1, 'AM'),
    ('11111112', 001, '22222222222223', 'Rua Girassol', 'Manaus', 'FBB', 'Farmácia 2', 2, 'SP');

INSERT INTO "Medicamentos"(nome, preco, tipo, diretriz_de_utilizacao)
VALUES ('MED1', 12.4, 'A', 'Controlado'),
    ('MED2', 12.4, 'B', 'Controlado');

INSERT INTO EstabelecimentoMedico(CNPJ, nome_empresarial, natureza_juridica, nome_fantasia, CNES, tipo_de_gestao, logradouro,UF, CEP, número)
VALUES ('11111111111114', 'MED1', 'SL', 'Medico Manaus', 002, 'P', 'Rua jasmin', 'AM', '11111111', 1),
    ('11111111111115', 'MED2', 'EE', 'Medico Amazonas', 003, 'P', 'Rua Anacora', 'AM', '11111112', 4);

INSERT INTO "Procedimentos"(descricao, diretriz_de_utilizacao, "PAC", segmento, preco, subtipo_do_procedimento,tipo)
VALUES ('Cirurgia de braço', 'Controlado', 1, 'ambulatoria', 1000, 'cirurgia', 'procedimento cirúrgico'),
    ('Cirurgia de perna', 'Controlado', 1, 'ambulatoria', 1000, 'cirurgia', 'procedimento cirúrgico');

SELECT * FROM "EstabelecimentoMedico";
SELECT * FROM "PlanoDeSaude";

INSERT INTO "PlanoHospitalar"("CNPJ", id_plano)
VALUES ('11111111111114', 1);

INSERT INTO "PlanoFarmaceutico"("CNPJ", id_plano)
VALUES ('22222222222222', 1);


SELECT * FROM "Procedimentos";

INSERT INTO "ProcedimentosSuportados"("CNPJ", id_plano, id_procedimento)
VALUES ('22222222222222', 1, 1);

INSERT INTO "MedicamentosSuportados"("CNPJ", id_plano, id_medicamento)
VALUES ('22222222222222', 1, 1);