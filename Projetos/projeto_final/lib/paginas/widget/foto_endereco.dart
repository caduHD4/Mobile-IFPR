import 'package:flutter/material.dart';
import 'package:projeto_final/paginas/dto/endereco.dart';

class FotoEndereco extends StatelessWidget {
  final Endereco endereco;
  const FotoEndereco({required this.endereco, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url =
        'https://i.pinimg.com/originals/b3/cc/d5/b3ccd57b054a73af1a0d281265b54ec8.jpg';
    return (Uri.tryParse(url)!.isAbsolute)
        ? CircleAvatar(backgroundImage: NetworkImage(url))
        : const CircleAvatar(child: Icon(Icons.person));
  }
}
