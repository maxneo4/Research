import 'package:flutter/material.dart';
import 'package:manejo_archivos/providers/Answer_provider.dart';
import 'package:provider/provider.dart';

class Answer_widget extends StatelessWidget {
  const Answer_widget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final answer = Provider.of<Answer>(context);
    TextEditingController _text = new TextEditingController();
    return Container(
      height: 50,
      child: Container(
        child: TextField(
          controller: _text,
          decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            labelText: 'Respuesta',
          ),
          onChanged: (valor) {
            answer.answer = valor;
          },
        ),
      ),
    );

  }
}