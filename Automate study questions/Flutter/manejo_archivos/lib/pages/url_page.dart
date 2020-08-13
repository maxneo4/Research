import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:manejo_archivos/Widgets/all_widget.dart';
import 'package:manejo_archivos/providers/Datos_provider.dart';
import 'package:manejo_archivos/providers/url_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;


class Urlpage extends StatefulWidget {
  Urlpage({Key key}) : super(key: key);

  @override
  _UrlpageState createState() => _UrlpageState();
}

class _UrlpageState extends State<Urlpage> {
  String _u = "";
  String a = "Buscar archivo";

  @override
  Widget build(BuildContext context) {
    final datos = Provider.of<Datos>(context, listen: false);
    final url = Provider.of<Url>(context, listen: false);

    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          body: ListView(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.url,
                focusNode: FocusNode(canRequestFocus: false),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  hintText: 'Url',
                  labelText: 'Url',
                ),
                onChanged: (value) {
                  _u = value;
                },
              ),
              Container(
                child: RaisedButton(
                  onPressed: () {
                    a = "";
                    datos.reset();
                    url.mess = "";
                    setState(() {});
                  },
                  child: Text("Buscar Txt"),
                ),
              ),
              a == "Buscar archivo"
                  ? new Container(
                      child: Text(a),
                    )
                  : cual(_u)
            ],
          ),
        ));
  }

  Widget cual(String a) {
    final datos = Provider.of<Datos>(context, listen: false);

    if (datos.Hay) {
      return allw();
    } else {
      return future(a);
    }
  }

  Widget future(String a) {
    final url = Provider.of<Url>(context, listen: false);
    final datos = Provider.of<Datos>(context, listen: false);

    return FutureBuilder(
        future: url.cargar(a),
        builder: (context, asyncSnapshot) {
          switch (asyncSnapshot.connectionState) {
            case ConnectionState.active:
              return Container();
            case ConnectionState.waiting:
              datos.reset();
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.none:
              return Container(child: Text("buscando"));
            case ConnectionState.done:
              if (asyncSnapshot.data == "Link no Funciona") {
                return Container(
                  child: Text("Tipo de Dato no funciona"),
                );
              } else {
                datos.all = utf8.decode(asyncSnapshot.data.runes.toList());
                datos.cargar();
                return Container(
                  child: AllWidgets(),
                );
              }
          }
          return Container(
            child: Text("buscando"),
          );
        });
  }

  Widget allw() {
    return AllWidgets();
  }
}
