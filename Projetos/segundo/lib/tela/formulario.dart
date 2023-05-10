
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Formulario extends StatelessWidget{
  var keyForm = GlobalKey<FormState>();
  var editorNome = TextEditingController();
  var editorSobrenome = TextEditingController();
  var editorIdade = TextEditingController();
  var mascaraCPF = MaskTextInputFormatter(mask: '###.###.##-##');

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Form(
        key: keyForm,
        child: Column(
          children: [
            TextFormField(
              controller: editorNome,
              decoration: InputDecoration(
                label: Text('Nome:'),
                hintText: 'Informe o seu nome.'
              ),
              validator: (valorDigitado){
                if(valorDigitado == null || valorDigitado.isEmpty){
                  return 'O nome é obrigatório';
                }
                return null;
              },
            ),
              TextFormField(
              controller: editorSobrenome,
              decoration: InputDecoration(
                  label: Text('Sobrenome:'), hintText: 'Informe o seu Sobrenome.'),
              validator: (valorDigitado) {
                if (valorDigitado == null || valorDigitado.isEmpty) {
                  return 'O sobrenome é obrigatório';
                }
                return null;
              },
            ),
              TextFormField(
              keyboardType: TextInputType.number,
              maxLength: 2,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              controller: editorIdade,
              decoration: InputDecoration(
                  label: Text('Idade:'),
                  hintText: 'Informe a sua idade.'),
              validator: (valorDigitado) {
                if (valorDigitado == null || valorDigitado.isEmpty) {
                  return 'A idade é obrigatória';
                }
                return null;
              },
            ),
              TextFormField(
              keyboardType: TextInputType.number,
              maxLength: 16,
              inputFormatters: [mascaraCPF],
              decoration: InputDecoration(
                  label: Text('CPF:'), hintText: 'Informe o seu CPF.'),
              validator: (valorDigitado) {
                if (valorDigitado == null || valorDigitado.isEmpty) {
                  return 'O CPF é obrigatória';
                }
                return null;
              },
            ),
            ElevatedButton(
              child: Text('ok'),
              onPressed: (){
                if(keyForm.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Nome: "+editorNome.text+" Sobrenome: "+editorSobrenome.text+" Idade: "+editorIdade.text))
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  } 
}