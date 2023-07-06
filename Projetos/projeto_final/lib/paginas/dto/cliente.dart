class Cliente {
  final dynamic id;
  final String nome;
  final String cpf;

  Cliente({this.id, required this.nome, required this.cpf});

  @override
  bool operator ==(other) =>
      other is Cliente && other.nome == nome && other.id == id;

  @override
  String toString() {
    return '''
      $id
      $nome 
      $cpf
    ''';
  }
}
