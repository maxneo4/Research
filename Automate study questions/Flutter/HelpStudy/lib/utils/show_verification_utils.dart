import 'package:flutter/material.dart';
import 'package:manejo_archivos/providers/Answer_provider.dart';
import 'package:manejo_archivos/providers/Contador_Answers_provider.dart';
import 'package:manejo_archivos/providers/Data_provider.dart';
import 'package:manejo_archivos/providers/Numero_Question_provider.dart';
import 'package:provider/provider.dart';

void show(context) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return type(context);
      });
}

Widget type(context) {
  final numero = Provider.of<NumeroQuestion>(context, listen: false);
  final data = Provider.of<Data>(context, listen: false);
  final answer = Provider.of<Answer>(context, listen: false);

  if (answer.Ans == '') {
    return typeEmpty(context);
  } else if (validator(answer.Ans, data.A(numero.p))) {
    return typeCorrect(context);
  } else {
    return typeIncorrect(context);
  }
}

bool validator(String res, String correcta) {
  res = res.toLowerCase().replaceAll(' ', '');
  correcta = correcta.toLowerCase().replaceAll(' ', '');

  if (res == correcta) {
    return true;
  } else {
    return false;
  }
}

bool ultima(context) {
  final numero = Provider.of<NumeroQuestion>(context, listen: false);
  int tam = numero.tam();
  if (tam == numero.p) {
    return true;
  } else {
    return false;
  }
}

Widget typeEmpty(context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 30),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: Colors.blue[100]),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Coloca una respuesta',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Reintentar'),
                color: Colors.greenAccent,
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget typeCorrect(context) {
  final numero = Provider.of<NumeroQuestion>(context, listen: false);
  final answer = Provider.of<Answer>(context, listen: false);
  final contador = Provider.of<ContadorAnswer>(context, listen: false);

  TextStyle style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  return Container(
    padding: EdgeInsets.symmetric(vertical: 30),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: Colors.blue[100]),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Correcta',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 15,
        ),
        Text('Respuesta:', style: style),
        Text(answer.Ans, style: style),
        SizedBox(
          height: 15,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  contador.SumCorrects();
                  answer.Ans = "";
                  numero.sum();
                  if (ultima(context)) {
                    Navigator.popAndPushNamed(context, 'final');
                  } else {
                    numero.notifi();
                    Navigator.pop(context);
                  }
                },
                child: Text('Siguiente'),
                color: Colors.redAccent,
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget typeIncorrect(context) {
  final numero = Provider.of<NumeroQuestion>(context, listen: false);
  final data = Provider.of<Data>(context, listen: false);
  final answer = Provider.of<Answer>(context, listen: false);
  final contador = Provider.of<ContadorAnswer>(context, listen: false);
  contador.SumIncorrects(numero.p);
  TextStyle style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  return Container(
    padding: EdgeInsets.symmetric(vertical: 30),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: Colors.blue[100]),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Error',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        SizedBox(height: 15,),
        Text('Correcta:', style: style,),
        Text(data.A(numero.p),style: style,),
        SizedBox(height: 15,),
        Text('Incorrecta:',style: style,),
        Text(answer.Ans,style: style,),
        SizedBox(height: 15,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  contador.ResIncorrects();
                  Navigator.pop(context);
                },
                child: Text('Reintentar'),
                color: Colors.greenAccent,
              ),
              Spacer(),
              RaisedButton(
                onPressed: () {
                  print('object');
                  answer.Ans = "";
                  numero.sum();
                  if (ultima(context)) {
                    Navigator.popAndPushNamed(context, 'final');
                  } else {
                    numero.notifi();
                    Navigator.pop(context);
                  }
                },
                child: Text('Siguiente'),
                color: Colors.redAccent,
              ),
            ],
          ),
        )
      ],
    ),
  );
}
