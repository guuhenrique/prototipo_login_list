import 'dart:math';
import 'package:flutter/material.dart';
import 'package:prototipo_login_list/data/dummy_colabs.dart';
import 'package:prototipo_login_list/model/colab_model.dart';

class ColabsProvider with ChangeNotifier {
  final Map<String, ColabModel> _items = {...COLABS};
  //final Map<ColabModel, List <TarefaModel>> _tarefas = {...DATA_TAREFAS};

  List<ColabModel> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  // int countTarefas(ColabModel colab){
  //   return colab.tarefas.length;
  // }

  // TarefaModel tarefaByIndex( int i, ColabModel colab ){
  //   return _tarefas.values.elementAt(i);
  // }

  //itera em um map de string, colabModel
  //retorna cada objeto do map
  ColabModel byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(ColabModel colab) {
    if (colab == null) {
      return;
    }

    if (colab.id != null &&
        colab.id.trim().isNotEmpty &&
        _items.containsKey(colab.id)) {
      _items.update(
          colab.id,
          (_) => ColabModel(
                colab.id,
                colab.nome,
                colab.cargo,
                colab.local,
              ));
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => ColabModel(
                id,
                colab.nome,
                colab.cargo,
                colab.local,
              ));
    }

    notifyListeners();
  }

  void remove(ColabModel colab) {
    if (colab != null && colab.id != null) {
      _items.remove(colab.id);
      notifyListeners();
    }
  }
}
