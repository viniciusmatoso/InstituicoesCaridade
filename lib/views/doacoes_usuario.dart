import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/doacoes_tile.dart';
import 'package:projeto_flutter/models/usuarios.dart';
import 'package:projeto_flutter/provider/doacoes_provider.dart';
import 'package:provider/provider.dart';

class DoacoesUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    DoacoesProvider doacoes = Provider.of(context);

    var doacoesFirebase = Provider.of<DoacoesProvider>(context, listen: false).doacoesFirebase;

    if(doacoesFirebase.isEmpty){
      doacoes.all;

    }

    final Usuario usuario = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text('Suas últimas doações', style: TextStyle(
              color: Colors.white
          ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.of(context).pop();
            },
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
        child: ListView.builder(
            itemCount: doacoes.count,
            itemBuilder: (ctx, i) => DoacoesTile(doacoes.byUser(i), usuario),
        ),
      ),
    );
  }
}