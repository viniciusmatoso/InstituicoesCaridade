import 'package:flutter/material.dart';
import 'package:projeto_flutter/provider/doacoes_provider.dart';
import 'package:projeto_flutter/provider/instituicoes_provider.dart';
import 'package:projeto_flutter/views/doacoes_usuario.dart';
import 'package:provider/provider.dart';
import 'lista_instituicoes.dart';

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
      ),
    );
  }
}

