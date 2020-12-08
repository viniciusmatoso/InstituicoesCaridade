import 'package:flutter/material.dart';
import 'package:projeto_flutter/components/instituicoes_tile.dart';
import 'package:projeto_flutter/models/usuarios.dart';
import 'package:projeto_flutter/provider/instituicoes_provider.dart';
import 'package:projeto_flutter/views/brinquedo_selecionado.dart';
import 'package:projeto_flutter/views/nova_doacao.dart';
import 'package:projeto_flutter/views/perfil.dart';
import 'package:provider/provider.dart';
import 'doacoes_usuario.dart';
import 'instituicao_selecionada.dart';

class MenuUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Usuario usuario = ModalRoute.of(context).settings.arguments;

    return ChangeNotifierProvider(
      create: (ctx) => Instituicoes(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Menu(usuario),
        routes: {
          '/menu_usuario/perfil': (context) => Perfil(),
          '/menu_usuario/instituicao' : (context) => InstituicaoSelecionada(),
          '/menu_usuario/instituicao/nova_doacao' : (context) => NovaDoacao(),
          '/menu_usuario/doacoes' : (context) => DoacoesUsuario(),
          '/menu_usuarios/doacoes/brinquedo_selecionado' : (context) => BrinquedoSelecionado(),
        },
      ),
    );
  }
}

class Menu extends StatelessWidget {
  Menu(this.usuario);
  final Usuario usuario;

  @override
  Widget build(BuildContext context) {

    final Instituicoes inst = Provider.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Instituições', style: TextStyle(
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
                Navigator.pushNamed(context, '/menu_usuario/perfil', arguments: usuario);
              },
            ),
            IconButton(
              icon: Icon(
                Icons.storage,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/menu_usuario/doacoes', arguments: usuario);
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
            itemBuilder: (ctx, i) => InstituicaoTile(inst.byIndex(i), usuario),
          ),
        )
    );
  }
}

