
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:grouponproject/delivary.dart";
import "package:grouponproject/durgesh/addto_cart.dart";
import "package:grouponproject/durgesh/like.dart";
import "package:grouponproject/home/homePage.dart";
import "package:grouponproject/mainModule/mainModule.dart";
import "package:grouponproject/pieChart/pieChart.dart";
import "package:grouponproject/re/review.dart";
import "main.dart";
import "voucher.dart";
import "Settings.dart";

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State createState() => _Profile();
}

class _Profile extends State {
  List<Widget> lv = [
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
          height: 65,
          width: 65,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          clipBehavior:Clip.antiAlias,
          child:Image.asset(
                        "assets/watch1.png",
                        fit: BoxFit.cover)),
    ),
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
          height: 65,
          width: 65,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          clipBehavior:Clip.antiAlias,
          child:Image.asset(
                        "assets/sho2.png",
                        fit: BoxFit.cover)),
    ),
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
          height: 65,
          width: 65,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          clipBehavior:Clip.antiAlias,
          child:Image.asset(
                        "assets/watch3.png",
                        fit: BoxFit.cover)),
    ),
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        
          height: 65,
          width: 65,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          clipBehavior:Clip.antiAlias,
          child:Image.asset(
                        "assets/hoo1.png",
                        fit: BoxFit.cover)),
    ),
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        
          height: 65,
          width: 65,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
          clipBehavior:Clip.antiAlias,
          child:Image.asset(
                        "assets/hoo2.png",
                        fit: BoxFit.cover)),
    ),
  ];

  @override
  Widget build(BuildContext constext) {
    return Scaffold(
      backgroundColor:Colors.white,
        appBar: AppBar(
          backgroundColor:Colors.white,
            flexibleSpace
            : Row(children: [
          Padding(
            padding: const EdgeInsets.only(top: 45, left: 10),
            child: Row(
              children: [
                Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 111, 111, 111),
                              blurStyle: BlurStyle.outer,
                              blurRadius: 20.0)
                        ]),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                        "https://i.pinimg.com/236x/db/1f/9a/db1f9a3eaca4758faae5f83947fa807c.jpg",
                        fit: BoxFit.cover)
                        ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap:(){
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context)=>PiChart())
                    );
                  },
                  child: Container(
                      height: 50,
                      width: 120,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Center(
                          child: Text(
                        "My Activity",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ))),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 45, left: 40),
            child: Row(children: [
              Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(192, 208, 247, 0.612)),
                  child: GestureDetector(
                      child: const Icon(Icons.discount_outlined,
                          color: Color.fromARGB(255, 33, 79, 243)),
                      onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder:(context)=>const Voucher())
                        );
                      })),
              const SizedBox(width: 10),
              Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(192, 208, 247, 0.612)),
                  child: GestureDetector(
                      child: const Icon(Icons.sort,
                          color: Color.fromARGB(255, 33, 79, 243)),
                      onTap: () {
                        
                      })),
              const SizedBox(width: 10),
              GestureDetector(
                onTap:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>const Settings())
                  );
                },
                child: Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(192, 208, 247, 0.612)),
                    child: const Icon(Icons.settings_outlined,
                        color: Color.fromARGB(255, 33, 79, 243))),
              )
            ]),
          )
        ])),





        
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 15, bottom: 20),
            child: Row(children: [
              Text(
                "Hello,",
                style: GoogleFonts.raleway(
                    fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Text(
                data[0]["name"],
                style: GoogleFonts.raleway(
                    fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Text(
                "!!!",
                style: GoogleFonts.raleway(
                    fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ]),
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(width: 15),
            Stack(children: [
              Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 10,
                          blurStyle: BlurStyle.outer)
                    ],
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  child:
                      const Icon(Icons.favorite, size: 40, color: Colors.blue)),
              Positioned(
                right: 0,
                child: Container(
                    height: 22,
                    width: 22,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    child: const Icon(Icons.check, color: Colors.white)),
              ),
            ]),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Padding(
                  padding: EdgeInsets.only(right: 105),
                  child: Text("You just got a reward",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                ),
                SizedBox(
                  height: 40,
                  width: 280,
                  child: Text(
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt",
                      style: TextStyle()),
                )
              ]),
            )
          ]),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text("Recently Viewed",
                style: GoogleFonts.trochut(
                    fontSize: 25, fontWeight: FontWeight.bold)),
          ),
          Row(children: [
            const SizedBox(width:5),
            lv[0],
            lv[1],
            lv[2],
            lv[3],
            lv[4],
          ]),
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text("My Orders",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                 onTap:(){
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=> Payment())
                  );*/
                 },
                child: Container(
                    height: 43,
                    width: 110,
                    decoration:BoxDecoration(
                                 color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20)
                      ),
                     // border:Border.all(color: Colors.white),
                      boxShadow:[
                        BoxShadow(
                          color: const Color.fromARGB(255, 107, 107, 107),
                          blurRadius:6,

                        )
                      ]
                    ),
                    child: const Center(
                      child: Text("To Pay",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                    )),
              ),
              GestureDetector(
                onTap:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>const Delivary())
                  );
                },
                child: Container(
                    height: 43,
                    width: 120,
                    decoration:  BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow:[
                        BoxShadow(
                          color: const Color.fromARGB(255, 107, 107, 107),
                          blurRadius:6
                        )
                      ]),
                    child: const Center(
                      child: Text("To Recieve",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                    )),
              ),
              GestureDetector(
                onTap:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>const HistoryPage())
                  );
                },
                child: Container(
                    height: 43,
                    width: 120,
                    decoration:  BoxDecoration(
                          color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                         boxShadow:[
                        BoxShadow(
                          color: const Color.fromARGB(255, 107, 107, 107),
                          blurRadius:6
                        )
                      ]),
                    child: const Center(
                      child: Text("To Review",
                          style: TextStyle(
                     color:  Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                    )),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top:8,left:15.0),
            child: Text("Stories",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Stack(children: [
                  Container(
                      height: 180,
                      width: 115,
                      decoration: const BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyrG1pMPPbEBCmqbsiMsdYaRtB2klNo8FGyg&s",
                          fit: BoxFit.cover)),
                  Positioned(
                    top: 5,
                    left: 5,
                    child: Container(
                        height: 25,
                        width: 50,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 74, 230, 79),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: const Center(
                          child: Text("Live",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        )),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Container(
                    height: 180,
                    width: 115,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOyn7I-op_iQylQuW_AVpUF5U2N-iNzKfYWw&s",
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Container(
                  height: 180,
                  width: 115,
                  decoration: const BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                      "https://img.freepik.com/free-photo/woman-with-shopping-bags-studio-yellow-background-isolated_1303-14286.jpg?ga=GA1.1.274783701.1718622909&semt=ais_hybrid",
                      fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Container(
                    height: 180,
                    width: 115,
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                        "https://img.freepik.com/premium-photo/female-models-smiling-woman-peeking-into-shopping-bag-adult-woman-posing-with-shopping-bags-abst_1283069-5886.jpg?w=740",
                        fit: BoxFit.cover)),
              ),
            ]),
          )
        ]),

        bottomNavigationBar:Container(
          height:60,
          decoration:const BoxDecoration(
                 color:Color.fromARGB(255, 255, 255, 255),
            borderRadius:BorderRadius.only(topLeft:Radius.circular(25),topRight:Radius.circular(25)),
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
                      child: GestureDetector(
                        onTap:(){
                           Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) =>const homePage()),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: Icon(
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
                onTap:(){
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
                  padding: EdgeInsets.only(left:0.0,top:17,right:20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.blue,
                        size: 29,
                      ),
                      Container(
                         height:5,
                      width:20,
                      color:Colors.blue,
                      )
                    ],
                  ),
                ),
              ),


            ]
          )
        ) 
 

    );
  }
}
