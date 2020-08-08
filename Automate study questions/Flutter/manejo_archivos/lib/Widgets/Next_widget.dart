import 'package:flutter/material.dart';
import 'package:manejo_archivos/providers/Answer_provider.dart';
import 'package:manejo_archivos/providers/Contador_provider.dart';
import 'package:manejo_archivos/providers/Datos_provider.dart';
import 'package:provider/provider.dart';

class Next extends StatelessWidget {
  const Next({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final datos = Provider.of<Datos>(context, listen: false);
    final answer = Provider.of<Answer>(context, listen: false);
    final contador = Provider.of<Contador>(context, listen: false);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  if (datos.P.toString() == datos.cant()) {
                    contador.Jrong();
                    Navigator.pushNamed(context, "Final");
                  } else {
                    contador.Jrong();
                    datos.pos();
                    datos.notifi();
                  }
                },
                child: Text("Saltar"),
                color: Colors.red,
              ),
              SizedBox(
                width: 60,
              ),
              RaisedButton(
                onPressed: () {
                  if (_valid(datos.A.toString().toLowerCase(),
                      answer.answer.toString().toLowerCase())) {
                    contador.Right();
                    _mostrarAlert(context, "Correcto");
                  } else {
                    if (contador.total() != datos.P) {
                      contador.Wrong();
                    }
                    _mostrarAlert(context, "Error");
                  }
                },
                child: Text("Verificar"),
                color: Colors.cyan,
              ),
            ],
          )
        ],
      ),
    );
  }

  bool _valid(String A, String B) {
    List<String> a = A.trim().split(" ");
    List<String> b = B.trim().split(" ");
    int t = a.length;
    if (a.length > b.length || b.length > a.length) {
      return false;
    }

    for (int i = 0; i < t; i++) {
      if (a[i] != b[i]) {
        return false;
      }
    }

    return true;
  }

  void _mostrarAlert(BuildContext context, String a) {
    final datos = Provider.of<Datos>(context, listen: false);
    final answer = Provider.of<Answer>(context, listen: false);
    final cont = Provider.of<Contador>(context, listen: false);
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            content: a == "Error"
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        a,
                        style: TextStyle(color: Colors.red, fontSize: 25),
                      ),
                      Text("Incorrecta: " + answer.answer),
                      Text("Correcta: " + datos.A),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(a,
                          style: TextStyle(color: Colors.green, fontSize: 25)),
                      Text("Correcta: " + answer.answer),
                    ],
                  ),
            actions: <Widget>[
              a == "Error"
                  ? RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Reintentar"),
                      color: Colors.green,
                    )
                  : new Container(),
              SizedBox(
                width: 90,
              ),
              RaisedButton(
                onPressed: () {
                  if (datos.P == datos.cant()) {
                    Navigator.pushNamed(context, "Final");
                  } else {
                    answer.notifi();
                    datos.pos();
                    datos.notifi();
                  }
                  Navigator.of(context).pop();
                },
                child: Text("Siguiente"),
                color: Colors.cyan,
              ),
            ],
          );
        });
  }
}
