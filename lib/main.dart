import 'package:flutter/material.dart';
import 'package:prototipo_login_list/providers/lista_provider.dart';
import 'package:prototipo_login_list/routes/app_routes.dart';
import 'package:prototipo_login_list/view/colab_crud.dart';
import 'package:prototipo_login_list/view/list_page.dart';
import 'package:prototipo_login_list/view/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColabsProvider(),
      child: MaterialApp(routes: {
        AppRoutes.LOGIN: (_) => LoginPage(),
        AppRoutes.LIST_PAGE: (_) => ListPage(),
        AppRoutes.COLAB_CRUD: (_) => ColabCRUD(),
      }),
    ),
  );
}
