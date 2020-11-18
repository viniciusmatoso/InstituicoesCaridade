import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_flutter/models/doacoes.dart';
import 'package:projeto_flutter/views/brinquedo_selecionado.dart';

class DoacoesTile extends StatelessWidget{
  final Doacao doacao;
  const DoacoesTile(this.doacao);

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
      subtitle: Text(
          doacao.condicao,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return BrinquedoSelecionado();
                    }),
                  );
                },
              )
            ],
          )
      ),

    );
  }


}