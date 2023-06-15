import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_user/screens/home/homeController.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: homeController.Screens[homeController.Secrreenindex.value],
        bottomNavigationBar: ConvexAppBar(
          onTap: (index) {
            homeController.Secrreenindex.value = index;
            setState(() {

            });
          },
          items: [
            TabItem(icon: Icons.home,title: 'home'),
            TabItem(icon: Icons.card_travel,title: 'cart'),
          ],
        ),
      ),
    );
  }
}
