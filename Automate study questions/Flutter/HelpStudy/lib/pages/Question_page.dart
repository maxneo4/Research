import 'package:flutter/material.dart';
import 'package:manejo_archivos/widgets/Field_widget.dart';
import 'package:manejo_archivos/widgets/Next_widget.dart';
import 'package:manejo_archivos/widgets/Question_widget.dart';
import 'package:manejo_archivos/widgets/reset_widget.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResetButton(),
            SizedBox(
              height: 50,
            ),
            Questions(),
            SizedBox(
              height: 30,
            ),
            Field(),
            SizedBox(
              height: 30,
            ),
            NextButtons()
          ],
        ),
      ),
    );
  }
}
