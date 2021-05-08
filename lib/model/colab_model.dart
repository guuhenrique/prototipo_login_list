import 'package:prototipo_login_list/model/tarefa_model.dart';

class ColabModel {
   final String id;
   final String nome;
   final String cargo;
   final String local;
   final List<TarefaModel> tarefas;
   final String icon;

   ColabModel(this.id, this.nome, this.cargo, this.local, this.tarefas, [this.icon]);

}
