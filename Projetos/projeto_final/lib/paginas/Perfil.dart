import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              radius: 50,
              child: CircleAvatar(
                radius: 48,
                backgroundImage: Image.asset('assets/Saude.png').image,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Endereços'),
            onTap: () {
              // lógica de logout
              Navigator.pushNamed(context, 'endereco_lista');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {
              Navigator.pushNamed(context, 'config');
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Sobre'),
            onTap: () {
              Navigator.pushNamed(context, 'sobre');
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
              // lógica de logout
              Navigator.pushNamed(context, 'login');
            },
          ),
          const Divider(
            thickness: 2,
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Clientes'),
            onTap: () {
              Navigator.pushNamed(context, 'cliente_lista');
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_searching),
            title: const Text('Estados'),
            onTap: () {
              Navigator.pushNamed(context, 'estado_lista');
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: const Text('Cidades'),
            onTap: () {
              Navigator.pushNamed(context, 'cidade_lista');
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Pedidos'),
            onTap: () {
              Navigator.pushNamed(context, 'pedido_lista');
            },
          ),
          ListTile(
            leading: const Icon(Icons.production_quantity_limits),
            title: const Text('Produto'),
            onTap: () {
              Navigator.pushNamed(context, 'produto_lista');
            },
          ),
        ],
      ),
    );
  }
}
