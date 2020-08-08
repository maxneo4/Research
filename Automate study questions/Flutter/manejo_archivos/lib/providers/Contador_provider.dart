import 'package:flutter/material.dart';

class Contador with ChangeNotifier{

  int _aR=0;
  int _aW=0;
  int _aJ=0;

  set Rans(int c){
    this._aR=c;
  }

  set Wans(int c){
    this._aW=c;
  }

  set Jans(int c){
    this._aJ=c;
  }

  get Jans{
    return _aJ;
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

  void Jrong(){
    _aJ++;
  }

  int total(){
    return (_aJ+_aR+_aW);
  }

  void noti(){
    notifyListeners();
  }

  void reset(){
    _aR=0;
    _aW=0;
    _aJ=0;
  }

}