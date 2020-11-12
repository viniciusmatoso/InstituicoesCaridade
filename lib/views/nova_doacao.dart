import 'package:flutter/material.dart';

class NovaDoacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Nova Doação', style: TextStyle(
              color: Colors.white),
          ),
        )
    );
  }
}