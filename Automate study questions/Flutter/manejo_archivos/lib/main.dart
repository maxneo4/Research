import 'package:flutter/material.dart';
import 'package:manejo_archivos/pages/page.dart';
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


