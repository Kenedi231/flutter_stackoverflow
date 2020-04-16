import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int _counter;

  Counter(this._counter);

  getCounter() => _counter;
  setCounter(int counter) => _counter = counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decremnt() {
    _counter--;
    notifyListeners();
  }
}