import 'package:flutter_firebase_user/screens/CartScreen/view/CartScreen.dart';
import 'package:flutter_firebase_user/screens/Userhome/view/USeerscreen.dart';
import 'package:get/get.dart';

class userController extends GetxController {
  List Screens = [
    USerSCreen(),
    CartScreen(),
  ];
  RxInt Secrreenindex = 0.obs;
  RxList imageList = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
  ].obs;
}
