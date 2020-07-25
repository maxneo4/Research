import 'package:flutter/material.dart';
import 'package:manejo_archivos/pages/page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
            debugShowCheckedModeBanner: false,
      home: ArchivoPage(),
    );
  }
}


