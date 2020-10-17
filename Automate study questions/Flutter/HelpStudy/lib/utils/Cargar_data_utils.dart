import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manejo_archivos/providers/Data_provider.dart';
import 'package:manejo_archivos/providers/Numero_Question_provider.dart';
import 'package:manejo_archivos/utils/Saves_utils.dart';
import 'package:provider/provider.dart';

void cargar_data(BuildContext context, url, preguntas, pos) {
  final data = Provider.of<Data>(context, listen: false);
  final numeros = Provider.of<NumeroQuestion>(context, listen: false);
  showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      builder: (context) {
        return FutureBuilder(
          future: new LeerUrls().cargar(url).then((value) {
            if (value != 'error' && value != '404') {
              data.reset();
              numeros.p = 0;
              value = utf8.decode(value.runes.toList());
              List<String> respose = value.split("\r\n");
              respose.removeWhere((element) => element == '');
              data.cargar(respose, respose.first.length > 4);
              if (preguntas != "") {
                numeros.p = pos;
                numeros.deco(preguntas);
                if (numeros.tam() == (pos + 1)) {
                  Navigator.popAndPushNamed(context, 'final');
                } else {
                  Navigator.popAndPushNamed(context, 'questions');
                }
              } else {
                numeros.p = pos;
                numeros.deco(montar(data.Tam()));
                Navigator.popAndPushNamed(context, 'questions');
              }
            } else {
              Navigator.pop(context);
            }
          }),
          initialData: [],
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
                return Container();
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.none:
                return Container(child: Text("buscando"));
              case ConnectionState.done:
                if (snapshot.data == 'error' && snapshot.data == '404') {
                  return new Container(
                    child: Text(snapshot.data),
                  );
                } else {
                  return new Container();
                }
            }
          },
        );
      });
}

String montar(int Tam) {
  String Temp = '';
  for (var i = 0; i < Tam; i++) {
    Temp += i.toString();
    if (i + 1 != Tam) {
      Temp += ', ';
    }
  }
  return Temp;
}
