import 'package:flutter/material.dart';
import 'package:projeto_final/paginas/Login.dart';
import 'package:projeto_final/paginas/constants.dart';
import 'package:page_transition/page_transition.dart';


class Introducao extends StatelessWidget {
  const Introducao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Saude.png"),
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          Expanded(
            flex:4,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "FARMA SYSTEM\n",
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    fontSize: 16,
                                  ),
                        ),
                        TextSpan(
                          text: "A melhor farmácia online do Brasil",
                          style:
                              Theme.of(context).textTheme.headline1?.copyWith(
                                    fontSize: 24,
                                  ),
                        )
                      ],
                    ),
                  ),
                  FittedBox(
                    child: GestureDetector(
                     onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            duration: Duration(milliseconds: 150), // duração de 300 milissegundos
                            child: Login(),
                          ),
                      );
                    },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 120),
                        padding:
                            EdgeInsets.symmetric(horizontal: 36, vertical: 16),
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: kPrimaryColor,
                        ),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "COMEÇAR",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
