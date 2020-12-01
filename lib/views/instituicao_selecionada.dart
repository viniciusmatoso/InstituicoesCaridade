import 'package:flutter/material.dart';
import 'package:projeto_flutter/models/instituicoes.dart';
import 'package:projeto_flutter/models/usuarios.dart';
import 'package:projeto_flutter/views/nova_doacao.dart';

class InstituicaoSelecionada extends StatelessWidget {

  String nome = '';
  String rua = '';
  String bairro = '';
  String cep = '';
  String cidade = '';
  String estado = '';
  String telefone = '';
  String email = '';

  void _loadInstituicao(Instituicao instituicao){
    if(instituicao != null){
      nome = instituicao.nome;
      rua = instituicao.rua;
      bairro = instituicao.bairro;
      cep = instituicao.cep;
      cidade = instituicao.cidade;
      estado = instituicao.estado;
      telefone = instituicao.telefone;
      email = instituicao.email;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    final Instituicao instituicao = arguments['instituicao'];
    final Usuario usuario = arguments['usuario'];

    _loadInstituicao(instituicao);


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
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s',
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
          Flexible(
            child: Container(
              width: 180,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: detalhesEndereco("Rua: $rua balbla lalbllba", 'Bairro: $bairro', 'Cep: $cep', 'Cidade: $cidade', 'Estado: $estado'),
            ),
          ),
          Flexible(
            child: Container(
              width: 180,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: detalhesContato('Telefone: $telefone', 'Email: $email'),
            ),
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
            Navigator.pushNamed(context, '/menu_usuario/instituicao/nova_doacao');
          },
          child: Text("Realizar nova doação"),
        ),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(nome, style: TextStyle(
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
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
              bairro,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              )
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
              cep,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              )
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
              cidade,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              )
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
              estado,
              style: TextStyle(
                fontSize: 14,
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
                fontSize: 14,
                fontWeight: FontWeight.w400,
              )
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
              email,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              )
          ),
        ),
      ],
    );
  }
}
