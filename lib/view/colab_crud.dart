import 'package:flutter/material.dart';
import 'package:prototipo_login_list/core/app_colors.dart';
import 'package:prototipo_login_list/model/colab_model.dart';
import 'package:prototipo_login_list/model/tarefa_model.dart';
import 'package:prototipo_login_list/providers/lista_provider.dart';
import 'package:provider/provider.dart';

class ColabCRUD extends StatefulWidget {
  @override
  _ColabCRUDState createState() => _ColabCRUDState();
}

class _ColabCRUDState extends State<ColabCRUD> {
  final _form = GlobalKey<FormState>();

  final Map<dynamic, dynamic> _formData = {};

  void _loadFormData(ColabModel colab) {
    if (colab != null) {
      _formData['id'] = colab.id;
      _formData['nome'] = colab.nome;
      _formData['cargo'] = colab.cargo;
      _formData['local'] = colab.local;
      _formData['tarefas'] = colab.tarefas;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final ColabModel colab = ModalRoute.of(context).settings.arguments;
    _loadFormData(colab);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlueApp,
        title: Text('Formulário de Usuário'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final isValid = _form.currentState.validate();

                if (isValid) {
                  _form.currentState.save();
                  Provider.of<ColabsProvider>(context, listen: false)
                      .put(ColabModel(
                    _formData['id'],
                    _formData['nome'],
                    _formData['cargo'],
                    _formData['local'],
                    // _formData['tarefas']
                    [
                      TarefaModel(
                          id: 1,
                          titulo: 'sei la',
                          descricao: 'aaaa',
                          status: false)
                    ],
                  ));

                  Navigator.of(context).pop();
                }
              })
        ],
      ),
      body: Container(
        color: AppColors.lightBlueApp,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Form(
            key: _form,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.backTextField,
                  ),
                  margin:
                      EdgeInsets.only(top: 45, left: 20, right: 20, bottom: 10),
                  padding: EdgeInsets.all(8),
                  height: 45,
                  child: TextFormField(
                    initialValue: _formData['nome'],
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Nome Inválido';
                      }
                      if (value.trim().length < 3) {
                        // ignore: missing_return
                        return 'Nome muito pequeno. Min 3 letras';
                      }
                      return null;
                    },
                    onSaved: (value) => _formData['nome'] = value,
                    decoration: InputDecoration(
                        icon: Icon(Icons.account_circle_outlined),
                        hintText: "Usuario",
                        labelStyle: TextStyle(
                          color: AppColors.backTextField,
                        )),
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nome Inválido';
                    }
                    if (value.trim().length < 3) {
                      // ignore: missing_return
                      return 'Nome muito pequeno. Min 3 letras';
                    }
                    return null;
                  },
                  initialValue: _formData['cargo'],
                  onSaved: (value) => _formData['cargo'] = value,
                  decoration: InputDecoration(labelText: 'Cargo'),
                ),
                TextFormField(
                  initialValue: _formData['local'],
                  onSaved: (value) => _formData['local'] = value,
                  decoration: InputDecoration(labelText: 'Local'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
