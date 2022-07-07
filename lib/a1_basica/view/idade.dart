import 'package:flutter/material.dart';

class CalculadoraIdade extends StatelessWidget {
  CalculadoraIdade({Key? key}) : super(key: key);

  String nome = "";
  DateTime? dataNascimento;

  int? calcularIdade(DateTime? data) {
    if (data != null) {
      var diferenca = DateTime.now().difference(data);
      return diferenca.inDays ~/ 365;
    }
  }

  void mostrarResultado(BuildContext context) {
    var res = calcularIdade(dataNascimento);

    if (res != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Resultado"),
          content: Text("Você tem $res anos, $nome"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Data inválida"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (value) => nome = value,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.date_range),
                      onPressed: () async {
                        dataNascimento = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now().subtract(const Duration(days: 365 * 150)),
                          initialDate: DateTime.now().subtract(const Duration(days: 365 * 10)),
                          lastDate: DateTime.now(),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  child: const Text("Calcular Idade"),
                  onPressed: () => mostrarResultado(context),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
