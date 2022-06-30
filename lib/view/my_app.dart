import 'package:flutter/material.dart';
import 'package:pj_sw_av_flutter/view/calculadora.dart';
import 'package:pj_sw_av_flutter/view/home.dart';
import 'package:pj_sw_av_flutter/view/idade.dart';
import 'package:pj_sw_av_flutter/view/menu.dart';
import 'package:pj_sw_av_flutter/view/my_home_page.dart';

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
