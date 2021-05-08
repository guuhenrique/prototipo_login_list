import 'package:flutter/material.dart';
import 'package:prototipo_login_list/model/colab_model.dart';
import 'package:prototipo_login_list/providers/lista_provider.dart';
import 'package:prototipo_login_list/widgets_model/tarefa_tile.dart';
import 'package:provider/provider.dart';

class TarefaPage extends StatefulWidget {

  @override
  _TarefaPageState createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  ColabModel colab;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas'),
      ),
      body:
      ListView.builder(
        itemCount: colab.tarefas?.length?? 0,
        itemBuilder: (context, i) => TarefaTile(tarefamodel: colab.tarefas[i]),
    ),
    );
  }
}
