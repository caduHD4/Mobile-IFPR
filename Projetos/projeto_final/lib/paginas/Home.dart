import 'package:flutter/material.dart';
import 'package:projeto_final/paginas/Produto.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Catálogo'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'perfil');
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    radius: 20,
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: Image.asset('assets/Saude.png').image,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150, // altura desejada da ListView
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ListView(scrollDirection: Axis.horizontal, children: [
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    Route rota =
                        MaterialPageRoute(builder: (context) => Produto());
                    Navigator.push(context, rota);
                  },
                  child: Container(
                    width: 140,
                    margin: EdgeInsets.only(left: 16, right: 8),
                    child: Image.asset('assets/Dipirona.jpg'),
                  ),
                )),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Route rota =
                          MaterialPageRoute(builder: (context) => Produto());
                      Navigator.push(context, rota);
                    },
                    child: Container(
                      width: 140,
                      margin: EdgeInsets.only(right: 8),
                      child: Image.asset('assets/Dipirona.jpg'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Route rota =
                          MaterialPageRoute(builder: (context) => Produto());
                      Navigator.push(context, rota);
                    },
                    child: Container(
                      width: 140,
                      margin: EdgeInsets.only(right: 8),
                      child: Image.asset('assets/Dipirona.jpg'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Route rota =
                          MaterialPageRoute(builder: (context) => Produto());
                      Navigator.push(context, rota);
                    },
                    child: Container(
                      width: 140,
                      margin: EdgeInsets.only(right: 8),
                      child: Image.asset('assets/Dipirona.jpg'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Route rota =
                          MaterialPageRoute(builder: (context) => Produto());
                      Navigator.push(context, rota);
                    },
                    child: Container(
                      width: 140,
                      margin: EdgeInsets.only(right: 8),
                      child: Image.asset('assets/Dipirona.jpg'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Route rota =
                          MaterialPageRoute(builder: (context) => Produto());
                      Navigator.push(context, rota);
                    },
                    child: Container(
                      width: 140,
                      margin: EdgeInsets.only(right: 8),
                      child: Image.asset('assets/Dipirona.jpg'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Route rota =
                          MaterialPageRoute(builder: (context) => Produto());
                      Navigator.push(context, rota);
                    },
                    child: Container(
                      width: 140,
                      margin: EdgeInsets.only(right: 8),
                      child: Image.asset('assets/Dipirona.jpg'),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
