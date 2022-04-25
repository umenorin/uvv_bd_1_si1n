-- No MySQL, o schema e um sinônimo para database, fazendo assim eu não conseguir criar uma database chamada uvv e o schema chamado elmasri, com isso eu permaneci com o nome elmasri

-- Nessa parte eu estarei criando meu usuário no MySQL
CREATE DATABASE elmasri;

CREATE USER ruan;
GRANT CREATE, SELECT ON *. * TO ruan;
FLUSH PRIVILEGES;

USE elmasri

-- Nessa parte eu estarei criando as tabelas que foram entregues no projeto lógico

ALTER DATABASE elmasri COMMENT 'No MySQL o schema e a database não possuem diferença, fazendo eles possuirem o mesmo significado.';



CREATE TABLE projeto (
                numero_projeto INT NOT NULL,
                nome_projeto VARCHAR(15) NOT NULL,
                local_projeto VARCHAR(15),
                numero_departamento INT NOT NULL,
                PRIMARY KEY (numero_projeto)
);

ALTER TABLE projeto COMMENT 'Tabela que armazena as informações sobre os projetos dos departamentos.';

ALTER TABLE projeto MODIFY COLUMN numero_projeto INTEGER COMMENT 'Número do projeto. É a PK desta tabela.';

ALTER TABLE projeto MODIFY COLUMN nome_projeto VARCHAR(15) COMMENT 'Nome do projeto. Deve ser único.';

ALTER TABLE projeto MODIFY COLUMN local_projeto VARCHAR(15) COMMENT 'Localização do projeto.';


CREATE INDEX projeto_idx
 ON projeto
 ( nome_projeto );

CREATE UNIQUE INDEX projeto_idx1
 ON projeto
 ( nome_projeto );

CREATE TABLE trabalha_em (
                cpf_funcionario CHAR(11) NOT NULL,
                numero_projeto INT NOT NULL,
                horas DECIMAL(3,1),
                PRIMARY KEY (cpf_funcionario, numero_projeto)
);

ALTER TABLE trabalha_em COMMENT 'Tabela para armazenar quais funcionários trabalham em quais projetos.';

ALTER TABLE trabalha_em MODIFY COLUMN numero_projeto INTEGER COMMENT 'para a tabela projeto.';

ALTER TABLE trabalha_em MODIFY COLUMN horas DECIMAL(3, 1) COMMENT 'Horas trabalhadas pelo funcionário neste projeto.';


CREATE TABLE dependente (
                cpf_funcionario CHAR(11) NOT NULL,
                nome_dependente VARCHAR(15) NOT NULL,
                sexo CHAR(1),
                data_nascimento DATE,
                parentesco VARCHAR(15),
                PRIMARY KEY (cpf_funcionario, nome_dependente)
);

ALTER TABLE dependente COMMENT 'Tabela que armazena as informações dos dependentes dos funcionários.';

ALTER TABLE dependente MODIFY COLUMN nome_dependente VARCHAR(15) COMMENT 'Nome do dependente. Faz parte da PK desta tabela.';

ALTER TABLE dependente MODIFY COLUMN sexo CHAR(1) COMMENT 'Sexo do dependente.';

ALTER TABLE dependente MODIFY COLUMN data_nascimento DATE COMMENT 'Data de nascimento do dependente.';

ALTER TABLE dependente MODIFY COLUMN parentesco VARCHAR(15) COMMENT 'Descrição do parentesco do dependente com o funcionário.';


CREATE TABLE departamento (
                numero_departamento INT NOT NULL,
                nome_departamento VARCHAR(15) NOT NULL,
                cpf_gerente CHAR(11) NOT NULL,
                data_inicio DATE,
                PRIMARY KEY (numero_departamento)
);

ALTER TABLE departamento COMMENT 'Tabela que armazena as informaçoẽs dos departamentos.';

ALTER TABLE departamento MODIFY COLUMN numero_departamento INTEGER COMMENT 'Número do departamento. É a PK desta tabela.';

ALTER TABLE departamento MODIFY COLUMN nome_departamento VARCHAR(15) COMMENT 'Nome do departamento. Deve ser único.';

ALTER TABLE departamento MODIFY COLUMN data_inicio DATE COMMENT 'Data do início do gerente no departamento.';


CREATE UNIQUE INDEX departamento_idx
 ON departamento
 ( nome_departamento );

CREATE TABLE localizacoes_departamento (
                numero_departamento INT NOT NULL,
                local VARCHAR(15) NOT NULL,
                PRIMARY KEY (numero_departamento, local)
);

