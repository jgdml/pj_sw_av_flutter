import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FormTarefa extends StatelessWidget {
  FormTarefa({Key? key}) : super(key: key);

  String nome = "";
  String descricao = "";

  Future<void> salvar({required String nome, required String descricao, int? id}) async {
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

    if (id == null) {
      await db.rawInsert("INSERT INTO TAREFA(NOME, DESCRICAO) VALUES(?, ?)", [nome, descricao]);
    } else {
      await db.rawUpdate("UPDATE TAREFA SET NOME = ?, DESCRICAO = ? WHERE ID = ?", [nome, descricao, id]);
    }
  }

  bool checarValores() {
    if (nome.isNotEmpty && descricao.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastrar Tarefa"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                onChanged: (value) => nome = value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Nome da Tarefa"),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                onChanged: (value) => descricao = value,
                decoration: const InputDecoration(
                  label: Text("Descrição da Tarefa"),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Salvar"),
                onPressed: () async {
                  if (checarValores()) {
                    await salvar(nome: nome, descricao: descricao);
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("O nome e descrição não podem ser vazios")),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
