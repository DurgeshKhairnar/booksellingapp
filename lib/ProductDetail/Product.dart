import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:grouponproject/durgesh/payment.dart";
import "package:grouponproject/home/homeModel.dart";

class Product extends StatefulWidget {
  const Product(
      {super.key,
      data,
      required this.proInfo,
      required this.no,
      required this.name});
  final homeModel proInfo;
  final int no;
  final String name;

  get title => null;
  @override
  State createState() => _Product(proInfo: proInfo, no: no, name: name);

  static fromMap(Map<String, dynamic> product) {}
}

class _Product extends State {
  Map<String, dynamic> data = {};

  addToGroup() {
    FirebaseFirestore.instance.collection("Groups").add(data);
  }

  convertor() {
    data.clear();
    data = proInfo.datawa();
    data['index'] = no;
    data['noOfBuy'] = 1;
  }

  _Product({required this.proInfo, required this.no, required this.name});
  final homeModel proInfo;
  final int no;
  String name;

  List<Widget> prod = [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10, left: 15),
          child: Text("Material",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Row(children: [
            Container(
                height: 30,
                width: 90,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 235, 235, 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: const Center(child: Text("Cotton 95%"))),
            const SizedBox(width: 15),
            Container(
                height: 30,
                width: 80,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 235, 235, 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: const Center(child: Text("Nylon 5%")))
          ]),
        ),
      ],
    ),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10, left: 15),
          child: Text("Material",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Row(children: [
            Container(
                height: 30,
                width: 90,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 235, 235, 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: const Center(child: Text("Steel 95%"))),
            const SizedBox(width: 15),
            Container(
                height: 30,
                width: 80,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 235, 235, 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: const Center(child: Text("Silver 5%")))
          ]),
        ),
      ],
    ),
  ];

  // storeData(){
  //   FirebaseFirestore.instance.collection("watch").add();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          Container(
              height: 480,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 0, 0, 0),
                    blurStyle: BlurStyle.outer,
                    //spreadRadius:2,
                    blurRadius: 20)
              ]),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(proInfo.image, fit: BoxFit.fill)),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15),
            child: Row(
              children: [
                Text(
                  "\u20B9 ${proInfo.price}",
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
                const SizedBox(width: 130),
                Container(
                    height: 40,
                    width: 130,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 55, 54, 54),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Center(
                      child: Text(proInfo.name,
                          style: const TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold)),
                    ))
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: SizedBox(
              height: 70,
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam arcu mauris, scelerisque eu mauris id, pretium pulvinar sapien.",
                  style: TextStyle(fontSize: 15)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15),
            child: Row(children: [
              Text("Variations",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(width: 20),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 15),
            child: Row(children: [
              Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              const SizedBox(width: 20),
              Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
              const SizedBox(width: 20),
              Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.all(Radius.circular(10))))
            ]),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 15),
            child: Text("Specification",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
          ),
          if (name == "cloths") prod[0],
          if (name == "watch") prod[1],
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 15),
            child: Text("Origin",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 330),
            child: Container(
                height: 30,
                width: 90,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(229, 235, 252, 1),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: const Center(child: Text("EU"))),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 15),
            child: Text("Delivery",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(color: Colors.blue)),
                child: Row(children: [
                  const SizedBox(width: 20),
                  const Text("Standerd", style: TextStyle(fontSize: 17)),
                  const SizedBox(width: 10),
                  Container(
                      height: 25,
                      width: 80,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 234, 243, 249),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Center(
                          child: Text("2-3 days",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 1, 101, 182))))),
                  const SizedBox(width: 120),
                  const Text("free",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
                ])),
          )
        ]),
        bottomNavigationBar: Container(
            height: 70,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 236, 235, 235),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: const Icon(Icons.shopping_cart_outlined)),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () async {
                    bool flag = false;

                    convertor();
                    // print(data);
                    QuerySnapshot responce = await FirebaseFirestore.instance
                        .collection("Groups")
                        .get();

                    print(
                        "------------------------------------------------------------------------");
                    print(responce.docs);
                    int position = 0;
                    for (int i = 0; i < responce.docs.length; i++) {
                      if (responce.docs[i]["index"] == data["index"]) {
                        flag = true;
                        position = i;
                      }
                    }

                    print(position);
                    print(
                        "------------------------------------------------------------------------");

                    int count = 1;
                    String? str;
                    if (flag == true) {
                      str = responce.docs[position].id;
                      count = responce.docs[position]["noOfBuy"];

                      if (count <= 4) {
                        count++;
                        FirebaseFirestore.instance
                            .collection("Groups")
                            .doc(str)
                            .update({
                          "noOfBuy": count,
                        });

                        const snackBar = SnackBar(
                          content: Text('you are added on Previous Group!'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        count = 1;
                        addToGroup();

                        const snackBar = SnackBar(
                          content: Text('new Group!'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    } else {
                      count = 1;
                      addToGroup();

                      const snackBar = SnackBar(
                        content: Text('new Group!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Container(
                      height: 50,
                      width: 140,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: const Center(
                          child: Text("Add to Group",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)))),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    String data1;
                    String data2;

                    if (name == "watch") {
                      data1 = "Steel";
                      data2 = "Best Watch";
                    } else {
                      data1 = "M";
                      data2 = "Cotton";
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Payment(
                                proInfo: proInfo,
                                disc: 20,
                                data1: data1,
                                data3: data2)));
                  },
                  child: Container(
                      height: 50,
                      width: 140,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: const Center(
                          child: Text("Buy now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)))),
                )
              ]),
            )));
  }
}
