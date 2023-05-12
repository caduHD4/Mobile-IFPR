class Contato{
  dynamic id;
  String? nome;
  String? telefone;
  String? email;
  String? URLAvatar;

  Contato();

  Contato.dados({
    this.id,
    this.nome,
    this.telefone,
    this.email,
    this.URLAvatar
  });

  @override
  String toString(){
    return '''
      $nome
      $telefone
      $email
      $URLAvatar
    ''';
  }

}