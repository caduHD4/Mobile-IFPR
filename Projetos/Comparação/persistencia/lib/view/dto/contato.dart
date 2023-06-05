import 'package:persistencia/view/dto/cidade.dart';

class Contato{
  final dynamic id;
  final String nome;
  final String telefone; 
  final String email; 
  final String urlAvatar;
  final Cidade cidade;

  Contato({
    this.id, 
    required this.nome, 
    required this.telefone, 
    required this.email, 
    required this.urlAvatar,
    required this.cidade
  });

  @override
  String toString() {
    return '''
      $id
      $nome 
      $telefone 
      $email
      $urlAvatar
    ''';
  }
}