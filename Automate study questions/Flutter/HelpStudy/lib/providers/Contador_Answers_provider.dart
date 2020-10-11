


import 'package:flutter/cupertino.dart';

class ContadorAnswer with ChangeNotifier{

  int _corrects=0;
  List<int> _incorrects=[];
  int _jumps=0;

  get Corrects{
    return this._corrects;
  }

  get Incorrects{
    return this._incorrects;
  }

  set Incorrects(List<int> a){
    this._incorrects=a;
  }

  get Jumps{
    return this._jumps;
  }

  void SumCorrects(){
    this._corrects++;
  }

  void SumIncorrects(int a){
    if(!this._incorrects.contains(a)){
      this._incorrects.add(a);
    }
  }

  void ResIncorrects(){
    this._incorrects.removeLast();
  }

  void SumJumps(){
    this._jumps++;
  }

  void reset(){
    _corrects=0;
    _incorrects=[];
    _jumps=0;
  }

}