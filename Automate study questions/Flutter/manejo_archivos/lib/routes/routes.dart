
import 'package:flutter/material.dart';
import 'package:manejo_archivos/pages/Final_page.dart';
import 'package:manejo_archivos/pages/ListUrl_page.dart';
import 'package:manejo_archivos/pages/Wrone_page.dart';
import 'package:manejo_archivos/pages/add_page.dart';
import 'package:manejo_archivos/pages/continue_page.dart';
import 'package:manejo_archivos/pages/page.dart';
import 'package:manejo_archivos/pages/questions_page.dart';
import 'package:manejo_archivos/pages/url_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'Page': (BuildContext context) => ArchivoPage(),
    'Url': (BuildContext context) => Urlpage(),
    'Ques': (BuildContext context) => Question(),
    'Final': (BuildContext context) => FinalPage(),
    'Wrong': (BuildContext context) => Wrong_page(),
    'listurl': (BuildContext context) => ListUrl(),
    'add': (BuildContext context) => AddPage(),
    'continue': (BuildContext context) => ContinuePage(),

    
  };
}
