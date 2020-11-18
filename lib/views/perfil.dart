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
                    decoration: InputDecoration(labelText: 'Nome')
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(labelText: 'Telefone'),
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(labelText: 'Senha'),
                  ),
                  _RadioButton(),
                ],
              )
          ),
        ),
    );
  }
}

class _RadioButton extends StatefulWidget{
  @override
  RadioButtonWidget createState() => RadioButtonWidget();
}

class RadioButtonWidget extends State<_RadioButton>{

  String radioItem = 'fem';

  Widget build(BuildContext context){
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
                onChanged: (val){
                  setState(() {
                    radioItem = val;
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
                onChanged: (val){
                  setState(() {
                    radioItem = val;
                  });
                  },
              ),
            ),
          ],
      ),
    );
  }
}



