import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projeto_flutter/models/instituicoes.dart';

class GPS extends StatefulWidget {
  @override
  _Maps createState() => _Maps();
}

class _Maps extends State<GPS> {
  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    //final Instituicao instituicao = ModalRoute.of(context).settings.arguments;

    LatLng _center = LatLng(-25.415218, -49.2548741);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Localização no mapa'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.blue[600],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 18.0,
          ),
        ),
      ),
    );
  }
}
