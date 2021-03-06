--REMOVENDO TABELAS

DROP TABLE contrato_promocao;
DROP TABLE contrato;
DROP TABLE plano_modalidade;
DROP TABLE plano;
DROP TABLE promocao;
DROP TABLE telefones_instrutor;
DROP TABLE telefones_aluno;
DROP TABLE aluno_modalidade;
DROP TABLE avaliacao;
DROP TABLE instrutor_aluno;
DROP TABLE aluno;
DROP TABLE instrutor_modalidade;
DROP TABLE instrutor;
DROP TABLE funcionario;
DROP TABLE modalidade;
DROP TABLE exercicio;
DROP TABLE aluno_exercicio;
DROP TABLE modalidade_exercicio;


--CRIANDO TABELAS
CREATE TABLE funcionario (
cpf VARCHAR2(11),
nome VARCHAR2(30),
salario FLOAT NOT NULL,
rua VARCHAR2(45),
bairro VARCHAR2(15),
cep VARCHAR2(9),
cidade VARCHAR2(25),
CONSTRAINT cpf_pk PRIMARY KEY (cpf)
);

CREATE TABLE instrutor (
cpf VARCHAR2(11),
cref VARCHAR2(11),
cpf_substituto VARCHAR(11),
CONSTRAINT cpf_instrutor_pk PRIMARY KEY (cpf),
CONSTRAINT cpf_instrutor_fk FOREIGN KEY (cpf) REFERENCES funcionario (cpf)
);

CREATE TABLE telefones_funcionario (
cpf_funcionario VARCHAR2(11),
telefone_funcionario INTEGER NOT NULL,
CONSTRAINT cpf_telefone_funcionario_pk PRIMARY KEY (cpf_funcionario, telefone_funcionario),
CONSTRAINT cpf_funcionario_tel_fk FOREIGN KEY (cpf_funcionario) REFERENCES funcionario (cpf)
);

CREATE TABLE aluno (
cpf VARCHAR2(11),
nome VARCHAR2(30),
rua VARCHAR2(45),
bairro VARCHAR2(15),
cep VARCHAR2(9),
cidade VARCHAR2(25),
CONSTRAINT cpf_aluno_pk PRIMARY KEY (cpf)
);

CREATE TABLE instrutor_aluno (
cpf_aluno VARCHAR2(11),
cpf_instrutor VARCHAR2(11),
CONSTRAINT cpf_instrutor_aluno_pk PRIMARY KEY (cpf_instrutor, cpf_aluno),
CONSTRAINT cpf_instrutor_al_fk FOREIGN KEY (cpf_instrutor) REFERENCES instrutor (cpf),
CONSTRAINT cpf_aluno_fk FOREIGN KEY (cpf_aluno) REFERENCES aluno (cpf)
);

CREATE TABLE telefones_aluno (
cpf_aluno VARCHAR2(11),
telefone_aluno INTEGER,
CONSTRAINT cpf_telefone_aluno_pk PRIMARY KEY (cpf_aluno, telefone_aluno),
CONSTRAINT cpf_aluno_tel_fk FOREIGN KEY (cpf_aluno) REFERENCES aluno (cpf)
);

CREATE TABLE avaliacao (
cpf VARCHAR2(11) NOT NULL,
altura INTEGER,
peso FLOAT(2),
quadril INTEGER,
braco_e INTEGER,
braco_d INTEGER,
abdomem INTEGER,
panturrilha INTEGER,
CONSTRAINT cpf_aluno_avaliacao_pk PRIMARY KEY (cpf),
CONSTRAINT cpf_aluno_avaliacao_fk FOREIGN KEY (cpf) REFERENCES aluno(cpf)
);

CREATE TABLE modalidade (
codigo INTEGER NOT NULL,
nome VARCHAR2(15),
cronograma VARCHAR2(30),
CONSTRAINT codigo_pk PRIMARY KEY (codigo)
);

CREATE TABLE instrutor_modalidade (
codigo_modalidade INTEGER,
cpf_instrutor VARCHAR2(11),
CONSTRAINT cpf_codigo_instrutor_pk PRIMARY KEY (codigo_modalidade, cpf_instrutor),
CONSTRAINT codigo_modalidade_instrutor_fk FOREIGN KEY (codigo_modalidade) REFERENCES modalidade(codigo),
CONSTRAINT cpf_instrutor_modalidade_fk FOREIGN KEY (cpf_instrutor) REFERENCES instrutor(cpf) 
);

