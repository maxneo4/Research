import 'package:flutter/material.dart';
import 'package:manejo_archivos/providers/Data_provider.dart';
import 'package:manejo_archivos/providers/Numero_Question_provider.dart';
import 'package:manejo_archivos/utils/Saves_utils.dart';
import 'package:provider/provider.dart';

class Questions extends StatelessWidget {
  const Questions({Key key, this.type}) : super(key: key);
  final type;
  @override
  Widget build(BuildContext context) {
    final datos = Provider.of<Data>(context, listen: false);
    final numero = Provider.of<NumeroQuestion>(context);
    SaveState state = new SaveState();
    state.guardarPos(numero.p.toString());
    state.guardarPreguntas(numero.todas().join(', '));
    return Column(
      children: [
        ListTile(
          title: Text("Pregunta "+datos.Nq(numero.nq)+":\n"+datos.Q(numero.nq)),
        ),
      ],
    );
  }
}