ALTER TABLE localizacoes_departamento COMMENT 'Tabela que armazena as possíveis localizações dos departamentos.';

ALTER TABLE localizacoes_departamento MODIFY COLUMN numero_departamento INTEGER COMMENT 'é uma FK para a tabela departamento.';

ALTER TABLE localizacoes_departamento MODIFY COLUMN local VARCHAR(15) COMMENT 'Localização do departamento. Faz parte da PK desta tabela.';


CREATE TABLE funcionario (
                cpf CHAR(11) NOT NULL,
                primeiro_nome VARCHAR(15) NOT NULL,
                nome_meio CHAR(1),
                ultimo_nome VARCHAR(15) NOT NULL,
                data_nascimento DATE,
                endereco VARCHAR(30),
                sexo CHAR(1),
                salario DECIMAL(10,2),
                cpf_supervisor CHAR(11),
                numero_departamento INT NOT NULL,
                PRIMARY KEY (cpf)
);

ALTER TABLE funcionario COMMENT 'Tabela que armazena as informações dos funcionários.';

ALTER TABLE funcionario MODIFY COLUMN cpf CHAR(11) COMMENT 'CPF do funcionário. Será a PK da tabela.';

ALTER TABLE funcionario MODIFY COLUMN primeiro_nome VARCHAR(15) COMMENT 'Primeiro nome do funcionário.';

ALTER TABLE funcionario MODIFY COLUMN nome_meio CHAR(1) COMMENT 'Inicial do nome do meio.';

ALTER TABLE funcionario MODIFY COLUMN ultimo_nome VARCHAR(15) COMMENT 'Sobrenome do funcionário.';

ALTER TABLE funcionario MODIFY COLUMN data_nascimento DATE COMMENT 'Data de nascimento do funcionário.';

ALTER TABLE funcionario MODIFY COLUMN endereco VARCHAR(30) COMMENT 'Endereço do funcionário.';

ALTER TABLE funcionario MODIFY COLUMN sexo CHAR(1) COMMENT 'Sexo do funcionário.';

ALTER TABLE funcionario MODIFY COLUMN salario DECIMAL(10, 2) COMMENT 'Salário do funcionário.';

ALTER TABLE funcionario MODIFY COLUMN numero_departamento INTEGER COMMENT 'Número do departamento do funcionário.';

-- Nessa parte estarei implementando os dados para meu bando de dados

INSERT INTO elmasri.departamento VALUES (5, 'Pesquisa', 33344555587, '1988-05-22');

INSERT INTO elmasri.departamento VALUES (4, 'Administração', 98765432168, '1995-01-01');
	
INSERT INTO elmasri.departamento VALUES (1, 'Matriz', 88866555576, '1981-06-19');

INSERT INTO elmasri.funcionario VALUES (88866555576, 'Jorge' , 'E' , 'Brito' , ' 1937-11-10' ,'R.do Horto,35,São Paulo,SP','M',55000.00, NULL, 1);
		
INSERT INTO elmasri.funcionario VALUES (33344555587, 'Fernando' , 'T' , 'Wong' , '1955-12-08' ,'R. da Lapa,34,São Paulo,SP','M', 40000.00, 88866555576, 5);

INSERT INTO elmasri.funcionario VALUES (66688444476, 'Ronaldo' , 'K' , 'Lima' , '1962-09-15' ,'R. Rebouças,65,Piracicaba, SP','M',38000.00, 33344555587, 5);

INSERT INTO elmasri.funcionario VALUES (98765432168, 'Jennifer' , 'S' , 'Souza' , '1941-06-20' ,'Av.Art.deLima,54,SantoAndré,SP','F',43000.00, 88866555576, 4);

INSERT INTO elmasri.funcionario VALUES (12345678966, 'joão' , 'B' , 'Silva' , '1965-01-09' ,'R. das Flores,751.São Paulo,SP','M', 30000.00, 33344555587, 5);

INSERT INTO elmasri.funcionario VALUES (99988777767, 'Alice' , 'J' , 'Zelaya' , '1968-01-19' ,'R. Souza Lima,35,Curitiba,PR','F',25000.00, 98765432168, 4);

INSERT INTO elmasri.funcionario VALUES (45345345376, 'Joice' , 'A' , 'Leite' , '1972-07-31' ,'Av. Lucas Obes,74,São Paulo,SP','F',25000.00, 33344555587, 5);

INSERT INTO elmasri.funcionario VALUES (98798798733, 'André' , 'V' , 'Pereira' , '1969-03-29' ,'RuaTimbira,35,São Paulo,SP','M',25000.00, 98765432168, 4);

