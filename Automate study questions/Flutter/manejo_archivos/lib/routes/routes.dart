
import 'package:flutter/material.dart';
import 'package:manejo_archivos/pages/page.dart';
import 'package:manejo_archivos/pages/questions_page.dart';
import 'package:manejo_archivos/pages/url_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'Page': (BuildContext context) => ArchivoPage(),
    'Url': (BuildContext context) => Urlpage(),
    'Ques': (BuildContext context) => Question(),
  };
}
