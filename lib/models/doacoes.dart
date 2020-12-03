import 'package:flutter/material.dart';
import 'package:projeto_flutter/models/instituicoes.dart';
import 'package:projeto_flutter/models/usuarios.dart';

class Doacao{
  final String id;
  final String nomeBrinquedo;
  final String condicao;
  final String situacao;
  final String imagem;
  final String usuarioEmail;
  final String instituicaoEmail;

  const Doacao({
    this.id,
    @required this.nomeBrinquedo,
    @required this.condicao,
    @required this.situacao,
    @required this.imagem,
    @required this.usuarioEmail,
    @required this.instituicaoEmail,
  });
}