import 'package:flutter/material.dart';

void main() => runApp(Login());

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget LoginAndButtons = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                  padding: const EdgeInsets.only(bottom: 18),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Digite seu email",
                        contentPadding: EdgeInsets.fromLTRB(110.0, 20.0, 0, 0)
                    ),
                  ),
                ),
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Digite sua senha",
                        contentPadding: EdgeInsets.fromLTRB(110.0, 20.0, 0, 0)
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: ButtonTheme(
                      minWidth: 400.0,
                      height: 50.0,
                      buttonColor: Colors.green,
                      child: RaisedButton(
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, '/menu_usuario');
                        },
                        child: Text("Login"),
                      ),
                    )
                ),
                Container(
                    margin: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                    child: ButtonTheme(
                      minWidth: 400.0,
                      height: 50.0,
                      buttonColor: Colors.blue[900],
                      child: RaisedButton(
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, '/cadastro');
                        },
                        child: Text("Cadastre-se"),
                      ),
                    )
                )
              ],
            ),
          ),
          /*3*/
        ],
      ),
    );

    return MaterialApp(
      home: Scaffold(
          body: ListView(
            children: [
              Image.asset(
                'images/doe.png',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              LoginAndButtons,
            ],
          )
      ),
    );
  }
}



