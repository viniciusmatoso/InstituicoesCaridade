import 'package:flutter/material.dart';
class Usuario {
  final String id;
  final String nome;
  final String telefone;
  final String email;
  final String sexo;
  final String senha;

  const Usuario({
    this.id,
    @required this.nome,
    @required this.telefone,
    @required this.email,
    @required this.sexo,
    @required this.senha,
});
}