import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projeto_flutter/data/instituicoes_exemplo.dart';
import 'package:projeto_flutter/models/instituicoes.dart';

class Instituicoes with ChangeNotifier{
  final Map<String, Instituicao> _instituicoes = {...INSTITUICOES};

  List<Instituicao> get all{
    return [..._instituicoes.values];
  }

  int get count{
    return _instituicoes.length;
  }

  Instituicao byIndex(int i){
    return _instituicoes.values.elementAt(i);
  }

  void put(Instituicao instituicao){
    if(instituicao==null){
      return;
    }
    final id = Random().nextDouble().toString();
    _instituicoes.putIfAbsent(id, () => Instituicao(
      id: id,
      nome: instituicao.nome,
      cnpj: instituicao.cnpj,
      email: instituicao.email,
      cidade: instituicao.cidade,
      estado: instituicao.estado,
      rua: instituicao.rua,
      bairro: instituicao.bairro,
      cep: instituicao.cep,
    ));
  }
}