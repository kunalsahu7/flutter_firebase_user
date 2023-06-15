import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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
                            Text("Serch Produc",
                                style: TextStyle(color: Colors.black54)),
                            SizedBox(width: 150),
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
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: homeControllor.DataList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onLongPress: () {
                              print(homeControllor.DataList[index].key);
                              HomeModel homemodal = HomeModel(
                                key: homeControllor.DataList[index].key,
                                name: homeControllor.DataList[index].name,
                                warranty:
                                homeControllor.DataList[index].warranty,
                                modelno: homeControllor.DataList[index].modelno,
                                review: homeControllor.DataList[index].review,
                                price: homeControllor.DataList[index].price,
                                paytypes:
                                homeControllor.DataList[index].paytypes,
                                notes: homeControllor.DataList[index].notes,
                                image: homeControllor.DataList[index].image,
                                chekupadtedata: 1,
                              );
                              Get.toNamed(
                                '/Insert',
                                arguments: homemodal,
                              );
                            },
                            child: Expanded(
                              child: Container(
                                height: 700,
                                width: 800,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      spreadRadius: 5,
                                      color: Colors.black12,
                                    ),
                                  ],
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Image.network(
                                            "${homeControllor.DataList[index].image}"),height:100,width: 200,),
                                      SizedBox(height: 20),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          "NAME :-${homeControllor.DataList[index].name}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          "PRICE :-${homeControllor.DataList[index].price}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5,
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



