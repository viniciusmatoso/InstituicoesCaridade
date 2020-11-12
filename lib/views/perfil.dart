import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Seu Perfil'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(25, 15, 25, 0),
          child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(labelText: 'Nome',
                        hintText: 'Vinicius'),
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(labelText: 'Telefone',
                        hintText: '(41) 98877-6655'),
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(labelText: 'Email',
                        hintText: 'vinicius@email.com.br'),
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(labelText: 'Senha',
                        hintText: '123456'),
                  ),
                ],
              )
          ),
        ),
    );
  }
}



