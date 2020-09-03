import 'package:flutter/material.dart';
import 'package:manejo_archivos/providers/Contador_provider.dart';
import 'package:manejo_archivos/providers/Datos_provider.dart';
import 'package:manejo_archivos/providers/url_provider.dart';
import 'package:manejo_archivos/providers/worong_provider.dart';
import 'package:manejo_archivos/utils/Urls_utils.dart';
import 'package:provider/provider.dart';

class ListUrl extends StatelessWidget {
  const ListUrl({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            "Lista Urls",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Divider(color: Colors.black,),
          Container(
            height: queryData.size.height - 200,
            padding: EdgeInsets.only(top: 10),
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: _list(),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            margin:
                EdgeInsets.symmetric(horizontal: queryData.size.width - 300),
            child: RaisedButton(
                color: Colors.cyanAccent,
                child: Text(
                  "Agregar Url",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "add");
                }),
          )
        ],
      ),
    );
  }

  Widget _list() {
    Urls U = new Urls();
    return FutureBuilder(
      future: U.leerUrl(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            return Container();
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.none:
            return Center(
              child: Text("no has hecho niguna convercion"),
            );
          case ConnectionState.done:
            if (snapshot.data.length==0) {
              return Center(
                child: Text("no has hecho niguna convercion"),
              );
            } else {
              return Container(
                child: ListView(
                  children: _listaItems(snapshot.data, context),
                ),
              );
            }
        }
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> snapshot, context) {
    final datos = Provider.of<Datos>(context, listen: false);
    final url = Provider.of<Url>(context, listen: false);
    final contador = Provider.of<Contador>(context, listen: false);
    final wrong = Provider.of<Wrong>(context, listen: false);
    TextStyle title=TextStyle(fontSize: 25, fontWeight: FontWeight.bold,);
    TextStyle data=TextStyle(fontSize: 20,);

    final List<Widget> urls = [];
    for (int i = 0; i < snapshot.length; i += 2) {
      final Temp = Container(
        margin: EdgeInsets.only(bottom: 25),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: RaisedButton(
            color: Colors.white,
            child: Column(
              children: [
                Text(snapshot[i],style: data,),
                Text("url", style: title,),
                Text(snapshot[i + 1]),
              ],
            ),
            onLongPress: (){
              _mostrarAlert(context, snapshot[i]);
            },
            onPressed: () {
              contador.reset();
              datos.reset();
              wrong.reset();
              url.mess=snapshot[i + 1];
              Navigator.pushNamed(context, "Url");
            }),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            border: Border.all(),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  offset: Offset(2.0, 10.0))
            ]),
      );
      urls.add(Temp);
    }
    return urls;
  }

  void _mostrarAlert(BuildContext context, String a) {
    Urls U = new Urls();
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            content: ListTile(
              title: Text("Desea eliminar?", textAlign: TextAlign.center,),
              subtitle: Text(a,textAlign: TextAlign.center),
            ),
            actions: <Widget>[
              RaisedButton(
                onPressed: () {
                  U.borrarUrl(a);
                  Navigator.pushNamed(context, "listurl");
                },
                child: Text("Si"),
                color: Colors.red,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: Text("No"),
                color: Colors.cyan,
              ),
            ],
          );
        });
  }

}
