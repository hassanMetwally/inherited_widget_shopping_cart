import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inherited_widget_shopping_cart/shopping_cart.dart';
import 'data_center.dart';

class Products extends StatelessWidget {
  @override
   Widget build(BuildContext context) {
    List productsList =DataCenter.of(context).productsList;
    List shoppingCartItems = DataCenter.of(context).shoppingCartList;
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Products"),
          actions: [
            IconButton(icon: Icon(Icons.refresh),
              onPressed: (){
                setState((){});
              },),

            Padding(
              padding: EdgeInsets.only(right: 20, top: 8),
              child: Badge(
                badgeContent: Text('${shoppingCartItems.length}'),

                child: IconButton(icon: Icon(Icons.shopping_cart),
                    onPressed: (){
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ShoppingCart();
                      }));
                    },)

              ),
            )
          ],
        ),
        body: ListView.builder(
            itemCount: productsList.length,
            itemBuilder: (BuildContext context, position) {
              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text("${productsList[position].name}"),
                  subtitle: Text("${productsList[position].price} EGP"),
                  trailing: Checkbox(
                    value: productsList[position].isChecked,
                    onChanged: (value){
                      _onPressed(setState, productsList, position, shoppingCartItems);
                    },
                  ),
                  onTap: (){
                    _onPressed(setState, productsList, position, shoppingCartItems);
                  },
                ),
              );
            }),
      );
    });
  }

  void _onPressed(StateSetter setState, List productsList, int position, List shoppingCartItems) {
    setState((){
      productsList[position].isChecked = !productsList[position].isChecked;
      if(productsList[position].isChecked){
        shoppingCartItems.add(productsList[position]);
      }
      else{
        shoppingCartItems.remove(productsList[position]);
      }
    });
  }


}
