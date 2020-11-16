import 'package:flutter/material.dart';
import 'package:projeto_flutter/provider/doacoes_provider.dart';
import 'package:projeto_flutter/views/doacoes_usuario.dart';
import 'package:provider/provider.dart';

class MenuDoacoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (ctx) => DoacoesProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: DoacoesUsuario(),
      ),
    );
  }
}

