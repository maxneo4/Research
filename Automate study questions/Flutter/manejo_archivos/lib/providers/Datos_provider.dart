import 'package:flutter/material.dart';

class Datos with ChangeNotifier {
  String _all="";
  List _nq = [];
  List _q = [];
  List _a = [];
  int _p = 0;

  set all(String a){
    this._all=a;
  }

  get all{
    return this._all;
  }

  String cant(){
    return (_nq.length).toString();
  }

  void cargar() {
    List D = _all.split("\r\n");
    D.remove("");
    if(D[0]=="nq|q|a"){
      withNQ(D);
    }else{
      withQ(D);
    }
  }

  void withNQ(List D){
    for (int i = 1; i < D.length; i += 3) {
      if (D[i] == " " || D[i] == "") {
        i++;
      }
      if (i < D.length) {
        _nq.add(D[i]);
        _q.add(D[i + 1]);
        _a.add(D[i + 2]);
      }
    }
  }

  void withQ(List D){
    for (int i = 1; i < D.length; i += 3) {
      if (D[i] == " " || D[i] == "") {
        i++;
      }
      if (i < D.length) {
        _nq.add((i-1).toString());
        _q.add(D[i]);
        _a.add(D[i + 1]);
      }
    }
  }

  get Nq {
    return this._nq[_p];
  }

  get Q {
    return this._q[_p];
  }

  get A {
    return this._a[_p];
  }

  get P {
    return (_p+1);
  }

  set P(int a) {
    this._p=a;
  }

  void pos() {
    _p++;
  }

  void notifi() {
    notifyListeners();
  }

  void reset() {
    _nq = [];
    _q = [];
    _a = [];
    _all="";
    _p = 0;
  }
}
