import 'package:flutter/material.dart';
import 'package:projeto_flutter/provider/usuarios_provider.dart';
import 'package:provider/provider.dart';

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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                          side: BorderSide(color: Colors.green),
                        ),
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
                      buttonColor: Colors.blue[700],
                      child: RaisedButton(
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, '/cadastro');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                          side: BorderSide(color: Colors.blue[700]),
                        ),
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

    return Scaffold(
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
    );
  }
}



