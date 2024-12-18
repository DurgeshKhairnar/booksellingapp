import 'package:flutter/material.dart';
import "Settings.dart";
class Delivary extends StatefulWidget {
  const Delivary({super.key});

  @override
  State<Delivary> createState() => _DelivaryState();
}

class _DelivaryState extends State<Delivary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(height: 10),
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
              GestureDetector(
                onTap:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:(context)=>Settings())
                  );
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromRGBO(229, 235, 252, 1)),
                  child: Icon(
                    Icons.settings_outlined,
                    color: const Color.fromRGBO(0, 75, 254, 1),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
           SizedBox(
            height: 10,
          ),
          Center(child:  SizedBox(
                      height: 1, // Line height
                      width:  MediaQuery.of(context).size.width, // Full width of the screen
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: const Color.fromARGB(255, 246, 244, 244)),
                      ),
                    ),),
          SizedBox(
            height: 10,
          ),
            Center(
              child: Text("Arriving On",
               style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
             Center(
              child: Text("Sunday,November 10th",
               style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold,color: Colors.purple),
              ),
            ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              width: 320,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 2, // Blur radius
                    offset: Offset(0, 0), // Shadow position
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      width: 70,
                      height: 70,
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
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          "assets/modal.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           SizedBox(height: 20,),
                          Text(
                            "Shairt",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                "Qty:1 | ",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "Price :\u20B9 449.00",
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                           Text(
                                "Discount :\u20B9 0.00",
                                style: TextStyle(fontSize: 12),
                              ),
                               Text(
                                "Subtotal :\u20B9 503.00",
                                style: TextStyle(fontSize: 12),
                              ),
                               Row(
                                children: [
                                  Text(
                                "Total Amount",
                                style: TextStyle(fontSize: 12,
                                fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(width:140),
                                Text("\u20B9449.00", style: TextStyle(fontSize: 12,
                                fontWeight: FontWeight.bold
                                ),)
                                ],
                               ),
                              SizedBox(height: 20,),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
           Stepper(
              currentStep: 2,
              steps: [
                Step(
                  title: Text('Packed'),
                  content: Text('Your parcel is packed and will be handed over to our delivery partner.'),
                  isActive: true,
                ),
                Step(
                  title: Text('Shiped'),
                  content: Text('On the way to the logistic facility.'),
                  isActive: true,
                ),
                Step(
                  title: Text('Out of delivery'),
                  content: Text('Arrived at the logistic facility.'),
                  isActive: true,
                ),
                Step(
                  title: Text('Deliverd'),
                  content: Text('Expected on April 20.'),
                  isActive: false,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
