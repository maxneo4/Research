import 'package:flutter/material.dart';
import 'package:manejo_archivos/providers/Datos_provider.dart';
import 'package:manejo_archivos/providers/worong_provider.dart';
import 'package:provider/provider.dart';

class Questions extends StatelessWidget {
  const Questions({Key key, this.type}) : super(key: key);
  final type;
  @override
  Widget build(BuildContext context) {
    final datos = Provider.of<Datos>(context);
    final wrong = Provider.of<Wrong>(context);
    return Column(
      children: <Widget>[
        type==true?preW(context): pre(context),
      ],
    );
  }

  Widget pre(context) {
    final datos = Provider.of<Datos>(context, listen: false);
    return ListTile(
      title: Text("Pregunta "+datos.Nq+":\n"+datos.Q),
    );
  }

  Widget preW(context) {
    final wrong = Provider.of<Wrong>(context, listen: false);
    return ListTile(
      title: Text("Pregunta "+wrong.Nq+":\n"+wrong.Q),
    );
  }


}
