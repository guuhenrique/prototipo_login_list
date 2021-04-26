import 'package:flutter/material.dart';
import 'package:prototipo_login_list/view/list_page.dart';

class LoginPage extends StatelessWidget {

  String _usuario = "";
  String _senha = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.article_outlined, size: 100, color: Colors.white30,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey,
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
                      color: Colors.white70,)),
              style: TextStyle(
                color: Colors.black,
                backgroundColor: Colors.blueGrey,
              ),
              onChanged: (text){
                _usuario = text;
                print(_usuario);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            padding: EdgeInsets.all(8),
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey,
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
                      backgroundColor: Colors.blueGrey)
              ),
              style: TextStyle(
                color: Colors.black,
                backgroundColor: Colors.blueGrey,
              ),
              onChanged: (s){
                _senha = s;
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              print(_usuario + _senha);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ListPage()));
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
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
                      color: Colors.white,
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
