import 'package:flutter/material.dart';

import 'dart:math';

//App de frases randomicas
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

// stateless = constante
// statefull = variavel

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _frases = [
    "O medo é o caminho para o lado negro.",
    "Treine a si mesmo a deixar partir tudo que teme perder.",
    "Grande guerreiro? Guerra não faz grande ninguém.",
    "Em um estado sombrio nós nos encontramos... "
        "um pouco mais de conhecimento iluminar nosso caminho pode.",
  ];
  var _fraseGerada = "Clique abaixo para gerar uma frase!";

  void _gerarFrase() {
    // 0, 1 , 2, 3
    var numeroSorteado = Random().nextInt(_frases.length);
    setState(() {
      _fraseGerada = _frases[numeroSorteado];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Frases do Yoda',
          style: TextStyle(color: Colors.black),
        ),
        // hwx color no flutter, troco #por 0xff e a cor altera
        backgroundColor: Color(0xff21D266),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          decoration:
              // criar uma borda no body, na parte central do display
              BoxDecoration(
                  border: Border.all(width: 3, color: Color(0xff21D266))),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,

            // criei uma classe filhos para abrigar duas classe,
            //class image do logo e text para clicar e gerar as frases
            children: <Widget>[

              Image.asset('images/logo.png'),
              Text(
               _fraseGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 17,
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                ),
              ),
              ElevatedButton(
                onPressed: _gerarFrase,
                child: const Text(
                  'Nova frase',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color:Colors.lightGreen,
        child: Text('.'),
      ),
    );
  }
}
