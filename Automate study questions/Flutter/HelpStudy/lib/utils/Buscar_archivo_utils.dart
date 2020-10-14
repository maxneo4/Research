import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:manejo_archivos/providers/Data_provider.dart';
import 'package:manejo_archivos/providers/Numero_Question_provider.dart';
import 'package:manejo_archivos/utils/Cargar_data_utils.dart';
import 'package:provider/provider.dart';

String _path;
String _fileType = "txt";

void openFileExplorer(context) async {
  try {
    _path = await FilePicker.getFilePath(
        type: FileType.custom, allowedExtensions: [_fileType]);
    _path != null ? readCounter(context) : null;
  } catch (e) {}
}

void readCounter(context) async {
  try {
    final data = Provider.of<Data>(context, listen: false);
  final numeros = Provider.of<NumeroQuestion>(context, listen: false);
    final file = await File(_path);
    // Leer el archivo
    String value = await file.readAsString();
    //value = utf8.decode(value.runes.toList());
    List<String> respose = value.split("\r\n");
    respose.removeWhere((element) => element == '');
    data.cargar(respose, respose.first.length > 4);
    numeros.deco(montar(data.Tam()));
    Navigator.popAndPushNamed(context, 'questions');
  } catch (e) {
    print(e);
  }
}
