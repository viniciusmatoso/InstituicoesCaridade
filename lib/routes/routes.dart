import 'package:flutter/material.dart';
import 'package:projeto_flutter/views/cadastro.dart';
import 'package:projeto_flutter/views/doacoes_usuario.dart';
import 'package:projeto_flutter/views/instituicao_selecionada.dart';
import 'package:projeto_flutter/views/login.dart';
import 'package:projeto_flutter/views/menu_usuario.dart';
import 'package:projeto_flutter/views/perfil.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/' : (context) => Login(),
          '/cadastro' : (context) => Cadastro(),
          '/menu_usuario' : (context) => MenuUsuario(),
          '/menu_usuario/perfil' : (context) => Perfil(),
          '/menu_usuario/instituicao' : (context) => InstituicaoSelecionada(),
          '/menu_usuario/doacoes' : (context) => DoacoesUsuario(),
        }
    );
  }
}