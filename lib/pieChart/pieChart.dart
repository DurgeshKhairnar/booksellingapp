


import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouponproject/durgesh/addto_cart.dart';
import 'package:grouponproject/durgesh/like.dart';
import 'package:grouponproject/home/homePage.dart';
import 'package:grouponproject/mainModule/mainModule.dart';
import 'package:grouponproject/profile_page.dart';
import 'package:grouponproject/re/review.dart';


class PiChart extends StatefulWidget {
  const PiChart({super.key});

  @override
  State<PiChart> createState() => _PiChartState();
}

class _PiChartState extends State<PiChart> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 30),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 2, // Blur radius
                      offset: Offset(0, 0), // Shadow position
                    ),
                    
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    "assets/modal.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                  
                  Text(
                    "To Recieve",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Track Your Order",
                    style: TextStyle(fontSize: 11),
                  )
                ],
              ),
              Spacer(),
              // Container(
              //   width: 40,
              //   height: 40,
              //   decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       color: const Color.fromRGBO(229, 235, 252, 1)), 
              // ),
              // SizedBox(
              //   width: 10,
              // )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 7),
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 123,
                    top: 110,
                    child: Text(
                      '''Total\n\u20B9390''',
                      style: GoogleFonts.raleway(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  PieChart(
                    swapAnimationDuration: const Duration(microseconds: 750),
                    PieChartData(
                      centerSpaceRadius: 95,
                      sections: [
                        PieChartSectionData(
                          showTitle: false,
                          value: 190,
                          color: Colors.blue,
                        ),
                        PieChartSectionData(
                          showTitle: false,
                          value: 120,
                          color: const Color.fromARGB(255, 250, 126, 168),
                        ),
                        PieChartSectionData(
                          showTitle: false,
                          value: 150,
                          color: Colors.green,
                        ),
                        PieChartSectionData(
                          value: 50,
                          showTitle: false,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Legend
          Row(
            children: [
              const SizedBox(width: 50),
              _buildLegendItem("Clothing\u20B9183.00", Colors.blue),
              const SizedBox(width: 20),
              _buildLegendItem("Clothing\u20B9183.00", Colors.green),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 70),
              _buildLegendItem("Shoes\u20B9183.00", Colors.orange),
              const SizedBox(width: 20),
              _buildLegendItem("Bags\u20B943.00", const Color.fromARGB(255, 250, 126, 168)),
            ],
          ),
          const SizedBox(height: 30),
          // Circular Indicators at the Bottom with Centered Text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 2),
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                  Positioned(
                    child: Text(
                      '12', // Your text inside the blue circle
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                      ),
                    ),
                  ),
                  
                ],
              ), 
                 Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 2),
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                  Positioned(
                    child: Text(
                      '7', // Your text inside the blue circle
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  
                ],
              ), 
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 2),
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                  ),
                  Positioned(
                    child: Text(
                      '5', // Your text inside the blue circle
                      style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                      ),
                    ),
                  ),
                  
                ],
              ),      
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 40,),
            Text("Order",style: TextStyle(
              fontSize: 18
            ),),
            SizedBox(width: 70,),
            Text("Recieved",style: TextStyle(
              fontSize: 18
            ),),
            SizedBox(width: 50,),
            Text("To Recieve",style: TextStyle(
              fontSize: 18
            ),)
          ],) ,
           SizedBox(height: 30,),
           Center(
            child: GestureDetector(
              onTap:(){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>const HistoryPage())
                  );
              },
              child: Container(
                width: 320,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10)
                ),
                alignment: Alignment.center,
                child: Text("Order History",style: GoogleFonts.raleway(
                  fontSize: 20,
                  color: Colors.white
                ),),
              ),
            ),
           )
        ],
      ),
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

  // Helper widget to create legend items
  Widget _buildLegendItem(String label, Color color) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          label,
          style: GoogleFonts.raleway(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

