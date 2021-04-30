import 'package:flutter/material.dart';
import 'package:prototipo_login_list/core/app_colors.dart';
import 'package:prototipo_login_list/view/list_page.dart';

class LoginPage extends StatelessWidget {

  String _usuario = "";
  String _senha = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlueApp,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //ICON
          Icon(Icons.article_outlined, size: 100, color: AppColors.darkBlueApp,),
          //USER
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.backTextField,
            ),
            margin: EdgeInsets.only(top: 45, left: 20, right: 20, bottom: 10),
            padding: EdgeInsets.all(8),

            height: 45,
            child: TextField(
              //cursorColor: Colors.white,
              decoration: InputDecoration(
                  icon: Icon(Icons.account_circle_outlined),
                  hintText: "Usuario",
                  labelStyle: TextStyle(
                      color: AppColors.backTextField,)),
              style: TextStyle(
                color: Colors.black,
                //backgroundColor: AppColors.backTextField,
              ),
              onChanged: (text){
                _usuario = text;
                print(_usuario);
              },
            ),
          ),
          //PASSWORD
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            padding: EdgeInsets.all(8),
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.backTextField,
            ),
            child: TextField(
              //cursorColor: Colors.black,
              //controller: _senha,
              obscuringCharacter: '*',
              obscureText: true,
              decoration: InputDecoration(
                  //border: InputBorder.none,
                  //focusedBorder: InputBorder.none,
                icon: Icon(Icons.vpn_key_outlined),
                  hintText: "Senha",
                  labelStyle: TextStyle(
                      color: Colors.white70,
                      backgroundColor: AppColors.backTextField)
              ),
              style: TextStyle(
                color: Colors.black,
                //backgroundColor: AppColors.backTextField,
              ),
              onChanged: (s){
                _senha = s;
              },
            ),
          ),
          //LOGIN
          GestureDetector(
            onTap: () {
              print(_usuario + _senha);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ListPage()));
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.darkBlueApp,
                border: Border.fromBorderSide(BorderSide(
                  color: Colors.black87,
                )),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: AppColors.lightBlueApp,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
