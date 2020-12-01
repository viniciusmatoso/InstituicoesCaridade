import 'package:flutter/material.dart';

class NovaDoacao extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formBrinquedo = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Doação', style: TextStyle(
            color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(
              "images/background.jpg"),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.grey.withOpacity(0.8), BlendMode.dstOut),
          ),
        ),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Nome do Brinquedo'),
                  onSaved: (value) => _formBrinquedo['nomeBrinquedo'] = value,
                ),
              ),
              _RadioButton(

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
  RadioWidget createState(){
    return new RadioWidget();
  }

}

class RadioWidget extends State<_RadioButton>{

  String radioItem = '';

  setSelecionarCondicao(String val){
    setState(() {
      radioItem = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 20, 0, 0),
      child: Row(
        children: [
          Expanded(
            child: RadioListTile(
              value: 0,
              groupValue: radioItem,
              activeColor: Colors.blue,
              title: Text('Usado'),
              onChanged: (value) {
                setState(() {
                  setSelecionarCondicao(value);
                });
              },
            ),
          ),
          Expanded(
            child: RadioListTile(
              value: 1,
              groupValue: radioItem,
              activeColor: Colors.blue,
              title: Text('Novo'),
              onChanged: (value) {
                setState(() {
                  setSelecionarCondicao(value);
                });
              },
            ),
          ),
        ],
      ),
    );

  }

}