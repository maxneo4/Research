import 'package:flutter/cupertino.dart';

class Wrong with ChangeNotifier {
  List _nq = [];
  List _q = [];
  List _a = [];
  List _b = [];
  int _p = 0;

  set B(int a) {
    this._b.add(a);
  }

  set Nq(String a) {
    this._nq.add(a);
  }

  get Nq {
    return this._nq[_p];
  }

  set Q(String a) {
    this._q.add(a);
  }

  get Q {
    return this._q[_p];
  }

  set A(String a) {
    this._a.add(a);
  }

  get A {
    return this._a[_p];
  }

  set P(int a) {
    this._p = a;
  }

  get P {
    return (this._p + 1);
  }

  get Cant {
    return _nq.length.toString();
  }

  void Pos() {
    this._p++;
  }

  void noti() {
    notifyListeners();
  }

  void bor() {
    if (_b != []) {
      _b.forEach((element) {
        _nq.removeAt(element - 1);
        _q.removeAt(element - 1);
        _a.removeAt(element - 1);
      });
      _p -= _b.length;
      _b = [];
    }
  }

  void reset() {
     _nq = [];
     _q = [];
     _a = [];
     _b = [];
     _p = 0;
  }
}
