import 'package:flutter/material.dart';
import 'package:projeto_flutter/models/usuarios.dart';
import 'package:projeto_flutter/provider/usuarios_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(Cadastro());

class Cadastro extends StatelessWidget {
  final _formCadastro = GlobalKey<FormState>();
  final Map<String, String> _formData = {};


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[700],
          title: Text('Cadastro de novo usuário'),
        ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(25, 15, 25, 0),
          child: Form(
            key: _formCadastro,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nome'),
                    onSaved: (value) => _formData['nome'] = value,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Telefone'),
                    onSaved: (value) => _formData['telefone'],
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    onSaved: (value) => _formData['email'],
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Senha'),
                    onSaved: (value) => _formData['senha'],
                  ),
                  _RadioButton(

                  ),
                  Container(
                    margin: const EdgeInsets.all(16.0),
                    child: ButtonTheme(
                      minWidth: 400.0,
                      height: 50.0,
                      buttonColor: Colors.blue[700],
                      child: RaisedButton(
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blue),
                        ),
                        onPressed: (){
                          _formCadastro.currentState.save();
                          Provider.of<UsuariosProvider>(context, listen:false).put(
                            Usuario(
                              id: _formData['id'],
                              nome: _formData['nome'],
                              email: _formData['email'],
                              telefone: _formData['telefone'],
                              senha: _formData['senha'],
                              sexo: _formData[RadioButtonWidget().radioItem],
                            ),
                          );
                          Navigator.pop(context);
                        },
                        child: Text("Criar nova conta"),
                      ),
                    ),
                  ),
                ],
              ),
          ),
        ),
    );
  }
}

class _RadioButton extends StatefulWidget{
  @override
  RadioButtonWidget createState() => RadioButtonWidget();

}

class RadioButtonWidget extends State<_RadioButton> {

  String radioItem = '';

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Row(
        children: [
          Expanded(
            child: RadioListTile(
              value: 'masc',
              groupValue: radioItem,
              activeColor: Colors.blue,
              title: Text('Masculino'),
              onChanged: (newValue) {
                setState(() {
                  radioItem = newValue;
                });
              },
            ),
          ),
          Expanded(
            child: RadioListTile(
              value: 'fem',
              groupValue: radioItem,
              activeColor: Colors.blue,
              title: Text('Feminino'),
              onChanged: (newValue) {
                setState(() {
                  radioItem = newValue;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}