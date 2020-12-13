import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/models/doacoes.dart';
import 'package:projeto_flutter/models/usuarios.dart';

class DoacoesTile extends StatelessWidget{
  final Doacao doacao;
  final Usuario usuario;
  const DoacoesTile(this.doacao, this.usuario);


  @override
  Widget build(BuildContext context) {
    final imagem = doacao.imagem == null || doacao.imagem.isEmpty
      ? CircleAvatar(child: Image(image: AssetImage('images/sem_imagem.jpg')))
        : CircleAvatar(backgroundImage: NetworkImage(doacao.imagem));
    return ListTile(
      leading: imagem,
      title: Text(
          doacao.nomeBrinquedo,
          style: TextStyle(
            color: Colors.blue[600],
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
                  Navigator.pushNamed(context, '/menu_usuario/doacoes/brinquedo_selecionado', arguments: doacao);
                },
              )
            ],
          )
      ),

    );
  }


}