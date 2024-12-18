
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouponproject/durgesh/like.dart';
import 'package:grouponproject/home/homePage.dart';
import 'package:grouponproject/profile_page.dart';
import '../mainModule/mainModule.dart';
import './wish_modal.dart';




List<Wish> wishlist = [
  Wish(
    img: "assets/shirt1.jpg",
    title: "Allen Solly",
    prize: 150,
    color: "White",
    size: "M",
  ),
    Wish(img: "assets/shirt2.jpg",
   title: "Allen Solly",
    prize: 150,
     color: "White",
      size: "M",
  ),
  //   Wish(img: "assets/shirt3.jpg",
  //  title: "Allen Solly",
  //   prize: 150,
  //    color: "White",
  //     size: "M",
  // ),
  //  Wish(img: "assets/shirt3.jpg",
  //  title: "Allen Solly",
  //   prize: 150,
  //    color: "White",
  //     size: "M",
  // ),
  
];
class AddToCartWidget extends StatefulWidget {
  const AddToCartWidget({super.key});

  @override
  _AddToCartWidgetState createState() => _AddToCartWidgetState();
}

class _AddToCartWidgetState extends State<AddToCartWidget> {

int count = 1;


List<String> imagepath = [
  "assets/shirt1.jpg",
  "assets/shirt2.jpg",
  "assets/shirt3.jpg",
  "assets/shirt4.jpg",
  "assets/shirt5.jpg",
];

@override
  Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.white,
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
     child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
             SizedBox(
          height: 40,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            "cart",
            style: GoogleFonts.raleway(
                textStyle:
                    TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
          ),
        ),
        (wishlist.isEmpty)? Wish.shopping_bag() : ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemCount: wishlist.length,
            itemBuilder: (context, int index) {
              int prize = wishlist[index].prize;
              int total = prize * count;
              return Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                   width: 70,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                           boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 1
                          )
                         ]
                          ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 122,
                        height: 102,
                        child: Image.asset(wishlist[index].img),
                      ),
                      SizedBox(
                        width: 260,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              wishlist[index].title,
                              style: GoogleFonts.nunitoSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          SizedBox(height: 7,),
                            Row(children: [
                               Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(229,235,252,1),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(wishlist[index].color,style: GoogleFonts.raleway()),
                                  )),
                                  SizedBox(width: 5,),
                              Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(229,235,252,1),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(wishlist[index].size,style: GoogleFonts.raleway(),),
                                  )),
                                  
                            ]),
                            SizedBox(height: 7,),
                        
                              Row(
                               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                  "\u{20B9}$total",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                             SizedBox(width: 100),
                            // Spacer(),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                
                               GestureDetector(
                                onTap: (){
                                  setState(() {
                                      if (count > 1) count--;
                                  });
                                },
                                child:Icon(Icons.remove_circle_outline,color:Color.fromRGBO(0,76,255,1),) ,
                              ),
                              SizedBox(width: 10,),
                              Container(
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(229,235,252,1)
                                ),
                                alignment: Alignment.center,
                                child:Padding(padding:EdgeInsets.all(5), child:  Text("$count")),
                              ),
                              SizedBox(width: 10,),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                      count++;
                                  });
                                },
                                child:Icon(Icons.add_circle_outline,color:Color.fromRGBO(0,76,255,1),) ,
                              ),
                              ],
                             )
                            
                                ],
                              ),
                         
                         
                         
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
        SizedBox(height: 5),
        Row(
          children: [
            SizedBox(width: 20),
            Text(
              "Form Your Wishlist",
              style: GoogleFonts.raleway(
                  textStyle:
                      TextStyle(fontSize: 21, fontWeight: FontWeight.w700)),
            ),    
          ],
        ),
        SizedBox(
        height: 250,
              child:
            ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            itemCount: wishlist.length,
            itemBuilder: (context, int index) {
              return Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                    decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                           boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 1
                          )
                         ]
                          ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 122,
                        height: 102,
                        child: Image.asset(wishlist[index].img),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            wishlist[index].title,
                            style: GoogleFonts.nunitoSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "\u{20B9}${wishlist[index].prize}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(children: [
                             Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(229,235,252,1),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(wishlist[index].color,style: GoogleFonts.raleway()),
                                )),
                                SizedBox(width: 5,),
                            Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(229,235,252,1),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(wishlist[index].size,style: GoogleFonts.raleway(),),
                                )),
                                SizedBox(width: 150,),
                                Icon(Icons.shopping_cart_checkout,color: Color.fromRGBO(0,76,255,1),)
                          ])
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
            )
      ],
     ),
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
                  padding: EdgeInsets.only(left:0.0,top:17,right:20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.card_travel,
                        color: Colors.blue,
                        size: 25,
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
              GestureDetector(
                onTap:(){
                 Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                      (Route<dynamic> route) => false,
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(left:0.0,top:19,right:20),
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


            ]
          )
        ) 

  );
}
}
 
 

