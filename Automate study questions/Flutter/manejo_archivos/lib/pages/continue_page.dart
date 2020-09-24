import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manejo_archivos/Widgets/all_widget.dart';
import 'package:manejo_archivos/providers/Contador_provider.dart';
import 'package:manejo_archivos/providers/Datos_provider.dart';
import 'package:manejo_archivos/providers/type_provider.dart';
import 'package:manejo_archivos/providers/url_provider.dart';
import 'package:manejo_archivos/providers/worong_provider.dart';
import 'package:manejo_archivos/utils/Continue_utils.dart';
import 'package:provider/provider.dart';

class ContinuePage extends StatelessWidget {
  const ContinuePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final url = Provider.of<Url>(context, listen: false);
    final datos = Provider.of<Datos>(context, listen: false);
    final type = Provider.of<Tipo>(context, listen: false);
    final wrong = Provider.of<Wrong>(context, listen: false);
    final cont = Provider.of<Contador>(context, listen: false);
    cont.reset();
    Continue_utils C = new Continue_utils();
    type.Ty=true;
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          FutureBuilder(
            future: url.cargar(url.mess),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.active:
                  return Container();
                case ConnectionState.waiting:
                  return Container();
                case ConnectionState.none:
                  return Container();
                case ConnectionState.done:
                  if (snapshot.data.isEmpty) {
                    return Container();
                  } else {
                    datos.all = utf8.decode(snapshot.data.runes.toList());
                    datos.cargar();
                    wrong.reset();
                    C.llenarC(context, url.pos);
                    return Container(
                      child: AllWidgets()
                    );
                  }
              }
            },
          ),
        ],
      )),
    );
  }
}
