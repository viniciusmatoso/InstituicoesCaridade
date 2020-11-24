import 'package:flutter/material.dart';
import 'package:projeto_flutter/models/usuarios.dart';
import 'package:projeto_flutter/provider/usuarios_provider.dart';
import 'package:provider/provider.dart';

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
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nome'),
                      onSaved: (value) => _formData['nome'] = value,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Telefone'),
                      onSaved: (value) => _formData['telefone'] = value,
                    ),
                    _RadioButton(
                      valor: (value) => _formData['sexo'] = value,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      onSaved: (value) => _formData['email'] = value,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Senha'),
                        obscureText: true,
                        onSaved: (value) => _formData['senha'] = value,
                      ),
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
                            Provider.of<UsuariosProvider>(context, listen: false).put(
                              Usuario(
                                id: _formData['id'],
                                nome: _formData['nome'],
                                email: _formData['email'],
                                telefone: _formData['telefone'],
                                senha: _formData['senha'],
                                sexo: _formData['sexo'],
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

  final ValueChanged<String> valor;

  _RadioButton({Key key, this.valor}) : super(key: key);

  @override
  RadioButtonWidget createState(){
    return new RadioButtonWidget();
  }

}

class RadioButtonWidget extends State<_RadioButton> {

  String valor;

  String radioItem = '';

  @override
  void initState(){
    super.initState();
    radioItem = 'M';
  }

  setSelecionarSexo(String val){
    setState(() {
      radioItem = val;
    });
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Row(
        children: [
          Expanded(
            child: RadioListTile(
              value: 0,
              groupValue: radioItem,
              activeColor: Colors.blue,
              title: Text('Masculino'),
              onChanged: (value) {
                setState(() {
                  setSelecionarSexo(value);
                });
                widget.valor(value);
              },
            ),
          ),
          Expanded(
            child: RadioListTile(
              value: 1,
              groupValue: radioItem,
              activeColor: Colors.blue,
              title: Text('Feminino'),
              onChanged: (value) {
                setState(() {
                  setSelecionarSexo(value);
                  widget.valor(value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}