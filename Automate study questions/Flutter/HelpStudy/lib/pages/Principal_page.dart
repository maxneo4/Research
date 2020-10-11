import 'package:flutter/material.dart';
import 'package:manejo_archivos/widgets/List_urls_widgets.dart';

class Principal_page extends StatelessWidget {
  const Principal_page({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HelpStudy'),
      ),
      body: Column(
        children: [
          ListUrls()
        ],
      ),
    );
  }
}