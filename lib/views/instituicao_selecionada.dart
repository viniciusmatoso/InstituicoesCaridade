import 'package:flutter/material.dart';
import 'package:projeto_flutter/views/nova_doacao.dart';

void main() => runApp(InstituicaoSelecionada());

class InstituicaoSelecionada extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget descricao = Container(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      'Descrição',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blue[900]
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Text(
                    'Somos uma organização sem fins lucrativos e bla bla blá'
                    'bla bla blá bla bla blá bla bla blá bla bla blá bla bla blá bla bla blá bla bla blá adsad bla bla blá',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    Widget icones = Container(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 12),
      child: Row(
        children: [
          Expanded(
            child: Icon(
                Icons.home,
                color: Colors.blue[900]),
          ),
          Expanded(
            child: Icon(
                Icons.speaker_notes,
                color: Colors.blue[900]),
          )
        ],
      ),
    );

    Widget textosEnderecoContato = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 140, 0),
            child: detalhesEndereco('Rua: kkkkkkkkkkkkk', 'Bairro: ', 'Cep: ', 'Cidade: ', 'Estado: '),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 140, 65),
            child: detalhesContato('Telefone: ', 'Email: '),
          )
        ],
      ),
    );

    Widget botaoDoacao = Container(
      padding: const EdgeInsets.all(32),
      child: ButtonTheme(
        minWidth: 300.0,
        height: 50.0,
        buttonColor: Colors.blue[600],
        child: RaisedButton(
          textColor: Colors.white,
          onPressed: (){
            Navigator.push(context, new MaterialPageRoute(
                builder: (context) =>
                new NovaDoacao())
            );
          },
          child: Text("Realizar nova doação"),
        ),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('Pequeno Príncipe', style: TextStyle(
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
              Image.asset(
                  'images/instituicao.jpg',
                  width: 600,
                  height: 200,
                  fit: BoxFit.cover,
              ),
              descricao,
              icones,
              textosEnderecoContato,
              botaoDoacao,
            ],
          ),
        ),
    );
  }

  Column detalhesEndereco(String rua, String bairro, String cep, String cidade, String estado){

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8, right: 0),
          child: Text(
              rua,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
              bairro,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              )
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
              cep,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              )
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
              cidade,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              )
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
              estado,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              )
          ),
        ),
      ],
    );
  }

  Column detalhesContato(String telefone, String email){

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8, right: 0),
          child: Text(
              telefone,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              )
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
              email,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              )
          ),
        ),
      ],
    );
  }
}
