class A{
  final String a;
  final String b;
  final Function f;
  A({required this.a,required this.b,
  required this.f});
}

class B{
  final A a;
  final String b; 
  final Function f;
  final String c;
  B({required this.a, required this.b,required this.c, 
  required this.f});
}

void main(List<String> arguments){
  /*
  exercício 01 - criar um objeto do tipo B
  com referência anônima na interpolação da função print. 
  Defina mais que um comando para cada FN.
  → criar e entender a sintaxe de uma função anônima
  → entenda quando utilizar ";" e ","
  */

  print('${
    B(
      a: A(
        a: 'aaa',
        b: 'bbb',
        f: (){
          print("teste1");
          print("teste2");
          }
      ),
      b: 'bbb',
      c: 'jorge',
      f: (){
        var caduzinho = 1;
        var koichi = 1;
        return caduzinho + koichi;
      }
    )
  }');


  /*
  exercício 02 
  - Altere uma das FNs para utilizar Arrow Function
  */
   f: () => print("teste1");
      
/*
  objetivo:   
  - Treino da Sintaxe - Capacidade de criar objetos sem contexto;
  */
}