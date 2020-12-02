import 'package:flutter/material.dart';

class NovaDoacao extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formBrinquedo = {};

  String condicao;

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
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Nome do Brinquedo'),
                  style: TextStyle(
                    color: Colors.blue[700],
                  ),
                  onSaved: (value) => _formBrinquedo['nomeBrinquedo'] = value,
                ),
              ),
              _RadioButton(
                valor: (value){
                  condicao = value;
                  _formBrinquedo['condicao'] = condicao;
                },
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
  RadioWidget createState() => RadioWidget();

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
              value: 'Usado',
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
              value: 'Novo',
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