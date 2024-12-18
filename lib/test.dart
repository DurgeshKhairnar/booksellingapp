import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grouponproject/durgesh/bag.dart';


class AnimatedItems extends StatefulWidget {
  const AnimatedItems({super.key});

  @override
  _AnimatedItemsState createState() => _AnimatedItemsState();
}

class _AnimatedItemsState extends State<AnimatedItems> {
  // List<homeModel> data = [];
  double scale = 1.0;
  double opacity = 1.0;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15),
        GestureDetector(
          onTap: () async {
            // setState(() {
            //   scale = 1.1;  // Scale up the container on tap
            //   opacity = 0.8;  // Slight fade effect
            // });
            // QuerySnapshot response = await FirebaseFirestore.instance.collection("cloths").get();
            // data.clear();
            // for (int i = 0; i < response.docs.length; i++) {
            //   data.add(
            //     homeModel(
            //       name: response.docs[i]["name"],
            //       image: response.docs[i]["image"],
            //       price: response.docs[i]["price"],
            //       favo: response.docs[i]["favo"],
            //       proName: response.docs[i]["proName"],
            //       id: response.docs[i].id,
            //     ),
            //   );
            //}
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => ClothingPage(data: data, name: "cloths")),
            // );
            Future.delayed(Duration(milliseconds: 300), () {
              setState(() {
                scale = 1.0;  // Reset the scale back
                opacity = 1.0;  // Reset the opacity back to normal
              });
            });
          },
          child: AnimatedScale(
            scale: scale,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: AnimatedOpacity(
              opacity: opacity,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Container(
                height: 220,
                width: 180,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 203, 202, 202), blurRadius: 5, spreadRadius: 4)
                    ]
                ),
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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset("assets/P1.jpg", fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset("assets/P2.png", fit: BoxFit.cover),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 8),
                      child: Row(children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset("assets/P4.png", fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset("assets/P4.png", fit: BoxFit.cover),
                        ),
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
                          padding: const EdgeInsets.only(top: 8.0, left: 20),
                          child: Container(
                            height: 30,
                            width: 55,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 152, 206, 250),
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: Center(
                              child: Text("20", style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 14),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Bag()));
          },
          child: AnimatedScale(
            scale: scale,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: AnimatedOpacity(
              opacity: opacity,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Container(
                height: 220,
                width: 180,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 203, 202, 202), blurRadius: 5, spreadRadius: 4)
                    ]
                ),
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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset("assets/sho1.png", fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset("assets/sho2.png", fit: BoxFit.cover),
                        ),
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8, left: 8),
                      child: Row(children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset("assets/sho4.png", fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset("assets/sho3.png", fit: BoxFit.cover),
                        ),
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
                          padding: const EdgeInsets.only(top: 8.0, left: 40),
                          child: Container(
                            height: 30,
                            width: 60,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 152, 206, 250),
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                            child: Center(
                              child: Text("200", style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
