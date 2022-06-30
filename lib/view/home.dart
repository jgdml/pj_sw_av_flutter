import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String nome = "";

  void dialogo(String msg, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(msg),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              onChanged: (value) => nome = value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Nome"),
                hintText: "Digite seu nome",
              ),
            ),
            ElevatedButton(
              child: const Text("Mudar"),
              onPressed: () {
                dialogo("Seu nome é $nome", context);
              },
            ),
            Text(
              "Hello World $nome",
              style: const TextStyle(fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
