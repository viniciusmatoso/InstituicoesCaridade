import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projeto_flutter/data/doacoes_exemplo.dart';
import 'package:projeto_flutter/models/doacoes.dart';

class DoacoesProvider with ChangeNotifier{
  final Map<String, Doacao> _doacoes = {...DOACOES};

  List<Doacao> get all{
    return [..._doacoes.values];
  }

  int get count{
    return _doacoes.length;
  }

  Doacao byIndex(int i){
    return _doacoes.values.elementAt(i);
  }

  void put(Doacao doacao){
    if(doacao==null){
      return;
    }
    final id = Random().nextDouble().toString();
    _doacoes.putIfAbsent(id, () => Doacao(
      id: id,
      nomeBrinquedo: doacao.nomeBrinquedo,
      condicao: doacao.condicao,
      imagem: doacao.imagem,
    ));
  }
}