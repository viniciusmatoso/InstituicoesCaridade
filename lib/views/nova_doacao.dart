import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:projeto_flutter/models/doacoes.dart';
import 'package:projeto_flutter/models/instituicoes.dart';
import 'package:projeto_flutter/models/usuarios.dart';
import 'package:projeto_flutter/provider/doacoes_provider.dart';
import 'package:provider/provider.dart';


class NovaDoacao extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formBrinquedo = {};

  String condicao;
  String situacao = 'Aguardando Aprovação';
  String foto;

  @override
  Widget build(BuildContext context) {

    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    final Instituicao instituicao = arguments['instituicao'];
    final Usuario usuario = arguments['usuario'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Doação', style: TextStyle(
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
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Nome do Brinquedo'),
                  style: TextStyle(
                    color: Colors.blue[900],
                  ),
                  onSaved: (value) => _formBrinquedo['nomeBrinquedo'] = value,
                ),
              ),
              _RadioButton(
                valor: (value){
                  condicao = value;
                  _formBrinquedo['condicao'] = condicao;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Center(
                  child: Text(
                    "Foto do Brinquedo",
                  ),
                ),
              ),
              _Camera(
                valor: (value){
                  foto = value;
                  _formBrinquedo['imagem'] = foto;
                },
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(40, 30, 40, 30),
                child: ButtonTheme(
                  minWidth: 400.0,
                  height: 50.0,
                  buttonColor: Colors.blue[700],
                  child: RaisedButton(
                    onPressed: (){
                      _formBrinquedo['usuario'] = usuario.email;
                      _formBrinquedo['instituicao'] = instituicao.email;
                      _form.currentState.save();
                      Provider.of<DoacoesProvider>(context, listen: false).put(
                        Doacao(
                          id: _formBrinquedo['id'],
                          nomeBrinquedo: _formBrinquedo['nomeBrinquedo'],
                          situacao: _formBrinquedo['situacao'],
                          condicao: _formBrinquedo['condicao'],
                          imagem: _formBrinquedo['imagem'],
                          usuarioEmail: _formBrinquedo['usuario'],
                          instituicaoEmail: _formBrinquedo['instituicao'],
                        ),
                      );
                      Navigator.pop(context);
                    },
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                      side: BorderSide(color: Colors.blue[700]),
                    ),
                    child: Text("Confirmar Doação"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

class _RadioButton extends StatefulWidget{

  final ValueChanged<String> valor;

  _RadioButton({Key key, this.valor}) : super(key: key);

  @override
  RadioWidget createState() => RadioWidget();

}

class RadioWidget extends State<_RadioButton>{

  String radioItem = '';

  setSelecionarCondicao(String val){
    setState(() {
      radioItem = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 20, 0, 0),
      child: Row(
        children: [
          Expanded(
            child: RadioListTile(
              value: 'Usado',
              groupValue: radioItem,
              activeColor: Colors.blue,
              title: Text('Usado'),
              onChanged: (value) {
                setState(() {
                  setSelecionarCondicao(value);
                });
              },
            ),
          ),
          Expanded(
            child: RadioListTile(
              value: 'Novo',
              groupValue: radioItem,
              activeColor: Colors.blue,
              title: Text('Novo'),
              onChanged: (value) {
                setState(() {
                  setSelecionarCondicao(value);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Camera extends StatefulWidget{

  final ValueChanged<String> valor;

  _Camera({Key key, this.valor}) : super(key: key);

  @override
  CameraState createState() => CameraState();

}

class CameraState extends State<_Camera>{

  PickedFile _imageFile;
  String _status;
  bool _imgLoading;
  ImagePicker _imagePicker;

  @override
  void initState(){
    super.initState();
    _imagePicker = ImagePicker();
    _status = '';
    _imgLoading = false;

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          null == _imageFile
            ? Container()
              : Container(
                width: 180,
                child: Image.file(
            File(_imageFile.path),
            filterQuality: FilterQuality.high,
                ),
          ),
          Text(_status),
          SizedBox(height: 20),
          _select(),
        ],
      ),
    );
  }

  _select(){
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _button(Icons.photo_camera , ImageSource.camera, Colors.blue[600]),
          SizedBox(width: 20),
          _button(Icons.photo_library, ImageSource.gallery, Colors.deepOrangeAccent)
        ],
      ),
    );
  }

  _button(IconData icone, ImageSource imageSource, Color cor){
    return Container(
      child: FlatButton(
        color: cor,
        child: Icon(icone),
        onPressed: () async{
          setState(() {
            _imgLoading = true;
            _imageFile = null;
          });
          PickedFile file = await _loadImage(imageSource);
          if(null != file) {
            setState(() {
              _imageFile = file;
              _imgLoading = false;
              _status = 'Imagem carregada';
              widget.valor(_imageFile.path);
            });
            return;
          }
          setState(() {
            _imageFile = null;
            _imgLoading = false;
            _status = 'Error';
          });
        },
      ),
    );
  }

  Future<PickedFile>_loadImage(ImageSource imageSource) async{
    PickedFile file = await _imagePicker.getImage(source: imageSource);
    if(null != file){

    }
    return file;
  }

}