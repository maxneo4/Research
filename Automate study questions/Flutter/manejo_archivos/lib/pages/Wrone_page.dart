import 'package:flutter/material.dart';
import 'package:manejo_archivos/Widgets/all_widget.dart';
import 'package:manejo_archivos/providers/worong_provider.dart';
import 'package:provider/provider.dart';

class Wrong_page extends StatelessWidget {
  const Wrong_page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wrong = Provider.of<Wrong>(context, listen: false);
    return Scaffold(
      body: ListView(
        children: [
          AllWidgets()
        ],
      ),
    );
  }
}

