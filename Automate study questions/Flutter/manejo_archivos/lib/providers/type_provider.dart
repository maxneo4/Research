 

import 'package:flutter/cupertino.dart';

class Tipo with ChangeNotifier{

  bool _ty=false;

  set Ty(bool a){
    this._ty=a;
  }

  get Ty{
    return this._ty;
  }

}