import 'package:flutter/material.dart';
import 'package:flutter_firebase_user/screens/CartScreen/modal/CartMoadlSacreen.dart';
import 'package:flutter_firebase_user/screens/Userhome/controler/Usercontroler.dart';
import 'package:flutter_firebase_user/screens/Userhome/modal/usermodal.dart';
import 'package:flutter_firebase_user/utills/Userfirebase.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../home/homeController.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {


  HomeControllor homeControllor = Get.put(HomeControllor());
  userController user = Get.put(userController());

  HomeModel m1=Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 300,
              width: double.infinity,
              child:    Image.network(
                  "${m1.image}"),
            ),
            Text("${m1.name}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("${m1.price}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Thish Producat is very Good.Thish Prodcat Collity is bets.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal)),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(onPressed: () {
                FirebaseHelper.firebaseHelper.UserAddData(
                  notes: m1.notes,
                  paytypes: m1.paytypes,
                  price: m1.price,
                  review: m1.review,
                  modelno: m1.modelno,
                  warranty: m1.warranty,
                  name: m1.name,
                  image: m1.image
                );
                Get.back();
              }, child: Text("Add to Cart"),style: ElevatedButton.styleFrom(backgroundColor: Colors.black),),
            )
          ],
        ),
      ),
    );
  }
}
