import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utills/Userfirebase.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpassword = TextEditingController();

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          title: Text("FireBase"),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200,
                child: Stack(
                  children: <Widget>[],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "SignIn",
                      style: TextStyle(
                          color: Color.fromRGBO(49, 39, 79, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.brown.shade50,
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Color.fromRGBO(196, 135, 198, .3),
                        //     blurRadius: 20,
                        //     offset: Offset(0, 10),
                        //   ),
                        // ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.brown.shade100,
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: txtemail,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ),
                          ),
                          // Divider(thickness: 1,color: Colors.grey.shade200,),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              controller: txtpassword,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  String? msg = await FirebaseHelper.firebaseHelper.SingIn(
                    email: txtemail.text,
                    password: txtpassword.text,
                  );

                  if (msg == "success") {
                    Get.snackbar("$msg", "Login SuccessFully.");
                    Get.offAndToNamed("/home");
                  }
                  Get.snackbar("$msg", "Login UnSuccessFully.");
                },
                child: Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 60),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.brown,
                  ),
                  child: Center(
                    child: Text(
                      "SignIn",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 36,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.toNamed("/SingUp");
                  },
                  child: Text(
                    "Creat A NEw Account? Sign Up",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(49, 39, 79, .6)),
                  ),
                ),
              ),
              Center(
                child: Container(
                  child: TextButton(
                    onPressed: () async {
                      String msg = await FirebaseHelper.firebaseHelper
                          .signInWithGoogle();
                      if (msg == "Success") {
                        Get.offAndToNamed('/home');
                      }
                    },
                    child: Text("Google"),
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
