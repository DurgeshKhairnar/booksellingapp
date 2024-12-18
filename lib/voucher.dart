import "package:flutter/material.dart";
//import 'package:flutter_svg/flutter_svg.dart';
import "package:google_fonts/google_fonts.dart";
import "package:grouponproject/durgesh/addto_cart.dart";
import "package:grouponproject/durgesh/like.dart";
import "package:grouponproject/home/homePage.dart";
import "package:grouponproject/mainModule/mainModule.dart";
import "package:grouponproject/profile_page.dart";  
import "Settings.dart";


class Voucher extends StatefulWidget {
  const Voucher({super.key});

  @override
  State createState() => _Voucher();
}

class _Voucher extends State {
  bool flag = true;
  @override
  Widget build(BuildContext constext) {

  if(flag == true){
    
    return Scaffold(
      backgroundColor:Colors.white,
        appBar: AppBar(
          backgroundColor:Colors.white,
            flexibleSpace: Row(children: [
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
                        fit: BoxFit.cover)),
                const SizedBox(width: 20),
                Container(
                    decoration: const BoxDecoration(
                        //color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child:  Center(
                        child: Text(
                      "Voucher",
                      style: GoogleFonts.raleway(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    )))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 45, left: 60),
            child: Row(children: [
              Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 33, 79, 243)),
                  child: GestureDetector(
                      child: const Icon(Icons.discount_outlined,
                          color: Colors.white),
                      onTap: () {

                        
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
                      onTap: () {})),
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
            
        body:Column(
          children:[
            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children:[
                  Container(
                    height:40,
                    width:180,
                    decoration: const BoxDecoration(
                       color:Color.fromRGBO(192, 208, 247, 0.612),
                       borderRadius:BorderRadius.all(Radius.circular(20))
                    ),
                    child:const Center(
                      child:Text(
                        "Active Rewards",
                        style:TextStyle(
                          color:Color.fromARGB(255, 33, 79, 243),
                           fontSize:18,
                        )
                      )
                    ),
                  ),
                  GestureDetector(
                    onTap:(){
                      flag = false;
                      setState((){});
                    },
                    child: Container(
                      height:40,
                      width:180,
                      decoration: const BoxDecoration(
                         color:Color.fromRGBO(233, 233, 235, 0.612),
                         borderRadius:BorderRadius.all(Radius.circular(20))
                      ),
                      child:const Center(
                        child:Text(
                          "Progress",
                          style:TextStyle(
                            color:Colors.black,
                            fontSize:18,
                          )
                        )
                      ),
                    ),
                  )
                ]
              ),
            ),
            const SizedBox(
              height:20
            ),
            Container(
              height:125,
              width:370,
              decoration: BoxDecoration(
                color:const Color.fromARGB(255, 255, 246, 246),
                borderRadius:const BorderRadius.all(
                  Radius.circular(13),
                ),
                border:Border.all(
                  color:const Color.fromARGB(255, 240, 166, 161),
                  width:2
                )
              ),
              child:Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:[
                  Padding(
                    padding: const EdgeInsets.only(left:15,top:7),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Voucher",
                              style:GoogleFonts.raleway(
                                color:const Color.fromARGB(255, 245, 120, 112),
                                fontWeight:FontWeight.bold,
                                fontSize : 20
                              ) 
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Text(
                              "1 day left",
                               style:GoogleFonts.raleway(
                                color:const Color.fromARGB(255, 245, 120, 112),
                                fontWeight:FontWeight.w600,
                                fontSize : 12
                              ) 
                            ),
                            const SizedBox(
                              width:10
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: Container(
                                height:25,
                                width:80,
                                 decoration:const BoxDecoration(
                                    color:Color.fromARGB(255, 244, 150, 143),
                                    borderRadius:BorderRadius.all(Radius.circular(5))
                                ),
                                child:const Center(
                                  child: Text(
                                    "Valid up to 2024",
                                    style:TextStyle(
                                      fontSize:10,  
                                    )
                                  ),
                                )
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height:20
                  ),
                   Row(
                    children: [
                      const SizedBox(
                        width :10
                      ),
                      const Icon(
                        Icons.shop,
                        color:Colors.blue
                      ),
                       const SizedBox(
                        width :8
                      ),
                       Text(
                        "First Purches",
                        style:GoogleFonts.raleway(
                          fontWeight:FontWeight.bold,
                          fontSize:20
                        )
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "5% off for your next order",
                          style:TextStyle(
                            fontSize:13,
                            fontWeight : FontWeight.w500  
                          )
                        ),
                        Container(
                          height:30,
                          width:100,
                          decoration:const BoxDecoration(
                            color:Color.fromARGB(255, 33, 79, 243),
                            borderRadius:BorderRadius.all(Radius.circular(10))
                          ),
                          child:Center(
                            child:  Text(
                              "Collected",
                              style:GoogleFonts.raleway(
                                color:Colors.white
                              )
                            ),
                          )
                        )
                      ],
                    ),
                  )
                ]
              )
            ),
            const SizedBox(
              height:20
            ),
            Container(
              height:125,
              width:370,
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius:const BorderRadius.all(
                  Radius.circular(13),
                ),
                border:Border.all(
                   color:const Color.fromARGB(255, 33, 79, 243),
                  width:2
                )
              ),
              child:Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:[
                  Padding(
                    padding: const EdgeInsets.only(left:15,top:7),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Voucher",
                              style:GoogleFonts.raleway(
                                color:const Color.fromARGB(255, 33, 79, 243),
                                fontWeight:FontWeight.bold,
                                fontSize : 20
                              ) 
                            ),
                          ],
                        ),

                        Row(
                          children: [
                           
                            Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: Container(
                                height:25,
                                width:80,
                                 decoration:const BoxDecoration(
                                    color:Color.fromARGB(255, 234, 250, 255),
                                    borderRadius:BorderRadius.all(Radius.circular(5))
                                ),
                                child:const Center(
                                  child: Text(
                                    "Valid up to 2025",
                                    style:TextStyle(
                                      fontSize:10,  
                                    )
                                  ),
                                )
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height:20
                  ),
                   Row(
                    children: [
                      const SizedBox(
                        width :10
                      ),
                      const Icon(
                        Icons.shop,
                        color:Colors.blue
                      ),
                       const SizedBox(
                        width :8
                      ),
                       Text(
                        "Gift From Customer care",
                        style:GoogleFonts.raleway(
                          fontWeight:FontWeight.bold,
                          fontSize:20
                        )
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "10% off for your next order",
                          style:TextStyle(
                            fontSize:13,
                            fontWeight : FontWeight.w500  
                          )
                        ),
                        GestureDetector(
                          onTap:(){

                          },
                          child: Container(
                            height:30,
                            width:100,
                            decoration:const BoxDecoration(
                              color:Color.fromARGB(255, 33, 79, 243),
                              borderRadius:BorderRadius.all(Radius.circular(10))
                            ),
                            child:Center(
                              child:  Text(
                                "Collected",
                                style:GoogleFonts.raleway(
                                  color:Colors.white
                                )
                              ),
                            )
                          ),
                        )
                      ],
                    ),
                  )
                ]
              )
            )
          ]
        ),

        bottomNavigationBar:Container(
          height:60,
          decoration:const BoxDecoration(
                 color:Color.fromARGB(255, 255, 255, 255),
            borderRadius:BorderRadius.only(topLeft:Radius.circular(25),topRight:Radius.circular(25))

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
  else{
    return Scaffold(
      backgroundColor:Colors.white,
        appBar: AppBar(
          backgroundColor:Colors.white,
            flexibleSpace: Row(children: [
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
                        fit: BoxFit.cover)),
                const SizedBox(width: 20),
                Container(
                    decoration: const BoxDecoration(
                        //color: Colors.blue,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child:  Center(
                        child: Text(
                      "Voucher",
                      style: GoogleFonts.raleway(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    )))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 45, left: 60),
            child: Row(children: [
              Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 33, 79, 243)),
                  child: GestureDetector(
                      child: const Icon(Icons.discount_outlined,
                          color: Colors.white),
                      onTap: () {

                        
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
                      onTap: () {})),
              const SizedBox(width: 10),
              Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(192, 208, 247, 0.612)),
                  child: GestureDetector(
                      child: const Icon(Icons.settings_outlined,
                          color: Color.fromARGB(255, 33, 79, 243)),
                      onTap: () {}))
            ]),
          )
        ])),
            
        body:Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children:[
            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                children:[
                  GestureDetector(
                    onTap:(){
                      flag = true;
                      setState((){});
                    },
                    child: Container(
                      height:40,
                      width:180,
                      decoration: const BoxDecoration(
                         color:Color.fromRGBO(233, 233, 235, 0.612),
                         //color:Color.fromRGBO(192, 208, 247, 0.612),
                         borderRadius:BorderRadius.all(Radius.circular(20))
                      ),
                      child:const Center(
                        child:Text(
                          "Active Rewards",
                          style:TextStyle(
                            color:Colors.black,
                             fontSize:18,
                          )
                        )
                      ),
                    ),
                  ),
                  Container(
                    height:40,
                    width:180,
                    decoration: const BoxDecoration(
                       color:Color.fromRGBO(192, 208, 247, 0.612),
                       borderRadius:BorderRadius.all(Radius.circular(20))
                    ),
                    child:const Center(
                      child:Text(
                        "Progress",
                        style:TextStyle(
                          color:Color.fromARGB(255, 33, 79, 243),
                          fontSize:18,
                        )
                      )
                    ),
                  )
                ]
              ),
            ),


            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:30,left:30),
                  child: SizedBox(
                    height:220,
                    width:150,
                    //color:Colors.amber,
                    child:Column(
                      children:[
                        Stack(
                          children:[ Container(
                            height:90,
                            width:90,
                            decoration:const BoxDecoration(
                              boxShadow: [
                                  BoxShadow(
                                    color:Colors.grey,
                                    blurRadius:10,
                                    spreadRadius:5,
                                  )
                              ],
                              color:Color.fromARGB(255, 230, 230, 230),
                              shape:BoxShape.circle,
                              
                            ),
                          ),
                          Positioned(
                            top:10,
                            left:10,
                            child: Container(
                                height:70,
                                width:70,
                                decoration:BoxDecoration(
                                     color:Colors.white,
                                     shape:BoxShape.circle,
                                     border:Border.all(
                                        color:Colors.blue,
                                        width:2
                                     )
                                ),
                                child:const Icon(
                                  Icons.shop,color:Color.fromARGB(255, 33, 68, 243),
                                  
                                )
                                               
                              ),
                          ),
                          ]
                        ),
                        const Padding(
                          padding:  EdgeInsets.only(top:10),
                          child:  Text(
                            "First Purchase",
                            style:TextStyle(
                              fontWeight:FontWeight.bold,
                              fontSize:18
                            )
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left:8,right:8),
                          child:  Expanded(
                            child: Text(
                              " explore our collection and make your first buy extra special with a fantastic discount.",
                              style:TextStyle(
                                fontSize:13
                              )
                            ),
                          ),
                        )
                      ]
                    )
                  
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:30,left:50),
                  child: SizedBox(
                    height:220,
                    width:150,
                    //color:Colors.amber,
                    child:Column(
                      children:[
                        Stack(
                          children:[ Container(
                            height:90,
                            width:90,
                            decoration:const BoxDecoration(
                              boxShadow: [
                                  BoxShadow(
                                    color:Colors.grey,
                                    blurRadius:10,
                                    spreadRadius:5,
                                  )
                              ],
                              color:Color.fromARGB(255, 230, 230, 230),
                              shape:BoxShape.circle,
                              
                            ),
                          ),
                          Positioned(
                            top:10,
                            left:10,
                            child: Container(
                                height:70,
                                width:70,
                                decoration:BoxDecoration(
                                     color:Colors.white,
                                     shape:BoxShape.circle,
                                     border:Border.all(
                                        color:Colors.blue,
                                        width:2
                                     )
                                ),
                                child:const Icon(
                                  Icons.favorite,color:Color.fromARGB(255, 33, 68, 243), 
                                )                   
                              ),
                          ),
                          ]
                        ),
                        const Padding(
                          padding:  EdgeInsets.only(top:10),
                          child:  Text(
                            "Layal Customer",
                            style:TextStyle(
                              fontWeight:FontWeight.bold,
                              fontSize:18
                            )
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left:8,right:8),
                          child:  Expanded(
                            child: Text(
                              "Thank you for being a loyal customer! Your continued support means the world to us",
                              style:TextStyle(
                                fontSize:13
                              )
                            ),
                          ),
                        )
                      ]
                    )
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:30,left:30),
                  child: SizedBox(
                    height:220,
                    width:150,
                    //color:Colors.amber,
                    child:Column(
                      children:[
                        Stack(
                          children:[ Container(
                            height:90,
                            width:90,
                            decoration:const BoxDecoration(
                              boxShadow: [
                                  BoxShadow(
                                    color:Colors.grey,
                                    blurRadius:10,
                                    spreadRadius:5,
                                  )
                              ],
                              color:Color.fromARGB(255, 230, 230, 230),
                              shape:BoxShape.circle,
                              
                            ),
                          ),
                          Positioned(
                            top:10,
                            left:10,
                            child: Container(
                                height:70,
                                width:70,
                                decoration:BoxDecoration(
                                     color:Colors.white,
                                     shape:BoxShape.circle,
                                     border:Border.all(
                                        color:Colors.blue,
                                        width:2
                                     )
                                ),
                                child:const Icon(
                                  Icons.add_reaction,color:Color.fromARGB(255, 33, 68, 243),
                                  
                                )
                                               
                              ),
                          ),
                          ]
                        ),
                        const Padding(
                          padding:  EdgeInsets.only(top:10),
                          child:  Text(
                            "10+ Orders",
                            style:TextStyle(
                              fontWeight:FontWeight.bold,
                              fontSize:18
                            )
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left:12,right:8),
                          child:  Expanded(
                            child: Text(
                              " gatherings,our bulk order options come exclusive discounts and personalized ",
                              style:TextStyle(
                                fontSize:13
                              )
                            ),
                          ),
                        )
                      ]
                    )
                  
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:30,left:50),
                  child: SizedBox(
                    height:220,
                    width:150,
                    //color:Colors.amber,
                    child:Column(
                      children:[
                        Stack(
                          children:[ Container(
                            height:90,
                            width:90,
                            decoration:const BoxDecoration(
                              boxShadow: [
                                  BoxShadow(
                                    color:Colors.grey,
                                    blurRadius:10,
                                    spreadRadius:5,
                                  )
                              ],
                              color:Color.fromARGB(255, 230, 230, 230),
                              shape:BoxShape.circle,
                              
                            ),
                          ),
                          Positioned(
                            top:10,
                            left:10,
                            child: Container(
                                height:70,
                                width:70,
                                decoration:BoxDecoration(
                                     color:Colors.white,
                                     shape:BoxShape.circle,
                                     border:Border.all(
                                        color:Colors.blue,
                                        width:2
                                     )
                                ),
                                child:const Icon(
                                  Icons.star,color:Color.fromARGB(255, 33, 68, 243), 
                                )                   
                              ),
                          ),
                          ]
                        ),
                        const Padding(
                          padding:  EdgeInsets.only(top:10),
                          child:  Text(
                            "Review Maker",
                            style:TextStyle(
                              fontWeight:FontWeight.bold,
                              fontSize:18
                            )
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left:8,right:8),
                          child:  Expanded(
                            child: Text(
                              "Give your feedback a voice with our easy-to-use review maker! Whether you’re",
                              style:TextStyle(
                                fontSize:13
                              )
                            ),
                          ),
                        )
                      ]
                    )
                  ),
                ),
              ],
            ),



          ]
        ),

        bottomNavigationBar:Container(
          height:60,
          decoration:const BoxDecoration(
                 color:Color.fromARGB(255, 255, 255, 255),
            borderRadius:BorderRadius.only(topLeft:Radius.circular(25),topRight:Radius.circular(25))

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
}
