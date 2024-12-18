
import 'package:flutter/material.dart';

class Wish{
  final String img;
  final String title;
  final int prize;
  final String color;
  final String size;

  Wish({
    required this.img,
    required this.title,
    required this.prize,
    required this.color,
    required this.size,
  });
   static Widget addwish(){
    return  Center(child:Padding(
          padding: EdgeInsets.symmetric(vertical: 70),
          child: Container(
            width: 134,
            height: 134,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                 spreadRadius: 5, // Extent of the shadow
                blurRadius: 7, // Blur effect of the shadow
                offset: Offset(-1, 2),
                )
              ]
            ),
            alignment: Alignment.center,
            child:Icon(Icons.favorite_border_outlined,size: 50,color:Color.fromRGBO(0, 76, 255, 1),),
          ),
        ),);
   }
 static Widget shopping_bag(){
    return  Center(child:Padding(
          padding: EdgeInsets.symmetric(vertical: 70),
          child: Container(
            width: 134,
            height: 134,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                 spreadRadius: 5, // Extent of the shadow
                blurRadius: 7, // Blur effect of the shadow
                offset: Offset(-1, 2),
                )
              ]
            ),
            alignment: Alignment.center,
            child:Icon(Icons.shopping_bag,size: 50,color:Color.fromRGBO(0, 76, 255, 1),),
          ),
        ),);
 }
       
        
}
   


