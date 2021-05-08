import 'package:flutter/material.dart';
import 'package:prototipo_login_list/model/colab_model.dart';
import 'package:prototipo_login_list/model/tarefa_model.dart';

class TarefaTile extends StatelessWidget {

  final TarefaModel tarefamodel;

  const TarefaTile({Key key, this.tarefamodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(tarefamodel == null? "não encontrado" : tarefamodel.titulo),
      ),
    );
  }
}
