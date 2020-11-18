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
              'Nome do Brinquedo',
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
                'Novo',
                style: TextStyle(
                  backgroundColor: Colors.white,
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Brinquedo mt bom em ótimo estado pois é novo brinquedo bom demais eh isso',
                style: TextStyle(
                  backgroundColor: Colors.white,
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('Brinquedo tal', style: TextStyle(
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
                'images/addfoto.png',
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