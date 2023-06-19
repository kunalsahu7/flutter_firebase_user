import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_user/screens/Userhome/controler/Usercontroler.dart';
import 'package:flutter_firebase_user/screens/home/homeController.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  userController homeController = Get.put(userController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: homeController.Screens[homeController.Secrreenindex.value],
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Colors.amber,
          onTap: (index) {
            homeController.Secrreenindex.value = index;
            setState(() {});
          },
          items: [
            TabItem(icon: Icons.home, title: 'home'),
            TabItem(icon: Icons.shopping_cart, title: 'cart'),
          ],
        ),
      ),
    );
  }
}
