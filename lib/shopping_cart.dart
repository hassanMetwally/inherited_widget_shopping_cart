import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inherited_widget_shopping_cart/products.dart';
import 'data_center.dart';

// نفس ال class اللى تحت بس باستخدام ال statefulBuilder
// لكن فى bug مش عارف سببه وهو
// ال Text() اللى تحت اللى listView.builder مبيحصلوش update

// class ShoppingCart extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     List selectedItems = DataCenter.of(context).selectedItems;
//     int selectedItemsCount = DataCenter.of(context).selectedItems.length;
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Shopping Cart"),
//         ),
//         body: StatefulBuilder(
//             builder: (BuildContext context, StateSetter setState) {
//           return SingleChildScrollView(
//             child: Column(
//               children: [
//                 ListView.builder(
//                   itemCount: selectedItems.length,
//                   itemBuilder: (BuildContext context, i) {
//                     return Card(
//                       margin: EdgeInsets.all(10),
//                       child: ListTile(
//                           title: Text("${selectedItems[i].name}"),
//                           subtitle: Text("${selectedItems[i].price} EGP"),
//                           trailing: IconButton(
//                               icon: Icon(Icons.delete),
//                               onPressed: () {
//                                 setState(() {
//                                   selectedItems.removeAt(i);
//                                 });
//                               })),
//                     );
//                   },
//                   shrinkWrap: true,
//                   physics: new NeverScrollableScrollPhysics(),
//                 ),
//                 Text(
//                   "$selectedItemsCount items",
//                   style: TextStyle(fontSize: 24),
//                 ),
//               ],
//             ),
//           );
//         }));
//   }
// }

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  @override
  Widget build(BuildContext context) {
    List shoppingCartItems = DataCenter.of(context).shoppingCartList;


    return Scaffold(
        appBar: AppBar(
          title: Text("Shopping Cart"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                itemCount: shoppingCartItems.length,
                itemBuilder: (BuildContext context, position) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                        title: Text("${shoppingCartItems[position].name}"),
                        subtitle: Text("${shoppingCartItems[position].price} EGP"),
                        trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                shoppingCartItems[position].isChecked = false;
                                shoppingCartItems.remove(shoppingCartItems[position]);
                              });
                            })),
                  );
                },
                shrinkWrap: true,
                physics: new NeverScrollableScrollPhysics(),
              ),
              Text(
                "${shoppingCartItems.length} item",
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ));
  }
}
