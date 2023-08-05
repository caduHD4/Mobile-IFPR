import 'package:flutter/material.dart';

import '../dto/produto.dart';

class FotoProdutoHome extends StatelessWidget {
  final Produto produto;
  final double? raio;
  const FotoProdutoHome({required this.produto, this.raio, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = produto.urlAvatar;
    if (Uri.tryParse(url)!.isAbsolute) {
      return Center(
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
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
