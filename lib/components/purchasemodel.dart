import 'package:flutter/cupertino.dart';

class PurchaseModel extends ChangeNotifier {
  var pay = 0.0;
  var selected;
  var movieName;
  var menuSelected;
  var pricePerSeat;

  void setData(var movieName, var pricePerSeat) {
    this.movieName = movieName;
    this.pricePerSeat = pricePerSeat;
  }

  void add(var price) {
    pay += price;
    notifyListeners();
  }

  void remove(var price) {
    pay -= price;
    notifyListeners();
  }

  void getButacasSelected(var selected) {
    this.selected = selected;
    notifyListeners();
  }

  void getMenusSelected(var menuSelected) {
    this.menuSelected = menuSelected;
    notifyListeners();
  }

  String getButacasPrice(int numberOfTickets) {
    var butacaPrice = numberOfTickets * pricePerSeat;
    return butacaPrice.toString();
  }
}