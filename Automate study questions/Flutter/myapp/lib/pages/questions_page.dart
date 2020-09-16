import 'package:flutter/material.dart';
import 'package:myapp/Widgets/all_widget.dart';

class Question extends StatelessWidget {
  const Question({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
            padding: EdgeInsets.only(top: 50),
            child: AllWidgets(),
          )
    );
  }
}