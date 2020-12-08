import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/doacoes_tile.dart';
import 'package:projeto_flutter/models/doacoes.dart';
import 'package:projeto_flutter/models/usuarios.dart';
import 'package:projeto_flutter/provider/doacoes_provider.dart';
import 'package:provider/provider.dart';

class DoacoesUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    DoacoesProvider doacoes = Provider.of(context);

    final Usuario usuario = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text('Suas últimas doações', style: TextStyle(
              color: Colors.white
          ),
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
            itemBuilder: (ctx, i) => DoacoesTile(doacoes.byIndex(i), usuario),
        ),
      ),
    );
  }
}