INSERT INTO elmasri.dependente VALUES (33344555587, 'Alicia', 'F', '1986-04-05', 'filha');
	
INSERT INTO elmasri.dependente VALUES (33344555587, 'Tiago', 'M', '1983-10-25', 'filho');
	
INSERT INTO elmasri.dependente VALUES (33344555587, 'Janaína', 'F', '1958-05-03', 'Esposa');
	
INSERT INTO elmasri.dependente VALUES (98765432168, 'Antonio', 'M', '1942-02-28', 'Marido');
	
INSERT INTO elmasri.dependente VALUES (12345678966, 'Michael', 'M', '1988-01-04', 'filho');
	
INSERT INTO elmasri.dependente VALUES (12345678966, 'Alicia', 'F', '1988-12-30', 'filha');
	
INSERT INTO elmasri.dependente VALUES (12345678966, 'Elizabeth', 'F', '1967-05-05', 'Esposa');

INSERT INTO elmasri.localizacoes_departamento VALUES (1, 'São Paulo');
	
INSERT INTO elmasri.localizacoes_departamento VALUES (4, 'Mauá');
	
INSERT INTO elmasri.localizacoes_departamento VALUES (5, 'SantoAndré');
	
INSERT INTO elmasri.localizacoes_departamento VALUES (5, 'Itu');
	
INSERT INTO elmasri.localizacoes_departamento VALUES (5, 'São Paulo');

INSERT INTO elmasri.projeto VALUES (1, 'ProdutoX', 'SantoAndré', 5);

INSERT INTO elmasri.projeto VALUES (2, 'ProdutoY', 'Itu', 5);
	
INSERT INTO elmasri.projeto VALUES (3, 'ProdutoZ', 'São Paulo', 5);
	
INSERT INTO elmasri.projeto VALUES (10, 'Informatização', 'Mauá', 4);
	
INSERT INTO elmasri.projeto VALUES (20, 'Reorganização', 'São Paulo', 1);
	
INSERT INTO elmasri.projeto VALUES (30, 'Novosbenefkios', 'Mauá', 4);

INSERT INTO elmasri.trabalha_em VALUES (12345678966, 1, 32.5);
	
INSERT INTO elmasri.trabalha_em VALUES (12345678966, 2, 7.5);
	
INSERT INTO elmasri.trabalha_em VALUES (66688444476, 3, 40.0);
	
INSERT INTO elmasri.trabalha_em VALUES (45345345376, 1, 20.0);
	
INSERT INTO elmasri.trabalha_em VALUES (45345345376, 2, 20.0);
	
INSERT INTO elmasri.trabalha_em VALUES (33344555587, 2, 10.0);
	
INSERT INTO elmasri.trabalha_em VALUES (33344555587, 3, 10.0);
	
INSERT INTO elmasri.trabalha_em VALUES (33344555587, 10, 10.0);
	
INSERT INTO elmasri.trabalha_em VALUES (33344555587, 20, 10.0);
	
INSERT INTO elmasri.trabalha_em VALUES (99988777767, 30, 30.0);
	
INSERT INTO elmasri.trabalha_em VALUES (99988777767, 10, 10.0);
	
INSERT INTO elmasri.trabalha_em VALUES (98798798733, 10, 35.0);
	
INSERT INTO elmasri.trabalha_em VALUES (98798798733, 30, 5.0);
	
INSERT INTO elmasri.trabalha_em VALUES (98765432168, 30, 20.0);
	
INSERT INTO elmasri.trabalha_em VALUES (98765432168, 20, 15.0);
	
INSERT INTO elmasri.trabalha_em VALUES (88866555576, 20, NULL);
	
-- Por fim nessa parte estarei implementando as relações entre essas tabelas que é a formação em si das FK que fará o ligamento entre as tabelas

ALTER TABLE departamento ADD CONSTRAINT funcionario_departamento_fk
FOREIGN KEY (cpf_gerente)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE dependente ADD CONSTRAINT funcionario_dependente_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE trabalha_em ADD CONSTRAINT funcionario_trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE funcionario ADD CONSTRAINT funcionario_funcionario_fk
FOREIGN KEY (cpf_supervisor)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE localizacoes_departamento ADD CONSTRAINT departamento_localizacoes_departamento_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE projeto ADD CONSTRAINT departamento_projeto_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE funcionario ADD CONSTRAINT departamento_funcionario_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE trabalha_em ADD CONSTRAINT projeto_trabalha_em_fk
FOREIGN KEY (numero_projeto)
REFERENCES projeto (numero_projeto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
