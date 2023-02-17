import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Models/item.dart';
import './Models/cart.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Check Out"),),
      body: Consumer<Cart>(builder: (context,cart,child){
        return ListView.builder(
            itemCount: cart.basketitem.length ,
            itemBuilder: (context, i) {
          return Card(child: ListTile(
            title: Text(" ${cart.basketitem[i].name}"),
            subtitle: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(" ${cart.basketitem[i].price}"),
            ),
            trailing: IconButton(icon: Icon(Icons.remove), onPressed: ()
            {
              cart.remove(cart.basketitem[i]);
            },),
          ),);
        });
      },),
    );
  }
}
