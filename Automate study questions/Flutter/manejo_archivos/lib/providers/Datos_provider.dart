import 'package:flutter/material.dart';

class Datos with ChangeNotifier{

  List _nq=[];
  List _q=[];
  List _a=[];
  int p=0;

  set cargar(List D){
    for(int i=1; i<D.length; i+=3){
      if(D[i]==" " || D[i]==""){
        i++;
      }
      _nq.add(D[i]);
      _q.add(D[i+1]);
      _a.add(D[i+2]);
    }
  }

get Nq{
  return this._nq[p];
}

get Q{
  return this._q[p];
}

get A{
    return this._a[p];
}

void pos(){
  p++;
}

void notifi(){
  notifyListeners();
}

void reset(){
  _nq=[];
  _q=[];
  _a=[];
  p=0;
}

}
