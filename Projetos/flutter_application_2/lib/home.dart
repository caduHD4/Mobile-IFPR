import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  const Home({super.key});


  @override
  Widget build(BuildContext context) {
    return Container( //pai
      color: Colors.yellow,
      child: Container( //filho
        color: Colors.green,
        child: Container( //neto
          color: Colors.red,
        )
      )
    );
  }
}
