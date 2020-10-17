import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:manejo_archivos/providers/Data_provider.dart';
import 'package:manejo_archivos/providers/Numero_Question_provider.dart';
import 'package:manejo_archivos/utils/Cargar_data_utils.dart';
import 'package:manejo_archivos/utils/Saves_utils.dart';
import 'package:provider/provider.dart';

String _path;
String _fileType = "txt";

void openFileExplorer(context) async {
  try {
    _path = await FilePicker.getFilePath(
        type: FileType.custom, allowedExtensions: [_fileType]);
    _path != null ? readCounter(context, _path, 0, "") : null;
  } catch (e) {}
}

void readCounter(context, String Path, pos, preguntas) async {
  try {
    final data = Provider.of<Data>(context, listen: false);
    final numeros = Provider.of<NumeroQuestion>(context, listen: false);
    final file = await File(Path);
    SaveState state = new SaveState();
    // Leer el archivo
    String value = await file.readAsString();
    //value = utf8.decode(value.runes.toList());
    List<String> respose = value.split("\r\n");
    respose.removeWhere((element) => element == '');
    data.cargar(respose, respose.first.length > 4);
    if (preguntas != "") {
      numeros.p = pos;
      numeros.deco(preguntas);
      if(numeros.tam()==(pos+1)){
       Navigator.popAndPushNamed(context, 'final');
      }else{
        Navigator.popAndPushNamed(context, 'questions');
      }
    } else {
      numeros.p=0;
      numeros.deco(montar(data.Tam()));
      state.guardarName(Path.split("/").last, Path, "Archivo");
      Navigator.popAndPushNamed(context, 'questions');
    }

    
  } catch (e) {
    print(e);
  }
}
