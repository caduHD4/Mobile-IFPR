//comando para criar tabela
const criarEndereco = '''
 CREATE TABLE endereco(
    id INTEGER NOT NULL PRIMARY KEY
    ,nome VARCHAR(200) NOT NULL
    ,telefone CHAR(16) NOT NULL
    ,cpf CHAR(14) NOT NULL
    ,cep CHAR(9) NOT NULL
    ,estado VARCHAR(2) NOT NULL
    ,cidade VARCHAR(200) NOT NULL
    ,bairro VARCHAR(200) NOT NULL
    ,rua VARCHAR(200) NOT NULL
    ,numero VARCHAR(10) NOT NULL
    ,complemento VARCHAR(200) NOT NULL
  )
''';


const insercoesEndereco = [
  '''
INSERT INTO endereco (nome, telefone, cpf, cep, estado, cidade, bairro, rua, numero, complemento) 
VALUES ('José Pereira', '(44) 99852-8569', '931.233.300-36', '87023-000', 'Paraná', 'Maringá', 'Zona 7', 'Av. Brasil', '123', 'apto 32')
''',
  '''
INSERT INTO endereco (nome, telefone, cpf, cep, estado, cidade, bairro, rua, numero, complemento)
VALUES ('Marco Antonio', '(44) 99852-8569', '716.734.530-07', '89022-000', 'Paraná', 'Paranavaí', 'Zona 5', 'Av. Brasil', '123', 'apto 64')
''',
  '''
INSERT INTO endereco (nome, telefone, cpf, cep, estado, cidade, bairro, rua, numero, complemento)
VALUES ('Maria Rosa', '(44) 99852-8569', '716.734.530-07', '84023-500', 'Paraná', 'Loanda', 'Zona 8', 'Av. Brasil', '123', 'apto 68')
''',
'''
INSERT INTO endereco (nome, telefone, cpf, cep, estado, cidade, bairro, rua, numero, complemento)
VALUES ('Josefina Santos', '(44) 99852-8569', '533.214.280-32', '85028-030', 'Paraná', 'Londrina', 'Zona 9', 'Av. Brasil', '123', 'apto 67')
'''
];

