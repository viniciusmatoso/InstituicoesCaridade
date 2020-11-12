import 'package:flutter/material.dart';

void main() => runApp(Cadastro());

class Cadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Cadastro de novo usuário'),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(25, 15, 25, 0),
          child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nome'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Telefone'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Senha'),
                  ),
                ],
              )
          ),
        ),
    );
  }
}