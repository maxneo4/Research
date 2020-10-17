

import 'package:flutter/cupertino.dart';

class NumeroQuestion with ChangeNotifier{

  List<int> _Nq=[];
  int _p=0;

  List<int> deco(String nq){
    _Nq=[];
    final data=nq.split(", ");
    data.forEach((element) {
      _Nq.add(int.parse(element));
    });
    return _Nq;
  }

  get nq{
    return this._Nq[_p];
  }

  set nq(List<int> nuevas){
    this._Nq=nuevas;
  }

  get p{
    return this._p;
  }

  set p(int p){
    //notifyListeners();
    this._p=p;
  }

  void sum(){
    this._p++;
  }

  void notifi(){
    notifyListeners();
  }

  int tam(){
    return _Nq.length;
  }

  List<int> todas(){
    return this._Nq;
  }

}