import 'package:add_to_cart_provider/Checkout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Models/item.dart';
import './Models/cart.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  List<Item> items = [
    Item(name: "s20 ultra", price: 250),
    Item(name: "p30 pro", price: 350)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          Row(children: [IconButton(
            icon: Icon(Icons.mobile_friendly),
            onPressed: ()
            {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return CheckOut();
              }));
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Consumer<Cart>(builder: (context,cart,child){
              return Text("${cart.count}");
            },)
          ),
          ],)
        ],
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, i) {
            return Card(
              child: Consumer<Cart>(builder: (context,cart,child){
                return ListTile(
                  title: Text("${items[i].name}"),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("${items[i].price}"),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: ()
                    {
                      cart.add(items[i]);
                    },
                  ),
                );
              },)
            );
          }),
    );
  }
}