CREATE TABLE aluno_modalidade (
codigo_modalidade INTEGER,
cpf_aluno VARCHAR2(11),
CONSTRAINT cpf_codigo_aluno_pk PRIMARY KEY (codigo_modalidade, cpf_aluno),
CONSTRAINT codigo_modalidade_aluno_fk FOREIGN KEY (codigo_modalidade) REFERENCES modalidade(codigo),
CONSTRAINT cpf_aluno_modalidade_fk FOREIGN KEY (cpf_aluno) REFERENCES aluno(cpf) 
);

CREATE TABLE plano (
codigo INTEGER NOT NULL,
nome VARCHAR2(15),
valor FLOAT(5),
duracao VARCHAR2(8),
CONSTRAINT codigo_plano_pk PRIMARY KEY (codigo)
);

CREATE TABLE plano_modalidade (
codigo_plano INTEGER,
codigo_modalidade INTEGER,
CONSTRAINT codigo_plano_modalidade_pk PRIMARY KEY (codigo_plano, codigo_modalidade),
CONSTRAINT codigo_plano_fk FOREIGN KEY (codigo_plano) REFERENCES plano (codigo),
CONSTRAINT codigo_modalidade_fk FOREIGN KEY (codigo_modalidade) REFERENCES modalidade (codigo)
);

CREATE TABLE promocao (
codigo INTEGER NOT NULL,
desconto FLOAT(3) NOT NULL,
CONSTRAINT codigo_promocao_pk PRIMARY KEY (codigo)
);

CREATE TABLE contrato (
cpf_aluno VARCHAR2(11),
codigo_plano INTEGER,
CONSTRAINT contrato_aluno_pk PRIMARY KEY (cpf_aluno, codigo_plano),
CONSTRAINT cpf_aluno_plano_fk FOREIGN KEY (cpf_aluno) REFERENCES aluno(cpf),
CONSTRAINT codigo_plano_aluno_fk FOREIGN KEY (codigo_plano) REFERENCES plano (codigo)
);

CREATE TABLE contrato_promocao (
cpf_aluno VARCHAR2(11),
codigo_plano INTEGER,
codigo_promocao INTEGER,
CONSTRAINT contrato_promocao_pk PRIMARY KEY (cpf_aluno, codigo_plano, codigo_promocao),
CONSTRAINT cpf_aluno_promocao_fk FOREIGN KEY (cpf_aluno) REFERENCES aluno(cpf),
CONSTRAINT codigo_plano_contratado_fk FOREIGN KEY (codigo_plano) REFERENCES plano (codigo),
CONSTRAINT codigo_promocao_contratada_fk FOREIGN KEY (codigo_promocao) REFERENCES promocao (codigo)
);

CREATE TABLE exercicio (
codigo INTEGER,
nome VARCHAR2(20),
CONSTRAINT codigo_exercicio_pk PRIMARY KEY (codigo)
);

CREATE TABLE aluno_exercicio (
cpf_aluno VARCHAR2(11),
cod_exercicio INTEGER,
CONSTRAINT cpf_aluno_exercicio_pk PRIMARY KEY (cpf_aluno, cod_exercicio),
CONSTRAINT cpf_aluno_exercicio_fk FOREIGN KEY (cpf_aluno) REFERENCES aluno (cpf),
CONSTRAINT codigo_aluno_exercicio_fk FOREIGN KEY (cod_exercicio) REFERENCES exercicio (codigo)
);

CREATE TABLE modalidade_exercicio (
cod_modalidade INTEGER,
cod_exercicio INTEGER,
CONSTRAINT modalidade_exercicio_pk PRIMARY KEY (cod_modalidade, cod_exercicio),
CONSTRAINT codigo_modalidade_exercicio_fk FOREIGN KEY (cod_modalidade) REFERENCES modalidade (codigo),
CONSTRAINT codigo_exercicio_modalidade_fk FOREIGN KEY (cod_exercicio) REFERENCES exercicio (codigo)
);


