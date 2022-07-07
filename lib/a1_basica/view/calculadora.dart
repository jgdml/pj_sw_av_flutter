import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({Key? key}) : super(key: key);

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String expressao = "";

  var caracteres = "123456789+-*/=X".split("");

  Widget fazerBotaoCalculadora(String texto, Function()? func) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        child: Text(texto, style: TextStyle(fontSize: 26)),
        onPressed: func,
      ),
    );
  }

  void calcular() {
    var parser = Parser();
    var resultado = parser.parse(expressao).evaluate(EvaluationType.REAL, ContextModel());
    setState(() {
      expressao = resultado.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: Text(
                  expressao,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 32),
                ),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.blue), borderRadius: BorderRadius.circular(5)),
              ),
            ),
            Expanded(
              flex: 10,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                  ),
                  itemCount: caracteres.length,
                  itemBuilder: (context, index) {
                    if (index == caracteres.length - 1) {
                      return fazerBotaoCalculadora(caracteres[index], () {
                        setState(() {
                          expressao = "";
                        });
                      });
                    }
                    if (index == caracteres.length - 2) {
                      return fazerBotaoCalculadora(caracteres[index], calcular);
                    }

                    return fazerBotaoCalculadora(caracteres[index], () {
                      setState(() {
                        expressao += caracteres[index];
                      });
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
