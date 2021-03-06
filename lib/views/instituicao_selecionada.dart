import 'package:flutter/material.dart';
import 'package:projeto_flutter/models/instituicoes.dart';
import 'package:projeto_flutter/models/usuarios.dart';

class InstituicaoSelecionada extends StatelessWidget {

  String nome = '';
  String rua = '';
  String bairro = '';
  String cep = '';
  String cidade = '';
  String estado = '';
  String telefone = '';
  String email = '';
  String descricao = '';
  String foto = '';

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
      descricao = instituicao.descricao;
      foto = instituicao.foto;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    final Instituicao instituicao = arguments['instituicao'];
    final Usuario usuario = arguments['usuario'];

    _loadInstituicao(instituicao);


    Widget descricaoTela = Container(
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
                    '$descricao',
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
              child: detalhesEndereco("Rua: $rua", 'Bairro: $bairro', 'Cep: $cep', 'Cidade: $cidade', 'Estado: $estado'),
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

    Widget gps = Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Center(
        child: TextButton(
          child: Text(
            "Ver no maps",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          onPressed: (){
            Navigator.pushNamed(context, '/menu_usuario/instituicao/gps', arguments: instituicao);
          },
        ),
      ),
    );

    Widget botaoDoacao = Container(
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 32),
      child: ButtonTheme(
        minWidth: 300.0,
        height: 50.0,
        buttonColor: Colors.blue[600],
        child: RaisedButton(
          textColor: Colors.white,
          onPressed: (){
            Navigator.pushNamed(context, '/menu_usuario/instituicao/nova_doacao', arguments: {'usuario': usuario, 'instituicao': instituicao});
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
              Image.network(
                  '$foto',
                  width: 600,
                  height: 200,
                  fit: BoxFit.cover,
              ),
              descricaoTela,
              icones,
              textosEnderecoContato,
              gps,
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
