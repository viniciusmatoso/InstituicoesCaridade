import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/doacoes_tile.dart';
import 'package:projeto_flutter/provider/doacoes_provider.dart';
import 'package:projeto_flutter/views/menu_usuario.dart';
import 'package:provider/provider.dart';

import 'menu_doacoes.dart';

class DoacoesUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final DoacoesProvider doacoes = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.push(context, new MaterialPageRoute(
                  builder: (context) =>
                  new MenuUsuario())
              );
            },
          ),
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
            colorFilter: new ColorFilter.mode(Colors.grey.withOpacity(0.7), BlendMode.dstOut),
          ),
        ),
        child: ListView.builder(
            itemCount: doacoes.count,
            itemBuilder: (ctx, i) => DoacoesTile(doacoes.byIndex(i))
        ),
      ),
    );
  }
}