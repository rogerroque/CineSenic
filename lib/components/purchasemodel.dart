import 'package:flutter/cupertino.dart';

class PurchaseModel extends ChangeNotifier {
  var pay = 0.0;

  void add(var price) {
    pay += price;
    notifyListeners();
  }

  void remove(var price) {
    pay -= price;
    notifyListeners();
  }
}