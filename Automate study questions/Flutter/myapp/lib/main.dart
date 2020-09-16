import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'pages/page.dart';
import 'providers/Answer_provider.dart';
import 'providers/Contador_provider.dart';
import 'providers/Datos_provider.dart';
import 'providers/add_provider.dart';
import 'providers/type_provider.dart';
import 'providers/url_provider.dart';
import 'providers/worong_provider.dart';
import 'routes/routes.dart';

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
        ChangeNotifierProvider(builder: (context) => Add()),

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
