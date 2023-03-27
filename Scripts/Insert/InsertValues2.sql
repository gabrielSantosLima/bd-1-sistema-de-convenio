-- Active: 1679925232147@@127.0.0.1@3306
INSERT INTO "Operadoras"(CNPJ, email, registro_de_operadora, nome_fantasia, telefone) 
VALUES ("33333333333333", 'exemplo@gmail.com', 001922, 'Hapvida Assistência Médica', '92911111111'),
    ("00000000000000", 'exemplo@gmail.com', 001924, 'Bradesco Saúde', '92911111112'),
    ("11111111111111", 'exemplo@gmail.com', 001923, 'Amil Assistência Médica', '92911111113');

INSERT INTO Plano

CREATE TABLE PlanoDeSaude (
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  titulo VARCHAR(100) NOT NULL, 
  preco DOUBLE NOT NULL, 
  tipo VARCHAR(2) NOT NULL, 
  CNPJ CHAR(14) NOT NULL,
  FOREIGN KEY(CNPJ) REFERENCES Operadoras(CNPJ)
);

CREATE TABLE Farmacias (
  CNPJ CHAR(14) PRIMARY KEY, 
  nome_empresarial VARCHAR(100) NOT NULL, 
  nome_fantasia VARCHAR(100) NOT NULL, 
  CNES INT NOT NULL, 
  municipio VARCHAR(100) NOT NULL, 
  numero INT NOT NULL, 
  CEP CHAR(8) NOT NULL, 
  UF CHAR(2) NOT NULL, 
  logradouro VARCHAR(100) NOT NULL
);

CREATE TABLE Medicamentos (
  id_medicamento INTEGER PRIMARY KEY AUTOINCREMENT, 
  nome VARCHAR(100) NOT NULL, 
  preco DOUBLE NOT NULL, 
  tipo CHAR NOT NULL, 
  diretriz_de_utilizacao VARCHAR(100) NOT NULL
);

CREATE TABLE EstabelecimentoMedico (
  CNPJ CHAR(14) PRIMARY KEY, 
  nome_empresarial VARCHAR(100) NOT NULL, 
  nome_fantasia VARCHAR(100) NOT NULL
  natureza_juridica CHAR(2) NOT NULL, 
  CNES INT NOT NULL, 
  tipo_de_gestao CHAR NOT NULL, 
  logradouro VARCHAR(100) NOT NULL, 
  UF CHAR(2) NOT NULL, 
  CEP CHAR(8) NOT NULL, 
  número INT NOT NULL
);

CREATE TABLE Procedimentos (
  id_procedimento INTEGER PRIMARY KEY AUTOINCREMENT, 
  descricao TEXT NOT NULL, 
  preco DOUBLE NOT NULL, 
  subtipo_do_procedimento VARCHAR(100) NOT NULL, 
  tipo VARCHAR(50) NOT NULL, 
  segmento VARCHAR(100) NOT NULL, 
  PAC BOOLEAN NOT NULL, 
  diretriz_de_utilizacao VARCHAR(100) NOT NULL,
);

CREATE TABLE PlanoHospitalar (
  CNPJ CHAR(14), 
  id INT,
  PRIMARY KEY(CNPJ, id),
  FOREIGN KEY(CNPJ) REFERENCES EstabelecimentoMedico(CNPJ),
  FOREIGN KEY(id) REFERENCES PlanoDeSaude(id),
);

CREATE TABLE PlanoFarmaceutico (
  CNPJ CHAR(14), 
  id INT,
  PRIMARY KEY(CNPJ, id),
  FOREIGN KEY(CNPJ) REFERENCES Farmacias(CNPJ),
  FOREIGN KEY(id) REFERENCES PlanoDeSaude(id)
);

CREATE TABLE ProcedimentosSuportados (
  id_procedimento INT, 
  CNPJ CHAR(14), 
  id INT,
  PRIMARY KEY(CNPJ, id, id_procedimento),
  FOREIGN KEY(CNPJ) REFERENCES EstabelecimentoMedico(CNPJ),
  FOREIGN KEY(id) REFERENCES PlanoDeSaude(id),
  FOREIGN KEY(id_procedimento) REFERENCES Procedimentos(id_procedimento)
);

CREATE TABLE MedicamentosSuportados (
  id_medicamento INT, 
  CNPJ CHAR(14), 
  id INT,
  PRIMARY KEY(CNPJ, id, id_medicamento),
  FOREIGN KEY(CNPJ) REFERENCES EstabelecimentoMedico(CNPJ),
  FOREIGN KEY(id) REFERENCES PlanoDeSaude(id),
  FOREIGN KEY(id_medicamento) REFERENCES Medicamentos(id_medicamento)
);
