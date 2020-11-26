import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/data/usuarios_exemplo.dart';
import 'package:projeto_flutter/models/usuarios.dart';
import 'package:http/http.dart' as http;

class UsuariosProvider with ChangeNotifier{
  static const _baseUrl = 'https://projeto-flutter-51c3e.firebaseio.com/';
  final Map<String, Usuario> _users = {...USERS};
  final List<Usuario> usuariosFirebase = [];


  Future<List<Usuario>> get all async{
    final response = await http.get(
      "$_baseUrl/users.json?"
    );
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    extractedData.forEach((userId, userData) {
      usuariosFirebase.add(
        Usuario(
          nome: userData['nome'],
          email: userData['email'],
          telefone: userData['telefone'],
          senha: userData['senha'],
        )
      );
    });
  }

  int get count{
    return _users.length;
  }

  Usuario byIndex(int i){
    return _users.values.elementAt(i);
  }

  Future<void> put(Usuario usuario) async {
    if(usuario==null){
      return;
    }
    if(usuario.id != null && usuario.id.trim().isNotEmpty && _users.containsKey(usuario.id)){
      _users.update(usuario.id, (_) => Usuario(
        id : usuario.id,
        nome: usuario.nome,
        telefone: usuario.telefone,
        email: usuario.email,
        senha: usuario.senha,
        sexo: usuario.sexo,
      ));
    } else {
      //int i = new Random().nextInt(9999);
      final response = await http.post(
        "$_baseUrl/users.json",
        body: json.encode({
          //"id": i.toString(),
          "nome": usuario.nome,
          "telefone": usuario.telefone,
          "email": usuario.email,
          "senha": usuario.senha,
          "sexo": usuario.sexo,
        }),
      );
      final id = json.decode(response.body)['name'];
      /*_users.putIfAbsent(id, () => Usuario(
            id: id,
            nome: usuario.nome,
            telefone: usuario.telefone,
            email: usuario.email,
            senha: usuario.senha,
            sexo: usuario.sexo,
          ));*/
    }
    notifyListeners();
  }

  void remove(Usuario usuario){
    if(usuario != null && usuario.id != null){
      _users.remove(usuario.id);
      notifyListeners();
    }
  }

}