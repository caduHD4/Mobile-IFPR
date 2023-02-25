import 'package:fundamentos_dart/fundamentos_dart.dart' as fundamentos_dart;

void main(List<String> arguments) {
  int idade = 19;
  double peso = 52.5;
  String nome = 'cadu';
  String sobreNome = 'HD4';
  bool eProgamador = true;


print(idade);
print(nome);
print(nome+' '+sobreNome);

//Jeito ruim//
print("INSERT INTO pessoa (nome,sobrenome) VALUES ('"+nome+"','"+sobreNome+"')");


//Jeitos BOM D+//
print("INSERT INTO pessoa (nome,sobrenome) VALUES ('$nome','$sobreNome')");

String nomeCompleto = '$nome $sobreNome';

String teste = 'teste ${5>0}';


//Quebra de linha tipo 1//

print('\nlinha1'+
'\nlinha2'+
'\nlinha3');

//Quebra de linha tipo 2//

print('''
linha1
linha2
linha3
''');


}


