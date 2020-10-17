import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:manejo_archivos/pages/Principal_page.dart';
import 'package:manejo_archivos/pages/main_page.dart';
import 'package:manejo_archivos/providers/Answer_provider.dart';
import 'package:manejo_archivos/providers/Contador_Answers_provider.dart';
import 'package:manejo_archivos/providers/Data_provider.dart';
import 'package:manejo_archivos/providers/Numero_Question_provider.dart';
import 'package:manejo_archivos/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => NumeroQuestion()),
        ChangeNotifierProvider(builder: (context) => Data()),
        ChangeNotifierProvider(builder: (context) => Answer()),
        ChangeNotifierProvider(builder: (context) => ContadorAnswer()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es'), // English

      ],
        debugShowCheckedModeBanner: false,
        home: Main(),
        routes: getApplicationRoutes(),
      ),
    );
  }
}
