

import 'package:flutter/cupertino.dart';

class Add with ChangeNotifier{

  String _title="";
  String _url="";

  set title(String a){
    this._title=a;
  }

  get title{
    return this._title;
  }

  set url(String a){
    this._url=a;
  }

  get url{
    return this._url;
  }

}