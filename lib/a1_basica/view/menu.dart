import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  Widget makeButton(String texto, Function()? funcao) {
    return ElevatedButton(
      child: Text(texto),
      onPressed: funcao,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            makeButton("Contador", () => Navigator.of(context).pushNamed("/contador")),
            makeButton("Home", () => Navigator.of(context).pushNamed("/home")),
            makeButton("Calculadora", () => Navigator.of(context).pushNamed("/calculadora")),
          ],
        ),
      ),
    );
  }
}
