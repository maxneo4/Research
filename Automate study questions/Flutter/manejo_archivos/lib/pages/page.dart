import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:manejo_archivos/Widgets/Question_widget.dart';
import 'dart:io';

import 'package:manejo_archivos/providers/Datos_provider.dart';
import 'package:provider/provider.dart';

class ArchivoPage extends StatefulWidget {
  ArchivoPage({Key key}) : super(key: key);

  @override
  _ArchivoPageState createState() => _ArchivoPageState();
}

class _ArchivoPageState extends State<ArchivoPage> {
  String _path;
  String _fileType = "txt";
  String contents="Busca el archivo";
  List datos;
  bool hay=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 40.0,
          ),
          new RaisedButton(
            child: Text("Buscar Archivo"),
            onPressed: () {
              hay=false;
              _openFileExplorer();
            },
            color: Colors.blue,
          ),
          hay == false
              ? new ListTile(
                  title: Text(contents),
                )
              : Questions(),
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
    final datos = Provider.of<Datos>(context);
    try {
      final file = await File(_path);
      // Leer el archivo
      contents = await file.readAsString();
      List D=contents.split("\r\n");
      D.remove("");
      if(!D.contains("nq|q|a")){
        contents = "Archivo de Texto no valido";
      }else{
        datos.cargar=D;
        hay=true;
        print("object");
      }
      setState(() {});
    } catch (e) {
      setState(() {
        contents = "Archivo no valido";
      });
    }
  }
}

