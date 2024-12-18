import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:grouponproject/profile.dart";
import "main.dart";

class Settings extends StatefulWidget{

    const Settings({super.key});
    @override
    State createState()=> _Settings();
}
class _Settings extends State{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:Colors.white,
      appBar:AppBar(
        backgroundColor:Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left:10,top:18),
          child: Text(
            "Settings",
            style:GoogleFonts.raleway(
              fontSize:33,
              fontWeight:FontWeight.bold
            )
          ),
        )
      ),
      body:Padding(
        padding: const EdgeInsets.only(left:27,top:25,right:30),
        child: ListView(
          children:[
              Text(
                "Personal",
                style:GoogleFonts.raleway(
                  fontSize:25,
                  fontWeight:FontWeight.bold
                )
              ),
               Padding(
                padding: const EdgeInsets.only(top:20,right:20),
                child:  Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                      const Text(
                        "Profile",
                        style:TextStyle(
                          fontSize:20,
                          fontWeight:FontWeight.w400
                        )
                      ),
                      GestureDetector(
                        onTap:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder:(context)=>const Profile())
                          );
                          nameController.text = data[0]["name"];
                        },
                        child: const Icon(
                          Icons.arrow_right_outlined,
                          size:40
                        ),
                      ),
                  ]
                ),                
              ),
              const Padding(
                padding:  EdgeInsets.only(top:0),
                child:  Divider(),
              ),

               Padding(
                padding: EdgeInsets.only(top:30,right:20),
                child:  Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                     const  Text(
                        "Shipping Address",
                        style:TextStyle(
                          fontSize:20,
                          fontWeight:FontWeight.w400
                        )
                      ),
                      GestureDetector(
                        onTap:(){
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder:(context)=>Test())
                          // );
                        },
                        child:const  Icon(
                          Icons.arrow_right_outlined,
                          size:40
                        ),
                      ),
                  ]
                ),                
              ),
              const Padding(
                padding:  EdgeInsets.only(top:0),
                child:  Divider(),
              ),


              const Padding(
                padding: EdgeInsets.only(top:30,right:20),
                child:  Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                      Text(
                        "Payment Method",
                        style:TextStyle(
                          fontSize:20,
                          fontWeight:FontWeight.w400
                        )
                      ),
                      Icon(
                        Icons.arrow_right_outlined,
                        size:40
                      ),
                  ]
                ),                
              ),
              const Padding(
                padding:  EdgeInsets.only(top:0),
                child:  Divider(),
              ),

              Padding(
                padding: const EdgeInsets.only(top:30),
                child: Text(
                  "Shop",
                  style:GoogleFonts.raleway(
                    fontSize:25,
                    fontWeight:FontWeight.bold
                  )
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top:30,right:20),
                child:  Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                      Text(
                        "Country",
                        style:TextStyle(
                          fontSize:20,
                          fontWeight:FontWeight.w400
                        )
                      ),
                      
                      Row(
                        children: [
                          Text(
                            "India",
                            style:TextStyle(
                              fontSize:18,
                              fontWeight:FontWeight.w400
                            )
                          ),
                          Icon(
                            Icons.arrow_right_outlined,
                            size:40
                          ),
                        ],
                      ),
                      
                  ]
                ),                
              ),
              const Padding(
                padding:  EdgeInsets.only(top:0),
                child:  Divider(),
              ),

              const Padding(
                padding: EdgeInsets.only(top:30,right:20),
                child:  Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                      Text(
                        "Currency",
                        style:TextStyle(
                          fontSize:20,
                          fontWeight:FontWeight.w400
                        )
                      ),
                      
                      Row(
                        children: [
                          Text(
                            "Rupees",
                            style:TextStyle(
                              fontSize:18,
                              fontWeight:FontWeight.w400
                            )
                          ),
                          Icon(
                            Icons.arrow_right_outlined,
                            size:40
                          ),
                        ],
                      ),  
                  ]
                ),                
              ),
              const Padding(
                padding:  EdgeInsets.only(top:0),
                child:  Divider(),
              ),


              const Padding(
                padding: EdgeInsets.only(top:30,right:20),
                child:  Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                      Text(
                        "Sizes",
                        style:TextStyle(
                          fontSize:20,
                          fontWeight:FontWeight.w400
                        )
                      ),
                      
                      Row(
                        children: [
                          Text(
                            "XL",
                            style:TextStyle(
                              fontSize:18,
                              fontWeight:FontWeight.w400
                            )
                          ),
                          Icon(
                            Icons.arrow_right_outlined,
                            size:40
                          ),
                        ],
                      ),  
                  ]
                ),                
              ),
              const Padding(
                padding:  EdgeInsets.only(top:0),
                child:  Divider(),
              ),


              const Padding(
                padding: EdgeInsets.only(top:30,right:20),
                child:  Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                      Text(
                        "Terms and Condition",
                        style:TextStyle(
                          fontSize:20,
                          fontWeight:FontWeight.w400
                        )
                      ),
                      
                      Row(
                        children: [
                          
                          Icon(
                            Icons.arrow_right_outlined,
                            size:40
                          ),
                        ],
                      ),  
                  ]
                ),                
              ),
              const Padding(
                padding:  EdgeInsets.only(top:0),
                child:  Divider(),
              ),


              Padding(
                padding: const EdgeInsets.only(top:30),
                child: Text(
                  "Account",
                  style:GoogleFonts.raleway(
                    fontSize:25,
                    fontWeight:FontWeight.bold
                  )
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top:30,right:20),
                child:  Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                      Text(
                        "Language",
                        style:TextStyle(
                          fontSize:20,
                          fontWeight:FontWeight.w400
                        )
                      ),
                      
                      Row(
                        children: [
                          Text(
                            "English",
                            style:TextStyle(
                              fontSize:18,
                              fontWeight:FontWeight.w400
                            )
                          ),
                          Icon(
                            Icons.arrow_right_outlined,
                            size:40
                          ),
                        ],
                      ),  
                  ]
                ),                
              ),
              const Padding(
                padding:  EdgeInsets.only(top:0),
                child:  Divider(),
              ),


              const Padding(
                padding: EdgeInsets.only(top:30,right:20),
                child:  Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children:[
                      Text(
                        "About TheGroupOn",
                        style:TextStyle(
                          fontSize:20,
                          fontWeight:FontWeight.w500
                        )
                      ),
                      
                      Row(
                        children: [
                          
                          Icon(
                            Icons.arrow_right_outlined,
                            size:40
                          ),
                        ],
                      ),  
                  ]
                ),                
              ),
              const Padding(
                padding:  EdgeInsets.only(top:0),
                child:  Divider(),
              ),


              const Padding(
                padding:  EdgeInsets.only(top:30),
                child: Text(
                  "Delete My Account",
                  style:TextStyle(
                    color:Colors.red,
                    fontSize:16
                  )
                ),
              ),

              const Padding(
                padding:  EdgeInsets.only(top:20),
                child:  Text(
                  "TheGroupOn",
                  style:TextStyle(
                    fontSize:21,
                    fontWeight:FontWeight.bold
                  )
                ),
              ),
              const Padding(
                padding:  EdgeInsets.only(top:0 ),
                child:  Text(
                  "Version 1.0 Oct 2024",
                  style:TextStyle(
                    fontSize:15,
                  )
                ),
              )

          ]
        ),
      )
    );
  }
}