import 'package:flutter/material.dart';
import 'package:projeto_flutter/models/doacoes.dart';

class BrinquedoSelecionado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Doacao doacao = ModalRoute.of(context).settings.arguments;

    Widget descricao = Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
        child: Column(
          children: [
            Text(
              'Nome do Brinquedo: ',
              style: TextStyle(
                backgroundColor: Colors.white,
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              doacao.nomeBrinquedo,
              style: TextStyle(
                backgroundColor: Colors.white,
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Condição: ',
                style: TextStyle(
                  backgroundColor: Colors.white,
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              doacao.condicao,
              style: TextStyle(
                backgroundColor: Colors.white,
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.w700,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Situação: ',
                style: TextStyle(
                  backgroundColor: Colors.white,
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Text(
              doacao.situacao,
              style: TextStyle(
                backgroundColor: Colors.white,
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(doacao.nomeBrinquedo, style: TextStyle(
              color: Colors.white),
          ),
        ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(
              "images/background.jpg"),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.grey.withOpacity(0.8), BlendMode.dstOut),
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Image.network(
                doacao.imagem,
                width: 200,
                height: 250,
              ),
            ),
            descricao,
          ]
        ),
      ),
    );
  }
}