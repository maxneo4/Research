import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:manejo_archivos/pages/page.dart';
import 'package:manejo_archivos/pages/url_page.dart';
import 'package:manejo_archivos/providers/Answer_provider.dart';
import 'package:manejo_archivos/providers/Contador_provider.dart';
import 'package:manejo_archivos/providers/Datos_provider.dart';
import 'package:manejo_archivos/providers/type_provider.dart';
import 'package:manejo_archivos/providers/url_provider.dart';
import 'package:manejo_archivos/providers/worong_provider.dart';
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
        ChangeNotifierProvider(builder: (context) => Datos()),
        ChangeNotifierProvider(builder: (context) => Answer()),
        ChangeNotifierProvider(builder: (context) => Contador()),
        ChangeNotifierProvider(builder: (context) => Url()),
        ChangeNotifierProvider(builder: (context) => Wrong()),
        ChangeNotifierProvider(builder: (context) => Tipo()),
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
        home: ArchivoPage(),
        routes: getApplicationRoutes(),
      ),
    );
  }
}
