import "package:cloud_firestore/cloud_firestore.dart";

import "package:flutter/material.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import "package:go_router/go_router.dart";
import "package:google_fonts/google_fonts.dart";
import "package:grouponproject/durgesh/addto_cart.dart";
import "package:grouponproject/durgesh/bag.dart";
import "package:grouponproject/durgesh/clothing.dart";
import "package:grouponproject/home/homeModel.dart";
import "package:grouponproject/mainModule/mainModule.dart";
import "FlashSale.dart";
import "/profile_page.dart";

import "../durgesh/like.dart";

class homePage extends StatefulWidget {
  const homePage({super.key});
  @override
  State createState() => _homePage();
}

class _homePage extends State with SingleTickerProviderStateMixin {

  final List<String> _images = [
    "assets/aa.svg",
    "assets/Group.svg",
    "assets/Frame.svg"
  ];

  List<homeModel> data =[];

  prodCounts()async{
    QuerySnapshot infoWatch = await FirebaseFirestore.instance.collection("watch").get();
    Watch = infoWatch.docs.length;

    QuerySnapshot infoCloths = await FirebaseFirestore.instance.collection("cloths").get();
    clothing = infoCloths.docs.length;
  }


  int? clothing;
  int shoes = 20;
  int Bags = 10;
  int Glasses = 15;
  int Hoodies = 12;
  int? Watch;
  
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation1;
  late Animation<Color?> _colorAnimation2;
  @override
  void initState() {
    prodCounts();
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat(reverse: true);

    _colorAnimation1 = ColorTween(
       begin: Colors.amber,
      end: Colors.white,
      // begin: Colors.blue,
      // end: Colors.purple,
    ).animate(_controller);

    _colorAnimation2 = ColorTween(
      begin: Colors.white,
      end: Colors.orange  ,
      // begin: Colors.green,
      // end: Colors.orange,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
      return Scaffold(
        backgroundColor:Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading:false,
              surfaceTintColor:Colors.white,
              backgroundColor:Colors.white,
              flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [_colorAnimation1.value!, _colorAnimation2.value!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child:Padding(
                padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Shop",
                      style: GoogleFonts.raleway(fontSize: 29, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap:(){
                
                    },
                    child: SizedBox(
                      height: 40,
                      width: 280,
                      child: TextField(
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 242, 237, 237),
                              suffixIcon: const Icon(Icons.search),
                              hintText: "Search",
                              hintStyle: const TextStyle(
                                  fontSize: 13  ,
                                  color: Color.fromARGB(255, 186, 182, 182)))),
                    ),
                  ),
                ],
                            ),
              ),
            ),

             
        ),
          body: ListView(children: [
            const SizedBox(height: 10),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 20 / 8,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: _images.map((image) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 241, 140, 174),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: SvgPicture.asset(
                        image,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 15, bottom: 15),
              child: Text("Categories",
                  style: GoogleFonts.raleway(
                      fontSize: 25, fontWeight: FontWeight.bold)),
            ),
            Row(children: [
              const SizedBox(width: 15),
              GestureDetector(
                onTap: ()async{
                 QuerySnapshot responce = await FirebaseFirestore.instance.collection("cloths").get();
                  data.clear();
                  for(int i=0; i<responce.docs.length;i++){
                    data.add(
                      homeModel(
                        name:responce.docs[i]["name"],
                        image:responce.docs[i]["image"],
                        price:responce.docs[i]["price"],
                        favo:responce.docs[i]["favo"],
                        proName:responce.docs[i]["proName"],
                        id:responce.docs[i].id,
                      )
                    );
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>cloting(data:data,name:"cloths"))
                  );
                },
                child: Container(
                    height: 220,
                    width: 180,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 203, 202, 202), blurRadius: 5, spreadRadius: 4)
                        ]),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8, left: 8),
                            child: Row(children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                    //color: Colors.red,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset("assets/P1.jpg",
                                      fit: BoxFit.cover)),
                              const SizedBox(width: 5),
                              Container(
                                  height: 80,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset("assets/P2.png",
                                      fit: BoxFit.cover))
                            ]),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8, left: 8),
                            child: Row(children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset("assets/P4.png",
                                      fit: BoxFit.cover)),
                              const SizedBox(width: 5),
                              Container(
                                  height: 80,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset("assets/P4.png",
                                      fit: BoxFit.cover))
                            ]),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 5),
                                child: Text("Clothing",
                                    style: GoogleFonts.raleway(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, left: 20),
                                child: Container(
                                    height: 30,
                                    width: 55,
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 152, 206, 250),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Center(
                                      child: Text("$clothing",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                    )),
                              )
                            ],
                          )
                        ])),
              ),
              const SizedBox(width: 14),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>const Bag())
                  );
                  
                },
                child: Container(
                    height: 220,
                    width: 180,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 203, 202, 202), blurRadius: 5, spreadRadius: 4)
                        ]),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8, left: 8),
                            child: Row(children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset("assets/sho1.png",
                                      fit: BoxFit.cover)),
                              const SizedBox(width: 5),
                              Container(
                                  height: 80,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset("assets/sho2.png",
                                      fit: BoxFit.cover))
                            ]),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8, left: 8),
                            child: Row(children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset("assets/sho4.png",
                                      fit: BoxFit.cover)),
                              const SizedBox(width: 5),
                              Container(
                                  height: 80,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset("assets/sho3.png",
                                      fit: BoxFit.cover))
                            ]),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 5),
                                child: Text("Shoes",
                                    style: GoogleFonts.raleway(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, left: 40),
                                child: Container(
                                    height: 30,
                                    width: 60,
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 152, 206, 250),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Center(
                                      child: Text("$shoes",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                    )),
                              )
                            ],
                          )
                        ])),
              ),
            ]),

            
            const SizedBox(height: 20),
            Row(children: [
              const SizedBox(width: 15),
              Container(
                  height: 220,
                  width: 180,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                              color: Color.fromARGB(255, 203, 202, 202), blurRadius: 5, spreadRadius: 4)
                      ]),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 8, left: 8),
                          child: Row(children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                  height: 80,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                    //color: Colors.red,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset("assets/bag1.jpg",
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(width: 5),
                            Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset("assets/bag2.jpg",
                                    fit: BoxFit.cover))
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8, left: 8),
                          child: Row(children: [
                            Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset("assets/bag3.jpg",
                                    fit: BoxFit.cover)),
                            const SizedBox(width: 5),
                            Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset("assets/bag4.jpg",
                                    fit: BoxFit.cover))
                          ]),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5),
                              child: Text("Bags",
                                  style: GoogleFonts.raleway(
                                      fontSize: 20, fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 53),
                              child: Container(
                                  height: 30,
                                  width: 60,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 152, 206, 250),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                  child: Center(
                                    child: Text("$Bags",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                  )),
                            )
                          ],
                        )
                      ])),
              const SizedBox(width: 15),
              Container(
                  height: 220,
                  width: 180,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                              color: Color.fromARGB(255, 203, 202, 202), blurRadius: 5, spreadRadius: 4)
                      ]),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 8, left: 8),
                          child: Row(children: [
                            Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset("assets/gl5.jpg",
                                    fit: BoxFit.cover)),
                            const SizedBox(width: 5),
                            Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset("assets/gl6.jpg",
                                    fit: BoxFit.cover))
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8, left: 8),
                          child: Row(children: [
                            Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset("assets/gl7.jpg",
                                    fit: BoxFit.cover)),
                            const SizedBox(width: 5),
                            Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset("assets/gl8.jpg",
                                    fit: BoxFit.cover))
                          ]),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5),
                              child: Text("Glasses",
                                  style: GoogleFonts.raleway(
                                      fontSize: 20, fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 30),
                              child: Container(
                                  height: 30,
                                  width: 60,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 152, 206, 250),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                  child: Center(
                                    child: Text("$Glasses",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                  )),
                            )
                          ],
                        )
                      ])),
            ]),
            const SizedBox(height: 20),
            Row(children: [
              const SizedBox(width: 15),
              GestureDetector(
                onTap:()async{
                  
                  QuerySnapshot responce = await FirebaseFirestore.instance.collection("watch").get();
                  data.clear();
                  for(int i=0; i<responce.docs.length;i++){
                    data.add(
                      homeModel(
                        name:responce.docs[i]["name"],
                        image:responce.docs[i]["image"],
                        price:responce.docs[i]["price"],
                        favo:responce.docs[i]["favo"],
                        proName:responce.docs[i]["proName"],
                        id:responce.docs[i].id,
                      )
                    );
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>cloting(data:data,name:"watch"))
                  );
                },
                child: Container(
                    height: 220,
                    width: 180,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                                color: Color.fromARGB(255, 203, 202, 202), blurRadius: 5, spreadRadius: 4)
                        ]),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8, left: 8),
                            child: Row(children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                    //color: Colors.red,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset("assets/watch1.png",
                                      fit: BoxFit.cover)),
                              const SizedBox(width: 5),
                              Container(
                                  height: 80,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset("assets/watch2.png",
                                      fit: BoxFit.cover))
                            ]),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8, left: 8),
                            child: Row(children: [
                              Container(
                                  height: 80,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset("assets/watch3.png",
                                      fit: BoxFit.cover)),
                              const SizedBox(width: 5),
                              Container(
                                  height: 80,
                                  width: 80,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                  clipBehavior: Clip.antiAlias,
                                  child: Image.asset("assets/watch4.png",
                                      fit: BoxFit.cover))
                            ]),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5, left: 5),
                                child: Text("Watch",
                                    style: GoogleFonts.raleway(
                                        fontSize: 20, fontWeight: FontWeight.bold)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0, left: 40),
                                child: Container(
                                    height: 30,
                                    width: 60,
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 152, 206, 250),
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(10))),
                                    child: Center(
                                      child: Text("$Watch",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                    )),
                              )
                            ],
                          )
                        ])),
              ),
              const SizedBox(width: 15),
              Container(
                  height: 220,
                  width: 180,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                              color: Color.fromARGB(255, 203, 202, 202), blurRadius: 5, spreadRadius: 4)
                      ]),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 8, left: 8),
                          child: Row(children: [
                            Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset("assets/hoo4.png",
                                    fit: BoxFit.cover)),
                            const SizedBox(width: 5),
                            Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset("assets/hoo3.png",
                                    fit: BoxFit.cover))
                          ]),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8, left: 8),
                          child: Row(children: [
                            Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset("assets/hoo2.png",
                                    fit: BoxFit.cover)),
                            const SizedBox(width: 5),
                            Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                clipBehavior: Clip.antiAlias,
                                child: Image.asset("assets/hoo1.png",
                                    fit: BoxFit.cover))
                          ]),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5),
                              child: Text("Hoodies",
                                  style: GoogleFonts.raleway(
                                      fontSize: 20, fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 27),
                              child: Container(
                                  height: 30,
                                  width: 60,
                                  decoration: const BoxDecoration(
                                      color: Color.fromARGB(255, 152, 206, 250),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                  child: Center(
                                    child: Text("$Hoodies",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                  )),
                            )
                          ],
                        )
                      ]
                  )
              ),
            ]
          ),
      
          Padding(
            padding: const EdgeInsets.only(top:30,left:15),
            child: Text(
              "Top Products",
              style:GoogleFonts.raleway(
                fontSize:25,
                fontWeight:FontWeight.bold
              )
            ),
          ),
           Row(children: [
              Padding(
        padding: EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap:(){
            context.goNamed("subHome");
          },
          child: Container(
              height: 65,
              width: 65,
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, ),
              clipBehavior:Clip.antiAlias,
              child: Image.asset("assets/bag1.jpg",fit:BoxFit.cover)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
            height: 65,
            width: 65,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, ),
            clipBehavior:Clip.antiAlias,
            child: Image.asset("assets/watch1.png",fit:BoxFit.cover)),
      ),
      Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
            height: 65,
            width: 65,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, ),
            clipBehavior:Clip.antiAlias,
            child: Image.asset("assets/sho1.png",fit:BoxFit.cover)),
      ),
      Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
            height: 65,
            width: 65,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, ),
            clipBehavior:Clip.antiAlias,
            child: Image.asset("assets/hoo1.png",fit:BoxFit.cover)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 65,
            width: 65,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, ),
            clipBehavior:Clip.antiAlias,
            child: Image.asset("assets/gl6.jpg",fit:BoxFit.cover)),
      ),
            ]),
      
             Row(
               children: [
                 Padding(
                    padding: const EdgeInsets.only(top:30,left:15,bottom:15),
                    child: Text(
                  "Flash Sale",
                    style:GoogleFonts.raleway(
                    fontSize:25,
                    fontWeight:FontWeight.bold
                  )
                          ),
                         ),
      
                   Padding(
                    padding: const EdgeInsets.only(top:30,left:145,bottom:15),
                    child: Text(
                  "See all",
                    style:GoogleFonts.raleway(
                    fontSize:15,
                    fontWeight:FontWeight.bold
                  )
                ),
              ),
      
                  GestureDetector(
                    onTap:()async{
                        await dis.disc(1);
                         Navigator.push(
                            context,
                         MaterialPageRoute(builder: (context) => const FlashSale()),
                       );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top:15,left:10),
                      child: Container(
                        height:37,
                        width:37,
                        decoration:const BoxDecoration(
                          color:Colors.blue,
                          shape:BoxShape.circle
                        ),
                        child:const Center(
                          child:Icon(Icons.arrow_right,color:Colors.white,weight:50)
                        )
                        
                      ),
                    ),
                  )
      
               ],
             ),
      
          Padding(
            padding: const EdgeInsets.only(left:15,right:15,bottom:10),
            child: Row(
              children:[
                Stack(
                  children:[
                   Container(
                    height:110,
                    width:110,
                    decoration:const BoxDecoration(
                    color:Colors.white,
                      borderRadius:BorderRadius.all(Radius.circular(10),),
                      boxShadow:[
                        BoxShadow(
                          color:Colors.grey,
                          blurRadius:10
                        )
                      ]
                    )
                  ),
                  Positioned(
                    top:8,
                    left:7,
                    child: Container(
                      height:95,
                      width:95,
                      decoration:const BoxDecoration(
                     
                      borderRadius:BorderRadius.all(Radius.circular(10))
                    ),
                    clipBehavior:Clip.antiAlias,
                    child:Image.asset("assets/fs1.png",fit:BoxFit.cover)
                    ),
                  ),
      
                  Positioned(
                    top:5,
                    left:65 ,
                    child: Container(
                      height:20,
                      width:39,
                      decoration:const BoxDecoration(
                        color:Color.fromARGB(255, 231, 20, 90),
                        borderRadius:BorderRadius.all(Radius.circular(10))
                      ),
                      child:Center(
                        child:Text(
                          "-20%",
                          style:GoogleFonts.raleway(
                            color:Colors.white,
                            fontWeight:FontWeight.bold
                          )
                        )
                      )
                      
                    ),
                  )
                  
                  ]
                ),
      
              const SizedBox(width:14.3),
              Stack(
                  children:[
                   Container(
                    height:110,
                    width:110,
                    decoration:const BoxDecoration(
                    color:Colors.white,
                      borderRadius:BorderRadius.all(Radius.circular(10),),
                      boxShadow:[
                        BoxShadow(
                          color:Colors.grey,
                          blurRadius:10
                        )
                      ]
                    )
                  ),
                  Positioned(
                    top:8,
                    left:7,
                    child: Container(
                      height:95,
                      width:95,
                      decoration:const BoxDecoration(
                     
                      borderRadius:BorderRadius.all(Radius.circular(10))
                    ),
                    clipBehavior:Clip.antiAlias,
                    child:Image.asset("assets/fs2.png",fit:BoxFit.cover)
                    ),
                  ),
      
                  Positioned(
                    top:5,
                    left:65 ,
                    child: Container(
                      height:20,
                      width:39,
                      decoration:const BoxDecoration(
                        color:Color.fromARGB(255, 231, 20, 90),
                        borderRadius:BorderRadius.all(Radius.circular(10))
                      ),
                      child:Center(
                        child:Text(
                          "-20%",
                          style:GoogleFonts.raleway(
                            color:Colors.white,
                            fontWeight:FontWeight.bold
                          )
                        )
                      )
                      
                    ),
                  )
                  
                  ]
                ),
                const SizedBox(width:14.3),
                Stack(
                  children:[
                   Container(
                    height:110,
                    width:110,
                    decoration:const BoxDecoration(
                    color:Colors.white,
                      borderRadius:BorderRadius.all(Radius.circular(10),),
                      boxShadow:[
                        BoxShadow(
                          color:Colors.grey,
                          blurRadius:10
                        )
                      ]
                    )
                  ),
                  Positioned(
                    top:8,
                    left:7,
                    child: Container(
                      height:95,
                      width:95,
                      decoration:const BoxDecoration(
                     
                      borderRadius:BorderRadius.all(Radius.circular(10))
                    ),
                    clipBehavior:Clip.antiAlias,
                    child:Image.asset("assets/fs3.png",fit:BoxFit.cover)
                    ),
                  ),
      
                  Positioned(
                    top:5,
                    left:65 ,
                    child: Container(
                      height:20,
                      width:39,
                      decoration:const BoxDecoration(
                        color:Color.fromARGB(255, 231, 20, 90),
                        borderRadius:BorderRadius.all(Radius.circular(10))
                      ),
                      child:Center(
                        child:Text(
                          "-20%",
                          style:GoogleFonts.raleway(
                            color:Colors.white,
                            fontWeight:FontWeight.bold
                          )
                        )
                      )
                      
                    ),
                  )
                  
                  ]
                ),
      
      
              ]
            ),
          ),
      
          Padding(
            padding: const EdgeInsets.only(left:15,right:15),
            child: Row(
              children:[
                Stack(
                  children:[
                   Container(
                    height:110,
                    width:110,
                    decoration:const BoxDecoration(
                    color:Colors.white,
                      borderRadius:BorderRadius.all(Radius.circular(10),),
                      boxShadow:[
                        BoxShadow(
                          color:Colors.grey,
                          blurRadius:10
                        )
                      ]
                    )
                  ),
                  Positioned(
                    top:8,
                    left:7,
                    child: Container(
                      height:95,
                      width:95,
                      decoration:const BoxDecoration(
                     
                      borderRadius:BorderRadius.all(Radius.circular(10))
                    ),
                    clipBehavior:Clip.antiAlias,
                    child:Image.asset("assets/fs4.png",fit:BoxFit.cover)
                    ),
                  ),
      
                  Positioned(
                    top:5,
                    left:65 ,
                    child: Container(
                      height:20,
                      width:39,
                      decoration:const BoxDecoration(
                        color:Color.fromARGB(255, 231, 20, 90),
                        borderRadius:BorderRadius.all(Radius.circular(10))
                      ),
                      child:Center(
                        child:Text(
                          "-20%",
                          style:GoogleFonts.raleway(
                            color:Colors.white,
                            fontWeight:FontWeight.bold
                          )
                        )
                      )
                      
                    ),
                  )
                  
                  ]
                ),
      
              const SizedBox(width:14.3),
              Stack(
                  children:[
                   Container(
                    height:110,
                    width:110,
                    decoration:const BoxDecoration(
                    color:Colors.white,
                      borderRadius:BorderRadius.all(Radius.circular(10),),
                      boxShadow:[
                        BoxShadow(
                          color:Colors.grey,
                          blurRadius:10
                        )
                      ]
                    )
                  ),
                  Positioned(
                    top:8,
                    left:7,
                    child: Container(
                      height:95,
                      width:95,
                      decoration:const BoxDecoration(
                     
                      borderRadius:BorderRadius.all(Radius.circular(10))
                    ),
                    clipBehavior:Clip.antiAlias,
                    child:Image.asset("assets/fs5.png",fit:BoxFit.cover)
                    ),
                  ),
      
                  Positioned(
                    top:5,
                    left:65 ,
                    child: Container(
                      height:20,
                      width:39,
                      decoration:const BoxDecoration(
                        color:Color.fromARGB(255, 231, 20, 90),
                        borderRadius:BorderRadius.all(Radius.circular(10))
                      ),
                      child:Center(
                        child:Text(
                          "-20%",
                          style:GoogleFonts.raleway(
                            color:Colors.white,
                            fontWeight:FontWeight.bold
                          )
                        )
                      )
                      
                    ),
                  )
                  
                  ]
                ),
                const SizedBox(width:14.3),
                Stack(
                  children:[
                   Container(
                    height:110,
                    width:110,
                    decoration:const BoxDecoration(
                    color:Colors.white,
                      borderRadius:BorderRadius.all(Radius.circular(10),),
                      boxShadow:[
                        BoxShadow(
                          color:Colors.grey,
                          blurRadius:10
                        )
                      ]
                    )
                  ),
                  Positioned(
                    top:8,
                    left:7,
                    child: Container(
                      height:95,
                      width:95,
                      decoration:const BoxDecoration(
                     
                      borderRadius:BorderRadius.all(Radius.circular(10))
                    ),
                    clipBehavior:Clip.antiAlias,
                    child:Image.asset("assets/fs6.png",fit:BoxFit.cover)
                    ),
                  ),
      
                  Positioned(
                    top:5,
                    left:65 ,
                    child: Container(
                      height:20,
                      width:39,
                      decoration:const BoxDecoration(
                        color:Color.fromARGB(255, 231, 20, 90),
                        borderRadius:BorderRadius.all(Radius.circular(10))
                      ),
                      child:Center(
                        child:Text(
                          "-20%",
                          style:GoogleFonts.raleway(
                            color:Colors.white,
                            fontWeight:FontWeight.bold
                          )
                        )
                      )   
                    ),
                    )  
                  ]
                ),

              ]
            ),
          )
        ]
        ),

        bottomNavigationBar:Container(
          height:60,
          decoration:const BoxDecoration(
                 color:Color.fromARGB(255, 255, 255, 255),
            borderRadius:BorderRadius.only(topLeft:Radius.circular(25),topRight:Radius.circular(25)),
            //border:Border(top:BorderSide(color:Colors.black), ),
           boxShadow: [
                        BoxShadow(
                              color: Color.fromARGB(255, 203, 202, 202), blurRadius: 5, spreadRadius: 4)
                      ]
          ),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children:[
              Padding(  
                padding: const EdgeInsets.only(top:17,right:20,left:15),
                child: Column(
                  children: [
                    Center(
                      child: Icon(
                        Icons.home_outlined,
                        color: Colors.blue,
                        size: 30, 
                      ),
                    ),
                    Container(
                      height:5,
                      width:20,
                      color:Colors.blue,
                    )
                  ],
                ),
              ),
                GestureDetector(
                  onTap:(){
                    Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => like()),
                      (Route<dynamic> route) => false,
                  );
                  },
                  child: Padding(
                  padding: EdgeInsets.only(left:0.0,top:7,right:30),
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
                                ),
                ),
               GestureDetector(
                onTap:()async{

                    

                    Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => mainModule()),
                      (Route<dynamic> route) => false,
                  );
                  },
                 child: Padding(
                  padding: EdgeInsets.only(left:0.0,top:7,right:30),
                  child: Icon(
                    Icons.article_outlined,
                    color: Colors.black,                    
                    size: 27,
                  ),
                               ),
               ),
               GestureDetector(
                onTap:(){
                  Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => AddToCartWidget()),
                      (Route<dynamic> route) => false,
                  );
                },
                 child: Padding(
                  padding: EdgeInsets.only(left:0.0,top:7,right:20),
                  child: Icon(
                    Icons.card_travel,
                    color: Colors.black,
                    size: 25,
                  ),
                               ),
               ),
              GestureDetector(
                onTap:(){
                 Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                      (Route<dynamic> route) => false,
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left:0.0,top:7,right:20),
                  child: Icon(
                    Icons.person,
                    color: Colors.black,
                    size: 29,
                  ),
                ),
              ),


            ]
          )
        ) 
        
      );
      }
    );
  }
}
