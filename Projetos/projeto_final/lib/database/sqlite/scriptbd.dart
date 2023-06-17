//comando para criar tabela
const criarTabelas = [
  '''
 CREATE TABLE estado(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,sigla CHAR(2) NOT NULL
  )
''',
  '''
 CREATE TABLE cidade(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,estado_id INTEGER NOT NULL
    ,FOREIGN KEY (estado_id) REFERENCES estado (id) 
  )
''',
  '''
 CREATE TABLE grupo(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,descricao VARCHAR(200) NOT NULL
  )
''',
  '''
 CREATE TABLE endereco(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,telefone CHAR(16) NOT NULL
    ,cpf CHAR(14) NOT NULL
    ,cep CHAR(9) NOT NULL
    ,estado VARCHAR(2) NOT NULL
    ,cidade_id INTEGER NOT NULL
    ,bairro VARCHAR(200) NOT NULL
    ,rua VARCHAR(200) NOT NULL
    ,numero VARCHAR(10) NOT NULL
    ,complemento VARCHAR(200) NOT NULL
    ,FOREIGN KEY (cidade_id) REFERENCES cidade (id)
  )
''',
  '''
CREATE TABLE grupo_endereco(
    grupo_id INTEGER NOT NULL 
    ,endereco_id INTEGER NOT NULL 
    ,PRIMARY KEY (grupo_id,endereco_id) 
    ,FOREIGN KEY (grupo_id) REFERENCES endereco (id)
    ,FOREIGN KEY (endereco_id) REFERENCES endereco (id)
  )
''',
  '''
    CREATE TABLE cliente(
      id INTEGER NOT NULL PRIMARY KEY,
      nome VARCHAR(200) NOT NULL
    )
  ''',
  '''
    CREATE TABLE produto(
      id INTEGER NOT NULL PRIMARY KEY,
      nome VARCHAR(200) NOT NULL,
      preco DECIMAL(10,2) NOT NULL
    )
  ''',
  '''
  CREATE TABLE pedido (
    id INTEGER PRIMARY KEY,
    data TEXT,
    cliente_id INTEGER,
    FOREIGN KEY (cliente_id) REFERENCES cliente (id)
  )
  ''',
  '''
  CREATE TABLE pedido_produto (
    pedido_id INTEGER,
    produto_id INTEGER,
    FOREIGN KEY (pedido_id) REFERENCES pedido (id),
    FOREIGN KEY (produto_id) REFERENCES produto (id),
    PRIMARY KEY (pedido_id, produto_id)
  )
  ''',

  '''
CREATE TABLE cliente_endereco(
    cliente_id INTEGER NOT NULL,
    endereco_id INTEGER NOT NULL,
    PRIMARY KEY (cliente_id, endereco_id),
    FOREIGN KEY (cliente_id) REFERENCES cliente (id),
    FOREIGN KEY (endereco_id) REFERENCES endereco (id)
)
'''
];

const insercoes = [
  '''
INSERT INTO estado (nome, sigla)
VALUES ('PARANÁ','PR')
''',
  '''
INSERT INTO estado (nome, sigla)
VALUES ('SÃO PAULO','SP')
''',
  '''
INSERT INTO cidade (nome, estado_id)
VALUES ('PARANAVAÍ',1)
''',
  '''
INSERT INTO cidade (nome, estado_id)
VALUES ('MARINGÁ',1)
''',
  '''
INSERT INTO cidade (nome, estado_id)
VALUES ('LOANDA',1)
''',
  '''
INSERT INTO cidade (nome, estado_id)
VALUES ('LONDRINA',1)
''',
  '''
INSERT INTO grupo (nome, descricao)
VALUES ('FUTEBOL','PELADA QUARTA')
''',
  '''
INSERT INTO grupo (nome, descricao)
VALUES ('ESTUDOS MATEMÁTICA','ESTUDO QUINTA TRIGONOMETRIA')
''',
  '''
INSERT INTO grupo (nome, descricao)
VALUES ('FACULDADE','PESSOAL FACULDADE')
''',
  '''
INSERT INTO endereco (nome, telefone, cpf, cep, estado, cidade_id, bairro, rua, numero, complemento) 
VALUES ('José Pereira', '(44) 99852-8569', '931.233.300-36', '87023-000', 'Paraná', 2, 'Zona 7', 'Av. Brasil', '123', 'apto 32')
''',
  '''
INSERT INTO endereco (nome, telefone, cpf, cep, estado, cidade_id, bairro, rua, numero, complemento)
VALUES ('Marco Antonio', '(44) 99852-8569', '716.734.530-07', '89022-000', 'Paraná', 1, 'Zona 5', 'Av. Brasil', '123', 'apto 64')
''',
  '''
INSERT INTO endereco (nome, telefone, cpf, cep, estado, cidade_id, bairro, rua, numero, complemento)
VALUES ('Maria Rosa', '(44) 99852-8569', '716.734.530-07', '84023-500', 'Paraná', 3, 'Zona 8', 'Av. Brasil', '123', 'apto 68')
''',
  '''
INSERT INTO endereco (nome, telefone, cpf, cep, estado, cidade_id, bairro, rua, numero, complemento)
VALUES ('Josefina Santos', '(44) 99852-8569', '533.214.280-32', '85028-030', 'Paraná', 4, 'Zona 9', 'Av. Brasil', '123', 'apto 67')
'''
];
