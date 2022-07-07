import 'package:flutter/material.dart';
import 'package:pj_sw_av_flutter/a2_crud_ex/form_tarefa.dart';
import 'package:pj_sw_av_flutter/a2_crud_ex/lista_tarefa.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      initialRoute: "/",
      routes: {
        "/": (context) => ListaTarefa(),
        "/form": (context) => FormTarefa(),
      },
    );
  }
}
