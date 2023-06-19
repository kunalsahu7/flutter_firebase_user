import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_user/screens/home/homeController.dart';

import 'package:get/get.dart';

import '../../../utills/Userfirebase.dart';
import '../controler/Usercontroler.dart';
import '../modal/usermodal.dart';

class USerSCreen extends StatefulWidget {
  const USerSCreen({Key? key}) : super(key: key);

  @override
  State<USerSCreen> createState() => _USerSCreenState();
}

class _USerSCreenState extends State<USerSCreen> {
  HomeControllor homeControllor = Get.put(HomeControllor());
  userController user = Get.put(userController());

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   // leading: InkWell(onTap: () {
        //   //
        //   // }, child: Icon(Icons.menu,color: Colors.black,)),
        // ),
        drawer: Drawer(
          child: Column(
            children: [],
          ),
          width: 250,
          backgroundColor: Colors.white,
        ),
        body: StreamBuilder(
          stream: FirebaseHelper.firebaseHelper.readdata(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              homeControllor.DataList.clear();

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

                HomeModel homeModel = HomeModel(
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

                homeControllor.DataList.add(homeModel);
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
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  _scaffoldKey.currentState!.openDrawer();
                                },
                                icon: Icon(Icons.menu)),
                            Expanded(
                              child: Text("Serch Product",
                                  style: TextStyle(color: Colors.black54)),
                            ),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.search)),
                            IconButton(
                                onPressed: () {
                                  FirebaseHelper.firebaseHelper.signOut();
                                  Get.offAndToNamed('/SignIn');
                                },
                                icon: Icon(Icons.logout)),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: CarouselSlider.builder(
                        itemCount: user.imageList.length,
                        itemBuilder: (context, index, realIndex) {
                          return Image.asset(
                            "${user.imageList.value[index]}",
                          );
                        },
                        options: CarouselOptions(
                          autoPlay: true,
                        ),
                      ),
                      margin: EdgeInsets.all(10),
                      width: double.infinity,
                      height: 200,
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 200, crossAxisCount: 2),
                        itemCount: homeControllor.DataList.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.toNamed("/details",arguments: homeControllor.DataList[index]);
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
                                    "${homeControllor.DataList[index].image}",
                                    height: 100,
                                    width: 100,
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    "NAME :-${homeControllor.DataList[index].name}",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "PRICE :-${homeControllor.DataList[index].price}",
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
      ),
    );
  }
}
