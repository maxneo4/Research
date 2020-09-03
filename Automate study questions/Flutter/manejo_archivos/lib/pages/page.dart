import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:manejo_archivos/providers/Contador_provider.dart';
import 'dart:io';

import 'package:manejo_archivos/providers/Datos_provider.dart';
import 'package:manejo_archivos/providers/type_provider.dart';
import 'package:manejo_archivos/providers/worong_provider.dart';
import 'package:manejo_archivos/utils/Marchivo_utils.dart';
import 'package:manejo_archivos/utils/validar_utils.dart';
import 'package:provider/provider.dart';

class ArchivoPage extends StatefulWidget {
  ArchivoPage({Key key}) : super(key: key);

  @override
  _ArchivoPageState createState() => _ArchivoPageState();
}

class _ArchivoPageState extends State<ArchivoPage> {
  String _path;
  String _fileType = "txt";
  String contents = "Busca el archivo";
  List datos;
  bool ur = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 100),
          child: Column(
            children: <Widget>[Text("Help", style: TextStyle(fontSize: 40))],
          ),
        ),
        buttons(),
      ]),
    );
  }

  Widget buttons() {
    final datos = Provider.of<Datos>(context);
    final contador = Provider.of<Contador>(context, listen: false);
    final tipo = Provider.of<Tipo>(context, listen: false);
    final wrong = Provider.of<Wrong>(context, listen: false);

    return Container(
      padding: EdgeInsets.only(top: 50),
      child: Column(
        children: <Widget>[
          new RaisedButton(
            child: Text(
              "Buscar Archivo",
              style: TextStyle(fontSize: 15),
            ),
            onPressed: () {
              contador.reset();
              datos.reset();
              wrong.reset();
              tipo.Ty = false;
              _openFileExplorer();
            },
            color: Colors.cyan,
          ),
          new RaisedButton(
            child: Text(
              "Buscar Archivo Url",
              style: TextStyle(fontSize: 15),
            ),
            onPressed: () {
              contador.reset();
              datos.reset();
              wrong.reset();
              tipo.Ty = false;
              Navigator.pushNamed(context, "listurl");
              setState(() {});
            },
            color: Colors.cyan,
          ),
        ],
      ),
    );
  }

  void _openFileExplorer() async {
    try {
      _path = await FilePicker.getFilePath(
          type: FileType.custom, allowedExtensions: [_fileType]);
      _path != null ? readCounter() : null;
    } catch (e) {
      setState(() {
        contents = "Archivo no valido";
      });
    }
  }

  void readCounter() async {
    ValidateNq V = new ValidateNq();
    final datos = Provider.of<Datos>(context, listen: false);
    try {
      final file = await File(_path);
      // Leer el archivo
      contents = await file.readAsString();
      List D = contents.split("\r\n");
      D.remove("");
      if (V.valida(D[0])) {
        datos.all = contents;
        datos.cargar();
        Navigator.pushNamed(context, "Ques");
      } else {
        MarchivoAlert(context);
      }
      setState(() {});
    } catch (e) {
      setState(() {
        contents = "Archivo no valido";
      });
    }
  }
}
