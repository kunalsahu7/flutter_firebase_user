import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_user/screens/CartScreen/Controler/cartcontroler.dart';
import 'package:flutter_firebase_user/screens/CartScreen/modal/CartMoadlSacreen.dart';
import 'package:get/get.dart';

import '../../../utills/Userfirebase.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Cartcontroler cartcontroler = Get.put(Cartcontroler());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder
          (
          stream: FirebaseHelper.firebaseHelper.USerreaddata(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              cartcontroler.CartList.clear();

              QuerySnapshot? snapdata = snapshot.data;
              for (var x in snapdata!.docs) {
                x.id;

                Map data = x.data() as Map;
                String? name = data['name'];
                String? price = data['price'];
                String? notes = data['notes'];
                String? date = data['date'];
                String? time = data['time'];
                String? review = data['review'];
                String? warranty = data['warranty'];
                String? paytypes = data['paytypes'];
                String? modelno = data['modelno'];
                String? image = data['image'];
                var key = x.id;

                Cartmodal cartmodal = Cartmodal(
                  modelno: modelno,
                  name: name,
                  notes: notes,
                  paytypes: paytypes,
                  price: price,
                  review: review,
                  warranty: warranty,
                  image: image,
                  key: key,
                );

                cartcontroler.CartList.add(cartmodal);
              }

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 200, crossAxisCount: 2),
                        itemCount: cartcontroler.CartList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onDoubleTap: () {
                              FirebaseHelper.firebaseHelper.deletdata(key: cartcontroler.CartList[index].key);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 5,
                                    spreadRadius: 5,
                                    color: Colors.black12,
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.network(
                                    "${cartcontroler.CartList[index].image}",
                                    height: 100,
                                    width: 100,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "NAME :-${cartcontroler.CartList[index].name}",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "PRICE :-${cartcontroler.CartList[index].price}",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          child: Icon(Icons.card_travel),
          backgroundColor: Colors.brown,
        ),
      ),
    );
  }
}
