class Pessoa {
  String nome;
  String sobrenome;
  String idade;

  Pessoa({required this.nome, required this.sobrenome, required this.idade});

  @override
  String toString() {
    return "Nome: $nome $sobrenome, Idade: $idade";
  }
}
