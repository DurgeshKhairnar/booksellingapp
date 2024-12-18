import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grouponproject/home/homePage.dart';

class PaymentLast extends StatefulWidget {
  const PaymentLast({super.key,required this.img,required this.price,required this.name});

  final String img;
  final String name;
  final double price;

  @override
  State createState() => _PaymentLastState();
}

class _PaymentLastState extends State<PaymentLast> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap:(){

        },
        child: Positioned(
          top: 740,
          width: MediaQuery.of(context).size.width,
          height: 70,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black
            ),
            alignment: Alignment.center,
          child: GestureDetector(
            onTap:(){
              
          Map<String,dynamic> data ={
            "image":widget.img,
            "name":widget.name,
            "price":widget.price
          };
          
          FirebaseFirestore.instance.collection("Order").add(data);
         Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => homePage()),
                  (Route<dynamic> route) => false,
              );

      
            },
            child: Text(
              "Done",
              style: TextStyle(
              color: Colors.purple,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
          ),
        )),
      )
    );
  }
}