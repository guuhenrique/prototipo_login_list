import 'package:flutter/material.dart';
import 'package:prototipo_login_list/core/app_colors.dart';
import 'package:prototipo_login_list/providers/lista_provider.dart';
import 'package:prototipo_login_list/routes/app_routes.dart';
import 'package:prototipo_login_list/widgets_model/colab_tile.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ColabsProvider colabs = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("Colaboradores"),
          backgroundColor: AppColors.darkBlueApp,
          actions: [
            IconButton(
                iconSize: 30,
                icon: Icon(Icons.add_box_outlined),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.COLAB_CRUD);
                })
          ],
        ),
        body: Container(
            color: AppColors.lightBlueApp,
            child: Padding(
                padding: EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: colabs.count,
                  itemBuilder: (context, i) => ColabTile(colabs.byIndex(i)),
                ))));
  }
}
