import 'package:flutter/material.dart';
import 'package:prototipo_login_list/blocs/lista_bloc.dart';
import 'package:prototipo_login_list/core/app_colors.dart';
import 'package:prototipo_login_list/model/colab_model.dart';
import 'package:prototipo_login_list/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ColabTile extends StatelessWidget {
  final ColabModel colab;

  const ColabTile(this.colab);

  @override
  Widget build(BuildContext context) {
    final icon = colab.icon == null || colab.icon.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(colab.icon));
    return ListTile(
              leading: icon,
              title: Text(
                '${colab.nome} - ${colab.cargo}',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              subtitle: Text(colab.local),
              trailing: Container(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                        color: Colors.black26,
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoutes.COLAB_CRUD,
                          arguments: colab);
                        }),
                    IconButton(icon: Icon(Icons.delete), onPressed: () {
                      showDialog(context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Excluir Colaborador'),
                            content: Text('Tem Certeza?'),
                            actions: [
                              TextButton(onPressed: (){
                                Provider.of<ColabsProvider>(context, listen: false).remove(colab);
                                Navigator.of(context).pop();
                              },
                                  child: Text('SIM')),
                              TextButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('NÃO'))
                            ],
                          ));
                    }),
                  ],
                ),
              ),
            );
  }
}
