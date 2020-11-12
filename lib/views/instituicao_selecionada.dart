import 'package:flutter/material.dart';

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
                        color: Colors.grey[800]
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
                      color: Colors.grey[700],
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

    Widget endereco_contato = Container(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Icon(
                      Icons.home,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Text(
                    'Rua: ',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
                  child: Text(
                    'Bairro: ',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
                  child: Text(
                    'Cep: ',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
                  child: Text(
                    'Cidade: ',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
                  child: Text(
                    'Estado: ',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            /*2*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Icon(
                      Icons.speaker_notes,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Text(
                    'Telefone: ' ,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
                  child: Text(
                    'Email: ' ,
                    style: TextStyle(
                      color: Colors.grey[700],
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

    return Scaffold(
        appBar: AppBar(
          title: Text('Pequeno Príncipe', style: TextStyle(
              color: Colors.white),
          ),
        ),
        body: ListView(
          children: [
            Image.asset(
                'images/instituicao.jpg',
                width: 600,
                height: 200,
                fit: BoxFit.cover,
            ),
            descricao,
            endereco_contato,
          ],
        ),
    );
  }
}
