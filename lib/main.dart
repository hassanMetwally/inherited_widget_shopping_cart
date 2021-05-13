import 'package:flutter/material.dart';
import 'package:inherited_widget_shopping_cart/data_center.dart';
import 'package:inherited_widget_shopping_cart/products.dart';

void main(){
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataCenter(
      child: MaterialApp(
        home: Products(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(255,199,44,1)


        ),
      ),
    );
  }
}
