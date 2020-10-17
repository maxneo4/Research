
import 'package:flutter/material.dart';
import 'package:manejo_archivos/pages/Add_page.dart';
import 'package:manejo_archivos/pages/Final_page.dart';
import 'package:manejo_archivos/pages/Principal_page.dart';
import 'package:manejo_archivos/pages/Question_page.dart';
import 'package:manejo_archivos/pages/main_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'inicio': (BuildContext context) => Main(),    
    'main': (BuildContext context) => Principal_page(),    
    'Add': (BuildContext context) => AddPage(),    
    'questions': (BuildContext context) => QuestionPage(),    
    'final': (BuildContext context) => Final(),    
  };
}
