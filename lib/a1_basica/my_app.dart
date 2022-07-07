import 'package:flutter/material.dart';
import 'view/calculadora.dart';
import 'view/home.dart';
import 'view/idade.dart';
import 'view/menu.dart';
import 'view/my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/idade",
      routes: {
        "/": (context) => Menu(),
        "/contador": (context) => MyHomePage(title: "Contador"),
        "/home": (context) => Home(),
        "/calculadora": (context) => Calculadora(),
        "/idade": (context) => CalculadoraIdade(),
      },
    );
  }
}
