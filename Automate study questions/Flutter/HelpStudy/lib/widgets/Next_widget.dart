import 'package:flutter/material.dart';
import 'package:manejo_archivos/providers/Contador_Answers_provider.dart';
import 'package:manejo_archivos/providers/Numero_Question_provider.dart';
import 'package:manejo_archivos/utils/show_verification_utils.dart';
import 'package:provider/provider.dart';

class NextButtons extends StatelessWidget {
  const NextButtons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numero = Provider.of<NumeroQuestion>(context);
    final contador = Provider.of<ContadorAnswer>(context);

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 60),
        child: Row(
          children: [
            RaisedButton(
              onPressed: () {
                contador.SumJumps();
                  numero.sum();
                if (ultima(context)) {
                  Navigator.popAndPushNamed(context, 'final');
                }else{
                  numero.notifi();
                }
              },
              child: Text('Saltar'),
              color: Colors.redAccent,
            ),
            Spacer(),
            RaisedButton(
              onPressed: () {
                show(context);
              },
              child: Text('Verificar'),
              color: Colors.greenAccent,
            ),
          ],
        ));
  }
}
