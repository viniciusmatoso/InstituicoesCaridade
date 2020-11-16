import 'package:flutter/material.dart';

class NovaDoacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget textoTopo = Container(
      height: 100,
      child: Center(
          child: Text(
            'Realize sua doação para nossa instituição ',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20,
              color: Colors.blue[900],
              backgroundColor: Colors.blue[100],
            ),
          ),
        ),
      );

    return Scaffold(
        appBar: AppBar(
          title: Text('Nova Doação', style: TextStyle(
              color: Colors.white),
          ),
        ),
      body: ListView(
        children: [
          textoTopo,
        ],
      ),
    );
  }
}