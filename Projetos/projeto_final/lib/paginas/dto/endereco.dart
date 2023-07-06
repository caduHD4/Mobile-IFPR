import 'package:projeto_final/paginas/dto/cidade.dart';

class Endereco{
  final dynamic id;
  final String nome;
  final String telefone; 
  final String cpf;
  final String cep;
  final String estado;
  final Cidade cidade;
  final String bairro;
  final String rua;
  final String numero;
  final String complemento;
  
  Endereco({
    this.id, 
    required this.nome, 
    required this.telefone, 
    required this.cpf,
    required this.cep,
    required this.estado,
    required this.cidade,
    required this.bairro,
    required this.rua,
    required this.numero,
    required this.complemento,
  });

  @override
  bool operator ==(other) => 
    other is Endereco && 
    other.nome == nome && 
    other.id == id;

  @override
  String toString() {
    return '''
      $id
      $nome 
      $telefone
      $cpf
      $cep
      $estado
      $cidade
      $bairro
      $rua
      $numero
      $complemento
    ''';
  }
}