import "package:cloud_firestore/cloud_firestore.dart";

import 'package:flutter/material.dart';
import "package:grouponproject/durgesh/addto_cart.dart";
import "package:grouponproject/durgesh/payment.dart";
import "package:grouponproject/home/homeModel.dart";

import "package:grouponproject/home/homePage.dart";
import "package:grouponproject/profile_page.dart";

import "../durgesh/like.dart";

class mainModule extends StatefulWidget {
  const mainModule({super.key});

  @override
  State createState() => _GroupsState();
}

class _GroupsState extends State {
  int? selectedBox;
  int? selectedBox2;
  QuerySnapshot? responce;
  String? size;
  String? color;
  String? data1;
  String? data3;

  Future fetchData() async {
    responce = await FirebaseFirestore.instance.collection("Groups").get();
    await Future.delayed(const Duration(seconds: 2)); // Simulate a delay
  }

  double? disc;
  double? disPrice;
  discountCalculate(int index) {
    double Price = responce!.docs[index]["price"] * 1 / 20;
    disPrice = responce!.docs[index]["price"] -
        (responce!.docs[index]["noOfBuy"] * Price);
    disc = responce!.docs[index]["noOfBuy"] * Price;
    return disc;
  }

  String? data2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 251, 204, 63),
            flexibleSpace: Row(children: [
              Padding(
                padding: const EdgeInsets.only(top: 35.0, left: 17),
                child: Text(
                  "Groups",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35.0, left: 5),
                child: Icon(
                  Icons.public,
                  color: Colors.blue,
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 35.0, left: 0),
                child: Icon(
                  Icons.close,
                  size: 30,
                ),
              ),
              SizedBox(width: 20),
            ])),
        body: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return const Center(
                  child: Text("No data", style: TextStyle(fontSize: 30)),
                );
              } else {
                return Column(
                  children: [
                    //SizedBox(height: 15),
                    Expanded(
                        child: ListView.builder(
                            itemCount: responce!.docs.length,
                            itemBuilder: (context, index) {
                              discountCalculate(index);
                              String? data = responce!.docs[index]["proInfo"];
                              if (data == "watch") {
                                data2 = "Steel";
                                data1 = "Steel";
                                data3 = "Best Watch";
                              } else {
                                data2 = "cotton";
                                data1 = size;
                                data3 = color;
                              }
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 0, left: 15, right: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 15),
                                    Text(responce!.docs[index]["proInfo"],
                                        style: TextStyle(fontSize: 25)),
                                    Container(
                                        height: 190,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 245, 245, 235),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border:
                                                Border.all(color: Colors.black),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black,
                                                  blurRadius: 6)
                                            ]),
                                        child: Column(
                                          children: [
                                            Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10, top: 10),
                                                    child: Container(
                                                        height: 100,
                                                        width: 100,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        child: Image.asset(
                                                            responce!
                                                                    .docs[index]
                                                                ["image"],
                                                            fit: BoxFit.cover)),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 15,
                                                                top: 10),
                                                        child: Text(
                                                            responce!
                                                                    .docs[index]
                                                                ["name"],
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 15,
                                                                top: 5),
                                                        child: Container(
                                                          height: 30,
                                                          width: 70,
                                                          decoration: BoxDecoration(
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  251,
                                                                  116,
                                                                  116),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          child: Center(
                                                            child: Text(data2!,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white)),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 15,
                                                                top: 7),
                                                        child: Text(
                                                            "\u20B9${responce!.docs[index]["price"]}",
                                                            style: TextStyle(
                                                                fontSize: 18)),
                                                      )
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5.0,
                                                            left: 22,
                                                            right: 20),
                                                    child: Column(children: [
                                                      Text("Buyers",
                                                          style: TextStyle(
                                                              fontSize: 17)),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 6.0,
                                                                top: 5),
                                                        child: Container(
                                                            height: 45,
                                                            width: 45,
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    253,
                                                                    208,
                                                                    72)),
                                                            child: Center(
                                                                child: Text(
                                                                    "${responce!.docs[index]["noOfBuy"]}",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            18)))),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      GestureDetector(
                                                        onTap: () {
                                                          if (responce!.docs[
                                                                      index]
                                                                  ["noOfBuy"] <=
                                                              4) {
                                                            int count =
                                                                responce!.docs[
                                                                        index]
                                                                    ["noOfBuy"];
                                                            count++;
                                                            FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    "Groups")
                                                                .doc(responce!
                                                                    .docs[index]
                                                                    .id)
                                                                .update({
                                                              "noOfBuy": count
                                                            });
                                                            setState(() {});
                                                          } else {
                                                            const snackBar =
                                                                SnackBar(
                                                              content: Text(
                                                                  'Group is Full Please Create a new Group!'),
                                                            );

                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    snackBar);
                                                          }
                                                        },
                                                        child: Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 5,
                                                                  horizontal:
                                                                      20),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .blue, // Button color
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8), // Rounded corners
                                                          ),
                                                          child: Text(
                                                            "Join",
                                                            style: TextStyle(
                                                              color: Colors
                                                                  .white, // Text color
                                                              fontSize:
                                                                  12, // Font size
                                                              fontWeight: FontWeight
                                                                  .bold, // Bold text
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ]),
                                                  )
                                                ]),
                                            Divider(),
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Text(
                                                          "Discount Price"),
                                                    ),
                                                    Text("\u20B9$disPrice",
                                                        style: TextStyle(
                                                            fontSize: 19,
                                                            color: Colors.green,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))
                                                  ],
                                                ),
                                                Spacer(),
                                                Center(
                                                    child: GestureDetector(
                                                        onTap: () async {
                                                          double? disc2 =
                                                              discountCalculate(
                                                                  index);
                                                          List<homeModel> data =
                                                              [];
                                                          QuerySnapshot
                                                              responce =
                                                              await FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      "Groups")
                                                                  .get();
                                                          data.clear();
                                                          for (int i = 0;
                                                              i <
                                                                  responce.docs
                                                                      .length;
                                                              i++) {
                                                            data.add(homeModel(
                                                              name: responce
                                                                      .docs[i]
                                                                  ["name"],
                                                              image: responce
                                                                      .docs[i]
                                                                  ["image"],
                                                              price: responce
                                                                      .docs[i]
                                                                  ["price"],
                                                              favo: responce
                                                                      .docs[i]
                                                                  ["favo"],
                                                              proName: responce
                                                                      .docs[i]
                                                                  ["proInfo"],
                                                              id: responce
                                                                  .docs[i].id,
                                                            ));
                                                          }
                                                          print(
                                                              "---------------------------------");

                                                          if (data[index].proName == "watch") {
                                                            data1 = "Steel";
                                                            data3 ="Best Watch";
                                                          } else {
                                                            data1 = size;
                                                            data3 = color;
                                                          }

                                                          if (data1!
                                                                  .isNotEmpty &&
                                                              data2!
                                                                  .isNotEmpty) {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) => Payment(
                                                                        proInfo:
                                                                            data[
                                                                                index],
                                                                        disc:
                                                                            disc2!,
                                                                        data1:
                                                                            data1!,
                                                                        data3:
                                                                            data3!)
                                                                  )
                                                            );
                                                          }else{
                                                             const snackBar = SnackBar(
                        content: Text('Select Information'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                                          }
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 8.0),
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10,
                                                                    horizontal:
                                                                        20),
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  Colors.blue,
                                                                  Colors.amber
                                                                ],
                                                                begin: Alignment
                                                                    .topLeft,
                                                                end: Alignment
                                                                    .bottomRight,
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.2),
                                                                  offset:
                                                                      Offset(
                                                                          4, 4),
                                                                  blurRadius:
                                                                      10,
                                                                  spreadRadius:
                                                                      1,
                                                                ),
                                                                BoxShadow(
                                                                  color: const Color
                                                                          .fromARGB(
                                                                          255,
                                                                          177,
                                                                          221,
                                                                          246)
                                                                      .withOpacity(
                                                                          0.7),
                                                                  offset:
                                                                      Offset(-4,
                                                                          -4),
                                                                  blurRadius:
                                                                      10,
                                                                  spreadRadius:
                                                                      1,
                                                                ),
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                //Icon(Icons.touch_app, color: Colors.white),
                                                                SizedBox(
                                                                    width: 10),
                                                                Text(
                                                                  "Buy Now",
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ))),
                                              ],
                                            )
                                          ],
                                        )),
                                    const SizedBox(height: 10),
                                    Center(
                                      child: data == "cloths"
                                          ? Container(
                                              height: 76,
                                              width: 360,
                                              padding: EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                color: const Color.fromARGB(255, 249, 243, 209),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "         Size                                    colors",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      )),
                                                  Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        // First Box
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              selectedBox = 1;
                                                              size = "S";
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 40,
                                                            height: 40,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  selectedBox ==
                                                                          1
                                                                      ? Colors
                                                                          .green
                                                                      : const Color.fromARGB(255, 188, 187, 187),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                            ),
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              "S",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            width:
                                                                10), // Space between boxes

                                                        // Second Box
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              selectedBox = 2;
                                                              size = "M";
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 40,
                                                            height: 40,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  selectedBox ==
                                                                          2
                                                                      ? Colors
                                                                          .green: const Color.fromARGB(255, 188, 187, 187),                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              "M",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 10),
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              selectedBox = 3;
                                                              size = "L";
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 40,
                                                            height: 40,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  selectedBox ==
                                                                          3
                                                                      ? Colors
                                                                          .green
                                                                      : const Color.fromARGB(255, 188, 187, 187),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              "L",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Spacer(),

                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              selectedBox2 = 1;
                                                              color = "Blue";
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 70,
                                                            height: 40,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  selectedBox2 ==
                                                                          1
                                                                      ? Colors
                                                                          .blue
                                                                    : const Color.fromARGB(255, 188, 187, 187),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              "Blue",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              selectedBox2 = 2;
                                                              color = "Red";
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 70,
                                                            height: 40,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  selectedBox2 == 2
                                                                      ? Colors
                                                                          .red
                                                                      : const Color.fromARGB(255, 188, 187, 187),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              "Red",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ))
                                          : SizedBox(),
                                    )
                                  ],
                                ),
                              );
                            }))
                  ],
                );
              }
            }),
        bottomNavigationBar: Container(
            height: 60,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                    boxShadow: [
                        BoxShadow(
                              color: Color.fromARGB(255, 203, 202, 202), blurRadius: 5, spreadRadius: 4)
                      ]
              ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 17, right: 20, left: 15),
                    child: Column(
                      children: [
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const homePage(),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            },
                            child: const Icon(
                              Icons.home_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => like()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 0.0, top: 7, right: 30),
                      child: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const mainModule()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 0.0, top: 17, right: 30),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.article_outlined,
                            color: Colors.blue,
                            size: 27,
                          ),
                          Container(
                            height: 5,
                            width: 20,
                            color: Colors.blue,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddToCartWidget()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 0.0, top: 7, right: 20),
                      child: Icon(
                        Icons.card_travel,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile()),
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 0.0, top: 17, right: 20),
                      child: Column(
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 29,
                          ),
                        ],
                      ),
                    ),
                  ),
                ])));
  }
}
