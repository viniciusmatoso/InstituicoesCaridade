import 'package:flutter/material.dart';
import 'package:projeto_flutter/models/usuarios.dart';
import 'package:projeto_flutter/provider/usuarios_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(Login());

class Login extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};


  @override
  Widget build(BuildContext context) {
    Provider.of<UsuariosProvider>(context, listen: false).all;
    var usuarios = Provider.of<UsuariosProvider>(context, listen: false).usuariosFirebase;

    Widget LoginAndButtons = Container(
      padding: const EdgeInsets.all(32),
      child: Form(
        key: _form,
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
                    child: TextFormField(
                      //controller: email,
                      onSaved: (value) => _formData['email'] = value,
                      validator: (value){
                        if(value.isEmpty){
                          return 'Email é obrigatório!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Digite seu email",
                          contentPadding: EdgeInsets.fromLTRB(110.0, 20.0, 110.0, 0),
                      ),
                    ),
                  ),
                  Container(
                    child: TextFormField(
                      //controller: senha,
                      onSaved: (value) => _formData['senha'] = value,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Senha é obrigatória!';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          hintText: "Digite sua senha",
                          contentPadding: EdgeInsets.fromLTRB(110.0, 20.0, 110.0, 0),
                      ),
                      obscureText: true,
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
                              if(_form.currentState.validate()){
                                _form.currentState.save();
                                for(int i = 0; i < usuarios.length; i++){
                                  if(_formData['email'] == usuarios[i].email && _formData['senha'] == usuarios[i].senha){

                                    Navigator.pushNamed(context, '/menu_usuario', arguments: usuarios[i]);
                                  }
                                }

                              }
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
                      ),
                  ),
                ],
              ),
            ),
          ],
        ),
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



