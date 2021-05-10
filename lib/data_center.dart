import 'dart:math';
import 'package:flutter/material.dart';
import 'package:inherited_widget_shopping_cart/product.dart';
import 'package:collection/collection.dart';

class DataCenter extends InheritedWidget {
  List productsList = List.generate(100, (i) {
    return Product("Product $i", Random().nextInt(5000), false);
  });
  List<Product> shoppingCartList = [];


  Widget child;

  DataCenter({this.child});

  //pointer to الداتا اللى هتكون فى الكلاس ده
  static DataCenter of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataCenter>();
  }

  @override
  bool updateShouldNotify(DataCenter oldWidget) {
    return !IterableEquality().equals(
        shoppingCartList, oldWidget.shoppingCartList);
  }
}