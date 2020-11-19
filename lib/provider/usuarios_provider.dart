import 'dart:math';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/data/usuarios_exemplo.dart';
import 'package:projeto_flutter/models/usuarios.dart';

class UsuariosProvider with ChangeNotifier{
  final Map<String, Usuario> _users = {...USERS};

  List<Usuario> get all{
    return [..._users.values];
  }

  int get count{
    return _users.length;
  }

  Usuario byIndex(int i){
    return _users.values.elementAt(i);
  }

  void put(Usuario usuario){
    if(usuario==null){
      return;
    }
    final id = Random().nextDouble().toString();
    _users.putIfAbsent(id, () => Usuario(
      id: id,
      nome: usuario.nome,
      telefone: usuario.telefone,
      email: usuario.email,
      senha: usuario.senha,
      sexo: usuario.sexo,
    ));
    notifyListeners();
  }
}