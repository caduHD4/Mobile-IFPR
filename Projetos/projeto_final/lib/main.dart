import 'package:flutter/material.dart';
import 'package:projeto_final/paginas/App.dart';

main() {
  runApp(const App());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(), // Chame a nova splash screen personalizada
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen(); // Adicione qualquer lógica adicional necessária aqui
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3)); // Defina a duração desejada da splash screen
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomeScreen()), // Navegue para a próxima tela após a splash screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/splash_image.png'), // Substitua pelo caminho da sua imagem da splash screen
            SizedBox(height: 20), // Espaçamento entre a imagem e o texto
            Text(
              'Seu texto aqui', // Substitua pelo texto desejado
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Bem-vindo à tela inicial!'),
      ),
    );
  }
}


