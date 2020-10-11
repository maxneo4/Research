

import 'package:flutter/cupertino.dart';

class Data with ChangeNotifier{

  List<String> _nq=[];
  List<String> _q=[];
  List<String> _a=[];

  void cargar(List<String> data, bool type){
    if(type){
      _cargarTrue(data);
    }else{
      _cargarFalse(data);
    }
  }

  void _cargarTrue(List<String> data){
    for (var i = 1; i < data.length; i+=3) {
      _nq.add(data[i]);
      _q.add(data[i+1]);
      _a.add(data[i+2]);
    }
    
  }

  void _cargarFalse(List<String> data){
    int cont=0;
    for (var i = 1; i < data.length; i+=2) {
      _nq.add(cont.toString());
      _q.add(data[i]);
      _a.add(data[i+1]);
      cont++;
    }
  }

  String Nq(int p){
    return this._nq[p];
  }

  String Q(int p){
    return this._q[p];
  }

  String A(int p){
    return this._a[p];
  }

  int Tam(){
    return _nq.length;
  }

  void reset(){
    _nq=[];
    _q=[];
    _a=[];
  }

}