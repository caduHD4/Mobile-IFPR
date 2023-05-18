import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Formulario2 extends StatelessWidget {
  var keyForm = GlobalKey<FormState>();
  var mascaraCEP = MaskTextInputFormatter(mask: '#####-###');
  var mascaraEmail = MaskTextInputFormatter(mask: AutofillHints.email);
  var editorCodigo = TextEditingController();
  var editorCodigo2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: Form(
        key: keyForm,
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              maxLength: 9,
              inputFormatters: [mascaraCEP],
              decoration: InputDecoration(
                  label: Text('CEP:'), hintText: 'Informe o seu CEP.'),
              validator: (valorDigitado) {
                if (valorDigitado == null || valorDigitado.isEmpty) {
                  return 'O CEP é obrigatória';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              maxLength: 10,
              inputFormatters: [
                FilteringTextInputFormatter.deny(RegExp(r'[x-yX-Y]'))
              ],
              controller: editorCodigo,
              decoration: InputDecoration(
                  label: Text('Codigo:'), hintText: 'Informe o codigo.'),
              validator: (valorDigitado) {
                if (valorDigitado == null || valorDigitado.isEmpty) {
                  return 'O codigo é obrigatório';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              maxLength: 10,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z09]'))
              ],
              controller: editorCodigo2,
              decoration: InputDecoration(
                  label: Text('Codigo 2:'), hintText: 'Informe o codigo.'),
              validator: (valorDigitado) {
                if (valorDigitado == null || valorDigitado.isEmpty) {
                  return 'O codigo 2 é obrigatório';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              maxLength: 9,
              inputFormatters: [mascaraEmail],
              decoration: InputDecoration(
                  label: Text('E-mail:'), hintText: 'Informe o seu email.'),
              validator: (valorDigitado) {
                if (valorDigitado == null || valorDigitado.isEmpty) {
                  return 'O email é obrigatório';
                }
                return null;
              },
            ),
            ElevatedButton(
              child: Text('ok'),
              onPressed: () {
                if (keyForm.currentState!.validate()) {}
              },
            )
          ],
        ),
      ),
    );
  }
}
