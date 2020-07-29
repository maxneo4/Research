import 'package:flutter/material.dart';

class Contador with ChangeNotifier{

  int _aR=0;
  int _aW=0;

  set Rans(int c){
    this._aR=c;
  }

  set Wans(int c){
    this._aW=c;
  }

  get Rans{
    return _aR;
  }

  get Wans{
    return _aW;
  }

  void Right(){
    _aR++;
  }

  void Wrong(){
    _aW++;
  }

  void reset(){
    print("a");
    _aR=0;
    _aW=0;
  }

}