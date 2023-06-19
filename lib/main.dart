import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_user/screens/CartScreen/view/CartScreen.dart';
import 'package:flutter_firebase_user/screens/Detailsscreen/view/DetailsCSreen.dart';
import 'package:flutter_firebase_user/screens/Flasescreen/view/SplessScreen.dart';
import 'package:flutter_firebase_user/screens/Loginscreen/view/Signinscreen.dart';
import 'package:flutter_firebase_user/screens/Loginscreen/view/Signupscreen.dart';
import 'package:flutter_firebase_user/screens/Userhome/view/USeerscreen.dart';
import 'package:flutter_firebase_user/screens/buyscreen/view/buyScreen.dart';
import 'package:flutter_firebase_user/screens/home/HomeScreen.dart';
import 'package:get/get.dart';

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page:() => SplessScreen()),
        GetPage(name: '/SignIn', page:() => SignInScreen()),
        GetPage(name: '/SingUp', page:() => SingUp_Screen()),
        GetPage(name: '/User', page:() => USerSCreen()),
        GetPage(name: '/home', page:() => HomeScreen()),
        GetPage(name: '/cart', page:() => CartScreen()),
        GetPage(name: '/details', page:() => DetailScreen()),
        GetPage(name: '/buy', page:() => BuyScreen()),
      ],
    ),
  );
}