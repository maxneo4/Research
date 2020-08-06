import 'package:flutter/material.dart';
import 'package:manejo_archivos/Widgets/Answer_widget.dart';
import 'package:manejo_archivos/Widgets/Next_widget.dart';
import 'package:manejo_archivos/Widgets/Question_widget.dart';

class AllWidgets extends StatelessWidget {
  const AllWidgets({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          child: Column(
        children: <Widget>[
          Questions(),
          SizedBox(
            height: 30,
          ),
          Answer_widget(),
          SizedBox(
            height: 30,
          ),
          Next(),
        ],
      ));
  }
}
