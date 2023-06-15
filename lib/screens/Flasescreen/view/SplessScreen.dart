import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utills/Userfirebase.dart';

class SplessScreen extends StatefulWidget {
  const SplessScreen({Key? key}) : super(key: key);

  @override
  State<SplessScreen> createState() => _SplessScreenState();
}

class _SplessScreenState extends State<SplessScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Get.offAndToNamed(FirebaseHelper.firebaseHelper.checkLogin() == null?'/SignIn':'home');
    });
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FlutterLogo(size: 200),
        ),
      ),
    );
  }
}
