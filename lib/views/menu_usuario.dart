import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/instituicoes_tile.dart';
import 'package:projeto_flutter/models/usuarios.dart';
import 'package:projeto_flutter/provider/instituicoes_provider.dart';
import 'package:projeto_flutter/views/perfil.dart';
import 'package:provider/provider.dart';
import 'doacoes_usuario.dart';
import 'instituicao_selecionada.dart';
import 'menu_doacoes.dart';

class MenuUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (ctx) => Instituicoes(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Menu(),
        routes: {
          '/menu_usuario/perfil': (context) => Perfil(),
          '/menu_usuario/instituicao' : (context) => InstituicaoSelecionada(),
          '/menu_usuario/doacoes' : (context) => DoacoesUsuario(),
        },
      ),
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Instituicoes inst = Provider.of(context);

    final Usuario usuario = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text('Instituições de Caridade', style: TextStyle(
              color: Colors.white
          ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/menu_usuario/perfil');
              },
            ),
            IconButton(
              icon: Icon(
                Icons.storage,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                    new MenuDoacoes())
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              onPressed: (){

              },
            )
          ],
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
            itemCount: inst.count,
            itemBuilder: (ctx, i) => InstituicaoTile(inst.byIndex(i)),
          ),
        )
    );
  }
}

