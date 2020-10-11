import 'package:flutter/material.dart';
import 'package:manejo_archivos/providers/Answer_provider.dart';
import 'package:manejo_archivos/providers/Data_provider.dart';
import 'package:manejo_archivos/providers/Numero_Question_provider.dart';
import 'package:provider/provider.dart';

class Field extends StatelessWidget {
  const Field({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _text = new TextEditingController();
    final data = Provider.of<Data>(context, listen: false);
    final numeros = Provider.of<NumeroQuestion>(context);
    final answer = Provider.of<Answer>(context, listen: false);
    _text.text=answer.Ans;
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
            counterText: (numeros.p+1).toString()+"/"+data.Tam().toString()
          ),
          onChanged: (valor) {
            answer.Ans = valor;
          },
        ),
    );
  }
}