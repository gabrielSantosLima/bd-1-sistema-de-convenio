-- Active: 1679926847247@@127.0.0.1@3306
CREATE TABLE Operadoras (
  CNPJ CHAR(14) PRIMARY KEY, 
  email VARCHAR(50) NOT NULL, 
  registro_de_operadora INT NOT NULL, 
  nome_fantasia VARCHAR(100) NOT NULL, 
  telefone CHAR(11) NOT NULL
);

CREATE TABLE PlanoDeSaude (
  id_plano INTEGER PRIMARY KEY AUTOINCREMENT, 
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
  nome_fantasia VARCHAR(100) NOT NULL,
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
  diretriz_de_utilizacao INT NOT NULL
);

CREATE TABLE PlanoHospitalar (
  CNPJ CHAR(14), 
  id_plano INT,
  PRIMARY KEY(CNPJ, id_plano),
  FOREIGN KEY(CNPJ) REFERENCES EstabelecimentoMedico(CNPJ),
  FOREIGN KEY(id_plano) REFERENCES PlanoDeSaude(id_plano)
);

CREATE TABLE PlanoFarmaceutico (
  CNPJ CHAR(14), 
  id_plano INT,
  PRIMARY KEY(CNPJ, id_plano),
  FOREIGN KEY(CNPJ) REFERENCES Farmacias(CNPJ),
  FOREIGN KEY(id_plano) REFERENCES PlanoDeSaude(id_plano)
);

CREATE TABLE ProcedimentosSuportados (
  id_procedimento INT, 
  CNPJ CHAR(14), 
  id_plano INT,
  PRIMARY KEY(CNPJ, id_plano, id_procedimento),
  FOREIGN KEY(CNPJ) REFERENCES EstabelecimentoMedico(CNPJ),
  FOREIGN KEY(id_plano) REFERENCES PlanoDeSaude(id_plano),
  FOREIGN KEY(id_procedimento) REFERENCES Procedimentos(id_procedimento)
);

