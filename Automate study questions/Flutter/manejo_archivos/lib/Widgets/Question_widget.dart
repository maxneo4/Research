import 'package:flutter/material.dart';
import 'package:manejo_archivos/providers/Datos_provider.dart';
import 'package:provider/provider.dart';

class Questions extends StatelessWidget {
  const Questions({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        pre(context)
      ],
    );
  }

  Widget pre(context) {

    final datos = Provider.of<Datos>(context);

    return ListTile(
      title: Text("Pregunta "+datos.Nq+":\n"+datos.Q),
    );
  }

}
