import 'package:flutter/material.dart';

class Menu {
  String name;
  String price;
  String imageURL;
  int contador;

  Menu({@required this.name, @required this.imageURL, @required this.price, @required this.contador});
}

List<Menu> menus = [];

