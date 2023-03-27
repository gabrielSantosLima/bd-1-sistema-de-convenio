CREATE TABLE Operadoras (
  CNPJ CHAR(14) PRIMARY KEY, 
  email VARCHAR(50) NOT NULL, 
  registro_de_operadora INT NOT NULL, 
  nome_fantasia VARCHAR(100) NOT NULL, 
  telefone CHAR(11) NOT NULL
);

CREATE TABLE PlanoDeSaude (
  id INTEGER PRIMARY KEY AUTOINCREMENT, 
  titulo VARCHAR(100) NOT NULL, 
  preco DOUBLE NOT NULL, 
  tipo VARCHAR(2) NOT NULL, 
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

CREATE TABLE Empresa (
  CNPJ CHAR(14) NOT NULL PRIMARY KEY,
  nome_fantasia VARCHAR(50) NOT NULL,
  nome_empresarial VARCHAR(100) NOT NULL,
  alvara BLOB NOT NULL,
  data_inicio_atividades DATE NOT NULL,
  logradouro VARCHAR(100) NOT NULL,
  UF CHAR(2) NOT NULL,
  bairro VARCHAR(100) NOT NULL,
  CEP CHAR(8),
  numero_endereco INT NOT NULL
);

CREATE TABLE PessoaFisica (
  CPF CHAR(11) NOT NULL PRIMARY KEY,
  RG CHAR(8) Not NULL UNIQUE,
  nome VARCHAR(100) Not NULL,
  nacionalidade VARCHAR(50),
  genero CHAR(1) Not NULL,
  email VARCHAR(100) Not NULL,
  estado_civil CHAR(1),
  logradouro VARCHAR(100) Not NULL,
  numero_endereco INT(4) Not NULL,
  bairro VARCHAR(100) Not NULL,
  CEP CHAR(8),
  UF CHAR(2) Not NULL,
  data_nascimento DATE Not NULL
);

create TABLE Telefone (
  CPF CHAR(11) NOT NULL,
  telefone VARCHAR(20) NOT NULL,
  PRIMARY KEY(CPF, telefone),
  FOREIGN KEY (CPF) REFERENCES PessoaFisica(CPF)
 );
 
 CREATE TABLE Beneficiario(
  CPF CHAR(11) Not NULL PRIMARY KEY,
  comprovante_renda BLOB NOT NULL,
  fOREIGN KEY (CPF) REFERENCES PessoaFisica(CPF)
);


CREATE TABLE Dependente(
 	CPF_dependente CHAR(11) NOT NULL PRIMARY KEY,
  	RG_dependente CHAR(8) NOT NULL UNIQUE,
  	nome VARCHAR(100) NOT NULL,
  	data_nascimento DATE,
  	CPF_responsavel CHAR(11),
  	FOREIGN KEY (CPF_dependente) REFERENCES PessoaFisica(CPF)
 ); 