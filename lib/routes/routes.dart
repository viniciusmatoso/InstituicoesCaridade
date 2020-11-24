import 'package:flutter/material.dart';
import 'package:projeto_flutter/provider/usuarios_provider.dart';
import 'package:projeto_flutter/views/cadastro.dart';
import 'package:projeto_flutter/views/login.dart';
import 'package:projeto_flutter/views/menu_usuario.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UsuariosProvider(),
      child: MaterialApp(
          initialRoute: '/',
          routes:<String, WidgetBuilder> {
            '/' : (context) => Login(), //
            '/cadastro' : (context) => Cadastro(),
            '/menu_usuario' : (context) => MenuUsuario(),
          },
      ),
    );
  }
}