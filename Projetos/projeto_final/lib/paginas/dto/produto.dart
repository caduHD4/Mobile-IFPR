class Produto {
  final dynamic id;
  final String urlAvatar;
  final String nome;
  final String descricao;
  final double preco;

  Produto(
      {required this.id,
      required this.urlAvatar,
      required this.nome,
      required this.descricao,
      required this.preco});

        @override
  bool operator ==(other) => 
    other is Produto && 
    other.nome == nome && 
    other.id == id;

  @override
  String toString() {
    return '''
      $id
      $nome 
      $urlAvatar 
      $descricao
    ''';
  }
}
