
import 'package:flutter/material.dart';

import '../dto/produto.dart';


class FotoProduto extends StatelessWidget {
  final Produto produto;
  final double? raio;
  const FotoProduto({required this.produto,this.raio,Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    String url = produto.urlAvatar;
    if (Uri.tryParse(url)!.isAbsolute) {
      return CircleAvatar(
        backgroundImage: NetworkImage(url),
        radius: raio,
      );
    }else{
      return const CircleAvatar(child: Icon(Icons.person));
    }  
  }
}