import 'package:flutter/material.dart';
import 'package:manejo_archivos/providers/Answer_provider.dart';
import 'package:manejo_archivos/providers/Contador_Answers_provider.dart';
import 'package:manejo_archivos/providers/Numero_Question_provider.dart';
import 'package:provider/provider.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numeros = Provider.of<NumeroQuestion>(context, listen: false);
    final answer = Provider.of<Answer>(context, listen: false);
    final contador = Provider.of<ContadorAnswer>(context, listen: false);

    return Container(
        alignment: Alignment.bottomLeft,
        child: ButtonTheme(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          minWidth: 60,
          buttonColor: Colors.black38,
          child: RaisedButton(
            onPressed: () {
              numeros.p=0;
              answer.Ans="";
              contador.reset();
              //_Shure(context);
            },
            child: Icon(Icons.autorenew),
          ),
        ));
  }
}