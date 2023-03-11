class Professor{
  String nome;
  String SIAPE;
  String CPF;
  String? faculdade;
  Function funcaoProfessor;

  Professor({
    required this.nome,
    required this.SIAPE,
    required this.CPF,
    this.faculdade,
    required this.funcaoProfessor});

}