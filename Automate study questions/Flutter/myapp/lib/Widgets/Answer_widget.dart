import 'package:flutter/material.dart';
import 'package:myapp/providers/Answer_provider.dart';
import 'package:myapp/providers/Datos_provider.dart';
import 'package:myapp/providers/worong_provider.dart';

import 'package:provider/provider.dart';

class Answer_widget extends StatelessWidget {
  const Answer_widget({Key key, this.type}) : super(key: key);
  final type;
  @override
  Widget build(BuildContext context) {
    final answer = Provider.of<Answer>(context);
    final datos = Provider.of<Datos>(context);
    final wrong = Provider.of<Wrong>(context);
    TextEditingController _text = new TextEditingController();
    return Container(
        child: TextField(
          textInputAction: TextInputAction.newline,
          minLines: 1,
          maxLines: 5,
          controller: _text,
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            labelText: 'Respuesta',
            counterText: type==true?wrong.P.toString()+"/"+wrong.Cant: datos.P.toString()+"/"+datos.cant()
          ),
          onChanged: (valor) {
            answer.answer = valor;
          },
        ),
    );
  }
}
