
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:grouponproject/durgesh/addto_cart.dart";
import "package:grouponproject/durgesh/like.dart";
import "package:grouponproject/mainModule/mainModule.dart";
import "package:grouponproject/profile_page.dart";

class FlashSale extends StatefulWidget {
  const FlashSale({super.key});
  @override
  State createState() => _FlashSale();
}

class _FlashSale extends State {
  int count = 1;
  
  @override
  Widget build(BuildContext context) {
    List<Widget> discount = [
    Container(
        height: 40,
        width: 300,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 244, 241, 241),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child:
            (Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
              height: 30,
              width: 50,
              decoration:BoxDecoration(
                border:Border.all(color:Colors.blue,width:2),
                borderRadius:BorderRadius.all(Radius.circular(20)),
                color:const Color.fromARGB(255, 74, 168, 245)
              ),
              child: Center(
                  child: Text("All",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold, fontSize: 20,color:Colors.white)
                      )
                  )
              ),
          GestureDetector(
            onTap:()async{
              count = 2;
              await dis.disc(count);
              setState((){}); 
            },
            child: SizedBox(
                height: 30,
                width: 50,
                child: Text("10%",
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold, fontSize: 20))),
          ),
          GestureDetector(
             onTap:()async{
              count = 2;
              await dis.disc(count);
              setState((){}); 
            },
            child: SizedBox(
                height: 30,
                width: 50,
                child: Text("20%",
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold, fontSize: 20))),
          )
        ]
      )
    )
  ),
  Container(
        height: 40,
        width: 300,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 244, 241, 241),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child:
            (Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          GestureDetector(
            onTap:(){
              onTap:()async{
                count = 1;
                await dis.disc(count);
                setState((){});
            };
            },
            child: SizedBox(
                height: 30,
                width: 50,
                child: Center(
                    child: Text("All",
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.bold, fontSize: 20)))),
          ),
          GestureDetector(
            onTap:()async{
                count = 2;
                await dis.disc(count);
                setState((){});
            },
            child: Container(
                height: 30,
                width: 50,
                decoration:BoxDecoration(
                  border:Border.all(color:Colors.blue,width:2),
                  borderRadius:BorderRadius.all(Radius.circular(20)),
                  color:const Color.fromARGB(255, 74, 168, 245)
                ),
                child: Center(
                  child: Text("10%",
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold, fontSize: 20,color:Colors.white)),
                )),
          ),
          GestureDetector(
             onTap:()async{
              count = 3;
              await dis.disc(count);
              setState((){}); 
            },
            child: SizedBox(
                height: 30,
                width: 50,
                child: Text("20%",
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold, fontSize: 20))),
          )
        ]
      )
    )
  ),
  Container(
        height: 40,
        width: 300,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 244, 241, 241),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child:
            (Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          GestureDetector(
            onTap:()async{
              count = 1;
              await dis.disc(count);
              setState((){});
            },
            child: SizedBox(
                height: 30,
                width: 50,
                child: Center(
                    child: Text("All",
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.bold, fontSize: 20)))),
          ),
          GestureDetector(
            onTap:()async{
              count = 2;
              await dis.disc(count);
              setState((){});
            },
            child: SizedBox(
                height: 30,
                width: 50,
                child: Text("10%",
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold, fontSize: 20))),
          ),
          Container(
              height: 30,
              width: 50,
             decoration:BoxDecoration(
                border:Border.all(color:Colors.blue,width:2),
                borderRadius:BorderRadius.all(Radius.circular(20)),
                color:const Color.fromARGB(255, 74, 168, 245)
              ),child: Center(
                child: Text("20%",
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold, fontSize: 20,color:Colors.white)),
              ))
        ]
      )
    )
  )
  ];
    
    return Scaffold(
       backgroundColor:Colors.white,
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(top: 0, left: 20),
          child: Stack(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Flash Sale",
                          style: GoogleFonts.raleway(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      Text("Choose your discount",
                          style: GoogleFonts.raleway(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const Spacer(),
                Stack(children: [
                  Container(
                      height: 182,
                      width: 212,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 109, 182, 242),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(500)))),
                  Positioned(
                    left: 30,
                    child: Container(
                        height: 152,
                        width: 182,
                        decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(500)))),
                  ),
                ])
              ],
            ),
            if(count == 1)
              Padding(
                padding: const EdgeInsets.only(top:130,left:40),
                child: discount[0],
              ),


              if(count == 2)
                Padding(
                  padding: const EdgeInsets.only(top:130,left:40),
                  child: discount[1],
                ),

              if(count == 3)
              Padding(
                padding: const EdgeInsets.only(top:130,left:40),
                child: discount[2],
              )
          ]
          ),
        ),
       
        //dis.disc(count),
        dis.a[0]


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
}

class dis{

  static List<Widget> a = [

  ];

  static dynamic disc(int count){

    if(count == 1){
      a.clear();
       a.add(
        Container(
          height:50,
          width:50,
          color:Colors.amber
        )
      );
    }
    else if(count == 2){
      a.clear();
      a.add(
        Container(
          height:50,
          width:50,
          color:Colors.red
        )
      );
    }
    else{
      a.clear();
      a.add(
        Container(
          height:50,
          width:50,
          color:Colors.green
        )
      );

    }
  }
}
