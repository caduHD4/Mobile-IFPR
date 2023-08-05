import 'package:flutter/material.dart';

import '../dto/produto.dart';

class FotoProdutoDetalhes extends StatelessWidget {
  final Produto produto;
  final double? raio;
  const FotoProdutoDetalhes({required this.produto, this.raio, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = produto.urlAvatar;
    if (Uri.tryParse(url)!.isAbsolute) {
      return Center(
        child: Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(url),
            ),
          ),
        ),
      );
    } else {
      return const CircleAvatar(child: Icon(Icons.person));
    }
  }
}
