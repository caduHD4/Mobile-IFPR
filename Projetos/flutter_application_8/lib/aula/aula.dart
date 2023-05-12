// método assíncrono
/*aula função assícrona;
await, async, Future, delayed, Duration (onde e quando utilizar).ArgumentError*/
/*executa o segundo quando termina a primeira (sincrona)*/

main() async{
  print('abre a página');
  await buscarDados();
  print('carrega os botões');
  print('carrega os campos');
  print('carrega as imagens');
}

Future buscarDados () async {
  await Future.delayed(Duration(seconds:5), ()=> print ('carrega os dados'));
}