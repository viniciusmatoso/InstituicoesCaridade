import 'package:flutter/material.dart';

class BrinquedoSelecionado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

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
              'Boneca de Pano',
              style: TextStyle(
                backgroundColor: Colors.white,
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
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
              'Usado',
              style: TextStyle(
                backgroundColor: Colors.white,
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
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
              'Aguardando Aprovação...',
              style: TextStyle(
                backgroundColor: Colors.white,
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('Boneca de pano', style: TextStyle(
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
              child: Image.asset(
                'images/sem_imagem.jpg',
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