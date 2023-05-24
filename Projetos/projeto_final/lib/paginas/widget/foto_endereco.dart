
import 'package:flutter/material.dart';
import 'package:projeto_final/paginas/dto/endereco.dart';

class FotoEndereco extends StatelessWidget {
  final Endereco endereco;
  const FotoEndereco({required this.endereco,Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    String url = 'https://cdn-icons-png.flaticon.com/512/25/25694.png';
    return (Uri.tryParse(url)!.isAbsolute) ?
       CircleAvatar(backgroundImage: NetworkImage(url))
        : const CircleAvatar(child: Icon(Icons.person));
  }
}