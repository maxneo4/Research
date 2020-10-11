

import 'package:flutter/cupertino.dart';

class Answer with ChangeNotifier{

  String _answer="";

  set Ans(String a){
    this._answer=a;
  }

  get Ans{
    return this._answer;
  }

}