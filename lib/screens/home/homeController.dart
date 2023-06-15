import 'package:flutter_firebase_user/screens/CartScreen/view/CartScreen.dart';
import 'package:flutter_firebase_user/screens/Userhome/view/USeerscreen.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List Screens = [
    USerSCreen(),
    CartScreen(),
  ];
  RxInt Secrreenindex = 0.obs;
}
