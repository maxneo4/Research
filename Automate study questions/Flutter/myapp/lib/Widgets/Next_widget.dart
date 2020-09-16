import 'package:flutter/material.dart';
import 'package:myapp/providers/Answer_provider.dart';
import 'package:myapp/providers/Contador_provider.dart';
import 'package:myapp/providers/Datos_provider.dart';
import 'package:myapp/providers/type_provider.dart';
import 'package:myapp/providers/worong_provider.dart';

import 'package:provider/provider.dart';

class Next extends StatelessWidget {
  const Next({Key key, this.type}) : super(key: key);
  final type;
  @override
  Widget build(BuildContext context) {
    final datos = Provider.of<Datos>(context, listen: false);
    final answer = Provider.of<Answer>(context, listen: false);
    final contador = Provider.of<Contador>(context, listen: false);
    final wrong = Provider.of<Wrong>(context, listen: false);
    final tipo = Provider.of<Tipo>(context, listen: false);

    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  if (tipo.Ty == false) {
                    if (datos.P.toString() == datos.cant()) {
                      contador.Jrong();
                      Navigator.pushNamed(context, "Final");
                    } else {
                      contador.Jrong();
                      datos.pos();
                      datos.notifi();
                    }
                  } else {
                    if (wrong.P.toString() == wrong.Cant) {
                      wrong.bor();
                      contador.Jrong();
                      Navigator.pushNamed(context, "Final");
                    } else {
                      wrong.B = wrong.P;
                      contador.Jrong();
                      wrong.Pos();
                      wrong.noti();
                    }
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
                  String a = type == false ? datos.A : wrong.A;
                  if (_valid(a.toString().toLowerCase(),
                      answer.answer.toString().toLowerCase())) {
                    contador.Right();
                    if (type == true) {
                      wrong.B = wrong.P;
                    }
                    type == false
                        ? _mostrarAlert(context, "Correcto")
                        : _mostrarAlertW(context, "Correcto");
                  } else {
                    if (contador.total() != datos.P) {
                      if (type == false) {
                        if (wrong.exite(datos.Nq)==true) {
                          wrong.Nq = datos.Nq;
                          wrong.Q = datos.Q;
                          wrong.A = datos.A;
                        }
                      }
                    }
                    type == false
                        ? _mostrarAlert(context, "Error")
                        : _mostrarAlertW(context, "Error");
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

  void push(context) {
    Navigator.pushNamed(context, "Final");
  }

  void _mostrarAlert(BuildContext context, String a) {
    final datos = Provider.of<Datos>(context, listen: false);
    final answer = Provider.of<Answer>(context, listen: false);
    final contador = Provider.of<Contador>(context, listen: false);

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
                      Row(
                        children: <Widget>[
                          Text("N° " + datos.P.toString()),
                        ],
                      ),
                      Text(
                        a,
                        style: TextStyle(color: Colors.red, fontSize: 25),
                      ),
                      Row(
                        children: <Widget>[
                          Text("Incorrecta:"),
                        ],
                      ),
                      Text(answer.answer),
                      Row(
                        children: <Widget>[
                          Text("Correcta:"),
                        ],
                      ),
                      Text(datos.A),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(a,
                          style: TextStyle(color: Colors.green, fontSize: 25)),
                      Text("Correcta: \t" + answer.answer),
                    ],
                  ),
            actions: <Widget>[
              RaisedButton(
                onPressed: () {
                  if (datos.P.toString() == datos.cant()) {
                    Navigator.pop(context, false);
                    Navigator.pushNamed(context, "Final");
                    push(context);
                  } else {
                    answer.notifi();
                    datos.pos();
                    datos.notifi();
                  }
                  if (a == "Error") {
                    contador.Wrong();
                  }
                  Navigator.pop(context, false);
                },
                child: Text("Siguiente"),
                color: Colors.cyan,
              ),
              SizedBox(
                width: 90,
              ),
              a == "Error"
                  ? RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Reintentar"),
                      color: Colors.green,
                    )
                  : new Container(),
            ],
          );
        });
  }

  void _mostrarAlertW(BuildContext context, String a) {
    final worn = Provider.of<Wrong>(context, listen: false);
    final answer = Provider.of<Answer>(context, listen: false);
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
                      Row(
                        children: <Widget>[
                          Text("N° " + worn.P.toString()),
                        ],
                      ),
                      Text(
                        a,
                        style: TextStyle(color: Colors.red, fontSize: 25),
                      ),
                      Row(
                        children: <Widget>[
                          Text("Incorrecta:"),
                        ],
                      ),
                      Text(answer.answer),
                      Row(
                        children: <Widget>[
                          Text("Correcta:"),
                        ],
                      ),
                      Text(worn.A),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(a,
                          style: TextStyle(color: Colors.green, fontSize: 25)),
                      Text("Correcta: \t" + answer.answer),
                    ],
                  ),
            actions: <Widget>[
              RaisedButton(
                onPressed: () {
                  if (worn.P.toString() == worn.Cant) {
                    worn.bor();
                    Navigator.pop(context, false);
                    Navigator.pushNamed(context, "Final");
                    push(context);
                  } else {
                    answer.notifi();
                    worn.Pos();
                    worn.noti();
                  }
                  Navigator.pop(context, false);
                },
                child: Text("Siguiente"),
                color: Colors.cyan,
              ),
              SizedBox(
                width: 90,
              ),
              a == "Error"
                  ? RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Reintentar"),
                      color: Colors.green,
                    )
                  : new Container(),
            ],
          );
        });
  }
}
