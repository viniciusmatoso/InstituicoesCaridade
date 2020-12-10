import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:projeto_flutter/data/doacoes_exemplo.dart';
import 'package:projeto_flutter/models/doacoes.dart';

class DoacoesProvider with ChangeNotifier{
  //final Map<String, Doacao> _doacoes = {...DOACOES};
  static const _baseUrl = 'https://projeto-flutter-51c3e.firebaseio.com/';
  List<Doacao> doacoesFirebase = [];
  Map<String, Doacao> _doacoes = {...DOACOES};

  Future<List<Doacao>> get all async{
    final response = await http.get(
      "$_baseUrl/doacoes.json?"
    );
    final List<Doacao> loadedDoacao = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    extractedData.forEach((doacaoId, doacaoData) {
      doacoesFirebase.add(
        Doacao(
          nomeBrinquedo: doacaoData['nomeBrinquedo'],
          imagem: doacaoData['imagem'],
          situacao: doacaoData['situacao'],
          condicao: doacaoData['condicao'],
          usuarioEmail: doacaoData['usuario'],
          instituicaoEmail: doacaoData['instituicao'],
        ),
      );
    });

  }

  int get count {
    return doacoesFirebase.length;
  }

  Doacao byUser(int i){
    return doacoesFirebase.elementAt(i);
  }

  Doacao byIndex(int i){
    return _doacoes.values.elementAt(i);
  }

  Future<void> put(Doacao doacao) async{
    if(doacao==null){
      return;
    }
    if(doacao.id != null && doacao.id.trim().isNotEmpty && _doacoes.containsKey(doacao.id)){
      _doacoes.update(doacao.id, (_) => Doacao(
        nomeBrinquedo: doacao.nomeBrinquedo,
        situacao: doacao.situacao,
        condicao: doacao.condicao,
        usuarioEmail: doacao.usuarioEmail,
        instituicaoEmail: doacao.instituicaoEmail,
        imagem: doacao.imagem,
      ));
    }else{

      final response = await http.post(
        "$_baseUrl/doacoes.json",
        body: json.encode({
          "nomeBrinquedo": doacao.nomeBrinquedo,
          "imagem": doacao.imagem,
          "situacao": doacao.situacao,
          "condicao": doacao.condicao,
          "usuarioEmail": doacao.usuarioEmail,
          "instituicaoEmail": doacao.instituicaoEmail,
        }),
      );
      final id = json.decode(response.body)['name'];
    }
  }
  notifyListeners();
}