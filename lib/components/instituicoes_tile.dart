import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/models/instituicoes.dart';
import 'package:projeto_flutter/models/usuarios.dart';

class InstituicaoTile extends StatelessWidget{
  final Instituicao instituicao;
  final Usuario usuario;
  InstituicaoTile(this.instituicao, this.usuario);


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.account_balance,
        color: Colors.blue[900],
      ),
      title: Text(
          instituicao.nome,
          style: TextStyle(
              color: Colors.blue[800],
              fontWeight: FontWeight.w700,
          )
      ),
      subtitle: Text(
          instituicao.cidade,
          style: TextStyle(
            color: Colors.blue[900],
            fontWeight: FontWeight.w700,
          )
      ),
      trailing: Container(
        width: 50,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_forward),
              color: Colors.blue[900],
              onPressed: (){
                Navigator.pushNamed(context, '/menu_usuario/instituicao', arguments: {'usuario': usuario, 'instituicao': instituicao});
              },
            )
          ],
        )
      ),

    );
  }


}