CREATE TABLE MedicamentosSuportados (
  id_medicamento INT, 
  CNPJ CHAR(14), 
  id_plano INT,
  PRIMARY KEY(CNPJ, id_plano, id_medicamento),
  FOREIGN KEY(CNPJ) REFERENCES EstabelecimentoMedico(CNPJ),
  FOREIGN KEY(id_plano) REFERENCES PlanoDeSaude(id_plano),
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

CREATE TABLE EmpresaMEI(
  CNPJ CHAR(14) NOT NULL PRIMARY KEY,
  CCMEI blob not null,
  ID_plano INT NOT NULL,
  FOREIGN KEY(CNPJ) REFERENCES Empresa(cnpj),
  FOREIGN KEY(ID_plano) REFERENCES PlanoDeSaude(id_plano)
);

create TABLE EmpresasDiversas(
  CNPJ CHAR(14) PRIMARY KEY NOT NULL,
  contrato_social blob NOT NULL,
  FGTS blob not null,
  tipo varchar(3) NOT NULL,
  id_plano int not null,
  FOREIGN KEY(CNPJ) REFERENCES Empresa(cnpj),
  FOREIGN KEY(ID_plano) REFERENCES PlanoDeSaude(id_plano)
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

 CREATE TABLE Funcionario(
   CPF CHAR(11) NOT NULL,
   cnpj_empresa CHAR(14) NOT NULL,
   clt char(9) not null UNIQUE,
   CBO CHAR(6) NOT NULL,
   data_admissao DATE NOT NULL,
   PRIMARY KEY(CPF, cnpj_empresa),
   FOREIGN KEY(CPF) REFERENCES PessoaFisica(CPF),
   FOREIGN key(cnpj_empresa) REFERENCES Empresa(CNPJ)
 );


CREATE TABLE Dependente(
 	CPF_dependente CHAR(11) NOT NULL PRIMARY KEY,
  	RG_dependente CHAR(8) NOT NULL UNIQUE,
  	nome VARCHAR(100) NOT NULL,
  	data_nascimento DATE,
  	CPF_responsavel CHAR(11),
  	FOREIGN KEY (CPF_dependente) REFERENCES PessoaFisica(CPF)
 ); 
 
  CREATE TABLE AquisicaoPlanoFamilia(
  CPF_beneficiario CHAR(11) NOT NULL,
  cpf_dependente CHAR(11) NOT NULL,
  ID_plano INT NOT NULL,
  PRIMARY KEY(cpf_dependente, CPF_beneficiario),
  FOREIGN KEY(ID_plano) REFERENCES PlanoDeSaude(id_plano),
  FOREIGN KEY(cpf_beneficiario) REFERENCES Dependente(cpf_responsavel),
  FOREIGN KEY(cpf_dependente) REFERENCES Dependente(cpf_dependente)
);

CREATE TABLE AquisicaoPlanoIndividual(
  CPF_beneficiario CHAR(11) NOT NULL,
  ID_plano INT NOT NULL,
  PRIMARY KEY(cpf_beneficiario, id_plano),
  FOREIGN KEY(ID_plano) REFERENCES PlanoDeSaude(id_plano),
  FOREIGN KEY(cpf_beneficiario) REFERENCES Beneficiario(cpf)
 );
 
 CREATE TABLE RealizaProcedimentoTitular(
    cpf_paciente CHAR(11) NOT NULL,
    id_plano INT NOT NULL,
    ID_procedimento INT NOT NULL,
    cnpj_estabelecimento char(14) NOT NULL,
    data date not null,
    hora time,
    PRIMARY KEY(cpf_paciente, id_plano, id_procedimento, cnpj_estabelecimento, data),
    FOREIGN KEY(cpf_paciente) REFERENCES PessoaFisica(cpf),
    FOREIGN KEY(id_plano) REFERENCES ProcedimentosSuportados(id_plano),
    FOREIGN KEY(cnpj_estabelecimento) REFERENCES ProcedimentosSuportados(cnpj),
    FOREIGN KEY(id_procedimento) REFERENCES ProcedimentosSuportados(id_procedimento)                                                     
 );
  
  CREATE TABLE RealizaProcedimentoDependente(
   cpf_paciente CHAR(11) NOT NULL,
    id_plano INT NOT NULL,
    ID_procedimento INT NOT NULL,
    cnpj_estabelecimento char(14) NOT NULL,
    data date not null,
    hora time,
    PRIMARY KEY(cpf_paciente, id_plano, id_procedimento, cnpj_estabelecimento, data),
    FOREIGN KEY(cpf_paciente) REFERENCES Dependente(cpf),
    FOREIGN KEY(id_plano) REFERENCES ProcedimentosSuportados(id_plano),
    FOREIGN KEY(cnpj_estabelecimento) REFERENCES ProcedimentosSuportados(cnpj),
    FOREIGN KEY(id_procedimento) REFERENCES ProcedimentosSuportados(id_procedimento) 
 );

 CREATE TABLE Receita(
   ID_receita INT NOT NULL PRIMARY KEY,
   receita BLOB NOT NULL
  );
 
CREATE TABLE SolicitacaoMedicamento(
  CPF_solicitante CHAR(11) NOT NULL,
  ID_medicamento INT NOT NULL,
  ID_plano INT NOT NULL,
  CNPJ_farmacia CHAR(14) NOT NULL,
  data date NOT NULL,
  hora time NOT NULL,
  ID_receita INT(20),
  PRIMARY KEY(CPF_solicitante, ID_medicamento, ID_plano, CNPJ_farmacia, data),
  FOREIGN KEY(ID_receita) REFERENCES Receita(ID_receita),
  FOREIGN KEY(id_medicamento) REFERENCES MedicamentosSuportados(id_medicamento),
  FOREIGN KEY(cnpj_farmacia) REFERENCES MedicamentosSuportados(cnpj),
  FOREIGN KEY(id_plano) REFERENCES MedicamentosSuportados(id_plano),
  FOREIGN KEY(cpf_solicitante) REFERENCES PessoaFisica(cpf)
);