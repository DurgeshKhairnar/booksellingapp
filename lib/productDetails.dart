import "package:flutter/material.dart";

class productDetails extends StatefulWidget{

  const productDetails({super.key});
  @override
  State createState() => _productDetails();
}
class _productDetails extends State{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:ListView(
        children:[ 
          Container(
            height:300,
            width:300,
            color:Colors.red
          ),
        ]
      )
    );
  }
}