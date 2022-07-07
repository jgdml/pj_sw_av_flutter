import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ListaTarefa extends StatefulWidget {
  const ListaTarefa({Key? key}) : super(key: key);

  @override
  State<ListaTarefa> createState() => _ListaTarefaState();
}

class _ListaTarefaState extends State<ListaTarefa> {
  Future<List<Map<String, dynamic>>> buscar() async {
    var dbPath = join(await getDatabasesPath(), "db.db");

    var db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute("""
          CREATE TABLE TAREFA(
            ID INTEGER PRIMARY KEY,
            NOME TEXT NOT NULL,
            DESCRICAO TEXT NOT NULL
          );
        """);

        await db.execute("INSERT INTO TAREFA(NOME, DESCRICAO) VALUES ('TAREFA 1', 'DESCRICAO 1')");
        await db.execute("INSERT INTO TAREFA(NOME, DESCRICAO) VALUES ('TAREFA 2', 'DESCRICAO 2')");
        await db.execute("INSERT INTO TAREFA(NOME, DESCRICAO) VALUES ('TAREFA 3', 'DESCRICAO 3')");
      },
    );

    List<Map<String, dynamic>> dados = await db.query("TAREFA");

    return dados;
  }

  void deleteAll() async {
    var dbPath = join(await getDatabasesPath(), "db.db");

    var db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute("""
          CREATE TABLE TAREFA(
            ID INTEGER PRIMARY KEY,
            NOME TEXT NOT NULL,
            DESCRICAO TEXT NOT NULL
          );
        """);

        await db.execute("INSERT INTO TAREFA(NOME, DESCRICAO) VALUES ('TAREFA 1', 'DESCRICAO 1')");
        await db.execute("INSERT INTO TAREFA(NOME, DESCRICAO) VALUES ('TAREFA 2', 'DESCRICAO 2')");
        await db.execute("INSERT INTO TAREFA(NOME, DESCRICAO) VALUES ('TAREFA 3', 'DESCRICAO 3')");
      },
    );

    await db.rawDelete('DELETE FROM TAREFA');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: deleteAll,
          )
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: buscar(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var dados = snapshot.data!;

              return ListView.builder(
                itemCount: dados.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(dados[index]["NOME"]),
                    subtitle: Text(dados[index]["DESCRICAO"]),
                  ),
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await Navigator.of(context).pushNamed("/form");
          setState(() {});
        },
      ),
    );
  }
}
