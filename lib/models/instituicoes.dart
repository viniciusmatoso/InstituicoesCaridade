import 'package:flutter/material.dart';

class Instituicao{

  final String id;
  final String nome;
  final String email;
  final String telefone;
  final String cnpj;
  final String rua;
  final String bairro;
  final String cep;
  final String cidade;
  final String estado;
  final String foto;
  final String descricao;
  //final double latitude;
  //final double longitude;

  const Instituicao({
    this.id,
    @required this.nome,
    @required this.email,
    @required this.telefone,
    @required this.cnpj,
    @required this.rua,
    @required this.bairro,
    @required this.cep,
    @required this.cidade,
    @required this.estado,
    @required this.foto,
    @required this.descricao,
    //@required this.latitude,
    //@required this.longitude,
});
}