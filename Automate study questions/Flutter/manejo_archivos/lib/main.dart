import 'package:flutter/material.dart';
import 'package:manejo_archivos/pages/page.dart';
import 'package:manejo_archivos/providers/Answer_provider.dart';
import 'package:manejo_archivos/providers/Contador_provider.dart';
import 'package:manejo_archivos/providers/Datos_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
            ChangeNotifierProvider(builder: (context)=>Datos()),
            ChangeNotifierProvider(builder: (context)=>Answer()),
            ChangeNotifierProvider(builder: (context)=>Contador()),
        ],
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
              debugShowCheckedModeBanner: false,
        home: ArchivoPage(),
      ),
    );
  }
}


