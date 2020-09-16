
import 'package:flutter/material.dart';
import 'package:myapp/pages/Final_page.dart';
import 'package:myapp/pages/ListUrl_page.dart';
import 'package:myapp/pages/Wrone_page.dart';
import 'package:myapp/pages/add_page.dart';
import 'package:myapp/pages/page.dart';
import 'package:myapp/pages/questions_page.dart';
import 'package:myapp/pages/url_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'Page': (BuildContext context) => ArchivoPage(),
    'Url': (BuildContext context) => Urlpage(),
    'Ques': (BuildContext context) => Question(),
    'Final': (BuildContext context) => FinalPage(),
    'Wrong': (BuildContext context) => Wrong_page(),
    'listurl': (BuildContext context) => ListUrl(),
    'add': (BuildContext context) => AddPage(),
    
  };
}
