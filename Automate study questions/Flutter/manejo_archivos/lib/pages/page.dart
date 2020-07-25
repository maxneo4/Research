import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ArchivoPage extends StatefulWidget {
  ArchivoPage({Key key}) : super(key: key);

  @override
  _ArchivoPageState createState() => _ArchivoPageState();
}

class _ArchivoPageState extends State<ArchivoPage> {
  String _path;
  String _fileType="txt";
  String contents;

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
            onPressed: (){
              _openFileExplorer();
            },
            color: Colors.blue,
          ),
        contents!=null? new ListTile(
            title: Text(contents),
          ):new Container()
        ],
      ),
    );
  }

  void _openFileExplorer() async {
    _path = await FilePicker.getFilePath(type: FileType.custom, allowedExtensions: [_fileType]);
      _path!=null? readCounter():null;

  }

  void readCounter() async {
    final file = await File(_path);
    // Leer el archivo
    contents = await file.readAsString();
      print(contents);
    setState(() {
      
    });
    
}

}
