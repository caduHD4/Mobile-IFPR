import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String primeiroValor = "0";
  double? resultado;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              child: Text("${primeiroValor}", style:  TextStyle(fontSize: 35),)),
          Divider(thickness: 2,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilledButton(child: Text(primeiroValor != "0" ? "C" : "AC", style: TextStyle (fontSize: 25),),
                  onPressed: () {
                setState(() {
                  primeiroValor = "0";
                });
                  },
                  style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(70, 70)))),
              FilledButton(child: Icon(Icons.backspace),
                  onPressed: () {
                setState(() {
                  primeiroValor = primeiroValor.substring(0, primeiroValor.length - 1);
                  if(primeiroValor.length == 0){
                    primeiroValor = "0";
                  }

                });

                  },
                  style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(70, 70)))),
              FilledButton(child: Text("%",style: TextStyle (fontSize: 25),),  onPressed: () {},
                  style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(70, 70)))),
              FilledButton(child: Text("/",style: TextStyle (fontSize: 25),),  onPressed: () {},
                  style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(70, 70)))),
            ],
          ),
          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilledButton(child: Text("7",style: TextStyle (fontSize: 25),),
                  onPressed: () {
                    setState(() {
                      if(primeiroValor == "0") {
                        primeiroValor = "7";
                      } else {
                        primeiroValor += "7";
                      }
                    });
                  },
                  style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(70, 70)))),
              FilledButton(child: Text("8",style: TextStyle (fontSize: 25),),
                  onPressed: () {
                    setState(() {
                      if(primeiroValor == "0") {
                        primeiroValor = "8";
                      } else {
                        primeiroValor += "8";
                      }
                    });
                  },
                  style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(70, 70)))),
              FilledButton(child: Text("9",style: TextStyle (fontSize: 25),),
                  onPressed: () {
                    setState(() {
                      if(primeiroValor == "0") {
                        primeiroValor = "9";
                      } else {
                        primeiroValor += "9";
                      }
                    });
                  },
                  style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(70, 70)))),
              FilledButton(child: Text("X",style: TextStyle (fontSize: 25),),  onPressed: () {},
                  style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(70, 70)))),
            ],
          ),
          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilledButton(child: Text("4",style: TextStyle (fontSize: 25),),
                  onPressed: () {
                    setState(() {
                      if(primeiroValor == "0") {
                        primeiroValor = "4";
                      } else {
                        primeiroValor += "4";
                      }
                    });
                  },
                  style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(70, 70)))),
              FilledButton(child: Text("5",style: TextStyle (fontSize: 25),),
                  onPressed: () {
                    setState(() {
                      if(primeiroValor == "0") {
                        primeiroValor = "5";
                      } else {
                        primeiroValor += "5";
                      }
                    });
                  },
                  style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(70, 70)))),
              FilledButton(child: Text("6",style: TextStyle (fontSize: 25),),
                  onPressed: () {
                    setState(() {
                      if(primeiroValor == "0") {
                        primeiroValor = "6";
                      } else {
                        primeiroValor += "6";
                      }
                    });
                  },
                  style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(70, 70)))),
              FilledButton(child: Text("-",style: TextStyle (fontSize: 25),),
                  onPressed: () {
                  setState(() {
                    if(validaUltimoOperador() != true) {
                      primeiroValor = primeiroValor.substring(0, primeiroValor.length - 1);
                    }
                    primeiroValor += "-";
                });}
                  ,
                  style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(70, 70)))),
            ],
          ),
          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilledButton(child: Text("1",style: TextStyle (fontSize: 25),),
                  onPressed: () {
                setState(() {
                  if(primeiroValor == "0") {
                    primeiroValor = "1";
                  } else {
                    primeiroValor += "1";
                  }
                });
                  },
                  style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(70, 70)))),
              FilledButton(child: Text("2",style: TextStyle (fontSize: 25),),
                  onPressed: () {
                    setState(() {
                      if(primeiroValor == "0") {
                        primeiroValor = "2";
                      } else {
                        primeiroValor += "2";
                      }
                    });
                  },
                  style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(70, 70)))),
              FilledButton(child: Text("3",style: TextStyle (fontSize: 25),),
                  onPressed: () {
                    setState(() {
                      if(primeiroValor == "0") {
                        primeiroValor = "3";
                      } else {
                        primeiroValor += "3";
                      }
                    });
                  },
                  style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(70, 70)))),
              FilledButton(child: Text("+",style: TextStyle (fontSize: 25),),
                  onPressed: () {
                setState(() {
                  if(validaUltimoOperador() != true) {
                    primeiroValor = primeiroValor.substring(0, primeiroValor.length - 1);
                  }
                  primeiroValor += "+";

                });
                  },
                  style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(70, 70)))),
            ],
          ),
          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FilledButton(child: Text("🤓",style: TextStyle (fontSize: 25),),  onPressed: () {},
                  style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(70, 70)))),
              FilledButton(child: Text("0",style: TextStyle (fontSize: 25),),
                  onPressed: () {
                    setState(() {
                      if(primeiroValor != "0") {
                        primeiroValor += "0";
                      }
                    });
                  },
                  style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(70, 70)))),
              FilledButton(child: Text(",",style: TextStyle (fontSize: 25),),
                  onPressed: () {
                setState(() {
                  if(!primeiroValor.contains(",")){
                    primeiroValor += ",";
                  }

                });

                  },
                  style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(70, 70)))),
              FilledButton(child: Text("=",style: TextStyle (fontSize: 25),),
                  onPressed: () {
                setState(() {
                  List<String> aux = primeiroValor.split(RegExp("[+]|[-]|[x]|[/]"));
                  double operacao = 0;
                  aux.forEach((element){
                    operacao += double.parse(element.replaceAll(",", "."));
                  });
                  primeiroValor = operacao.toString().replaceAll(".", ",");
                });
                  },
                  style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(70, 70)))),
            ],
          ),
          SizedBox(height: 22,),


        ],
      ),
    );
  }
    bool validaUltimoOperador() {
    if(primeiroValor.substring(primeiroValor.length - 1) != "+"
    && primeiroValor.substring(primeiroValor.length - 1) != "-"
    && primeiroValor.substring(primeiroValor.length - 1) != "x"
    && primeiroValor.substring(primeiroValor.length - 1) != "/"
    && primeiroValor.substring(primeiroValor.length - 1) != "%") {
    return true;
    }

    return false;
    }
}


