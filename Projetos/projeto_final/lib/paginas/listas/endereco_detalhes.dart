import 'package:flutter/material.dart';
import 'package:projeto_final/paginas/dto/endereco.dart';
import 'package:projeto_final/paginas/widget/foto_endereco.dart';
import 'package:url_launcher/url_launcher.dart';

class EnderecoDetalhes extends StatelessWidget {
  const EnderecoDetalhes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Endereco endereco =
        ModalRoute.of(context)?.settings.arguments as Endereco;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Endereço')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              Center(
                child: Container(
                  width: 80.0,
                  height: 80.0,
                  child: FotoEndereco(endereco: endereco),
                ),
              ),
              const SizedBox(height: 20.0),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Nome',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  endereco.nome,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(
                  'Telefone',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  launchUrl(Uri(
                      scheme: 'tel',
                      path: endereco.telefone));
                },
                subtitle: Text(endereco.telefone),
              ),
              ListTile(
                leading: Icon(Icons.credit_card),
                title: Text(
                  'CPF',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  endereco.cpf,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text(
                  'CEP',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  endereco.cep,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.location_city),
                title: Text(
                  'Estado',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  endereco.estado,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Bairro',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  endereco.bairro,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.location_city),
                title: Text(
                  'Rua',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  endereco.rua,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.format_list_numbered),
                title: Text(
                  'Número',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  endereco.numero,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
              ListTile(
                leading: Icon(Icons.add_location),
                title: Text(
                  'Complemento',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  endereco.complemento,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
