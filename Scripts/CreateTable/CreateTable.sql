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