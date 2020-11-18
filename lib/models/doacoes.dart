import 'package:flutter/material.dart';

class Doacao{
  final String id;
  final String nomeBrinquedo;
  final String condicao;
  final String situacao;
  final String imagem;

  const Doacao({
    this.id,
    @required this.nomeBrinquedo,
    @required this.condicao,
    @required this.situacao,
    @required this.imagem
  });
}