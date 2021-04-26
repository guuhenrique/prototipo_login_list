import 'package:flutter/material.dart';
import 'package:prototipo_login_list/model/colab_model.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<ColabModel> colab =[
    ColabModel("Igor","CEO","Toodoo SP",Icon(Icons.account_box_outlined)),
    ColabModel("Thiago", "CPO", "Toodoo SP",Icon(Icons.account_box_outlined)),
    ColabModel("Gustavo", "Trainee", "Toodoo MG",Icon(Icons.account_box_outlined))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        color: Colors.deepPurple,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(child: ListView.builder(
              itemCount: colab.length,
              itemBuilder: (context, index) {
            return ListTile(
              title: Text(colab[index].nome, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),),
              subtitle: Text(colab[index].cargo),
              leading: colab[index].icon,
              trailing: Text(colab[index].local),
              tileColor: Colors.deepPurple,
              selectedTileColor: Colors.deepPurpleAccent,

            );
          })),
        ),
      ),
    );
  }
}
