import 'package:flutter/material.dart';
import 'package:projeto_flutter/models/usuarios.dart';

class Perfil extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final Usuario usuario = ModalRoute.of(context).settings.arguments;

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
            child: ListView(
              children: <Widget>[
                TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(labelText: 'Nome'),
                  initialValue: usuario.nome,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(labelText: 'Telefone'),
                  initialValue: usuario.telefone,
                ),
                _RadioButton(
                  valor: (value){

                  },
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(labelText: 'Email'),
                  initialValue: usuario.email,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(labelText: 'Senha'),
                  initialValue: usuario.senha,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: ButtonTheme(
                    minWidth: 400.0,
                    height: 50.0,
                    buttonColor: Colors.blue[700],
                    child: RaisedButton(
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                      onPressed: (){

                      },
                      child: Text("Salvar"),
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
  RadioButtonWidget createState() => RadioButtonWidget();
}

class RadioButtonWidget extends State<_RadioButton>{

  String radioItem = '';

  void setSelecionarSexo(String val){
    setState(() {
      radioItem = val;
    });
  }


  Widget build(BuildContext context){

    final Usuario usuario = ModalRoute.of(context).settings.arguments;


    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Row(
          children: [
            Expanded(
              child: RadioListTile(
                value: 'M',
                groupValue: radioItem,
                activeColor: Colors.blue,
                title: Text('Masculino'),
                onChanged: (val) => {
                  setState(() {
                    setSelecionarSexo(val);
                    widget.valor(val);
                  })
                },
              ),
            ),
            Expanded(
              child: RadioListTile(
                value: 'F',
                groupValue: radioItem,
                activeColor: Colors.blue,
                title: Text('Feminino'),
                onChanged: (val){
                  setState(() {
                    setSelecionarSexo(val);
                    widget.valor(val);
                  });
                  },
              ),
            ),
          ],
      ),
    );
  }
}



