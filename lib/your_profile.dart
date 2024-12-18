
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:grouponproject/durgesh/addto_cart.dart";
import "package:grouponproject/durgesh/like.dart";
import "package:grouponproject/home/homePage.dart";
import "package:grouponproject/mainModule/mainModule.dart";  
import "main.dart";
import "profile_model.dart";

class yourProfile extends StatefulWidget{
  const yourProfile({super.key});
  @override
  State createState()=> _yourProfile();
}
class _yourProfile extends State{

  
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:Padding(
          padding: const EdgeInsets.only(top:18),
          child: Text(
              "Settings",
              style:GoogleFonts.raleway(
                fontSize:33,
                fontWeight:FontWeight.bold
              )
            ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:15,left:15,right:15),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.start,
          crossAxisAlignment:CrossAxisAlignment.start,
          children:[
            const Text(
              "Your Profile",
              style:TextStyle(
                fontSize:17,
                fontWeight:FontWeight.w500
              )
            ),
            const SizedBox(height:15),
            Stack(
              children:[ 
                Container(
                  height:100,
                  width:100,
                  decoration: BoxDecoration(
                    shape:BoxShape.circle,
                    border:Border.all(
                      color:Colors.grey
                    )
                  )
                ),
                Positioned(
                  top:10,  
                  left:10, 
                  child:Container(
                    height:80,
                    width:80,
                    clipBehavior:Clip.antiAliasWithSaveLayer,
                    decoration: const BoxDecoration(
                      shape:BoxShape.circle, 
                    ),
                    child:Image.network("https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=600",fit:BoxFit.cover)
                  ),
                )              
              ]
            ),
            const SizedBox(height:15),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height:50,
                    width:360,
                    child: TextField(
                      controller:nameController,
                        style:const TextStyle(
                          fontSize:22
                        ),
                        decoration:InputDecoration(
                          filled:true,  
                          fillColor:const Color.fromRGBO(220, 228, 255, 1),
                          border:OutlineInputBorder(
                            borderRadius:BorderRadius.circular(10)
                          )
                        ),
                    ),
                  ),
                  const SizedBox(height:10),
                  SizedBox(
                    height:50,
                    width:360,
                    child: TextField(
                      controller:nameController,
                        style:const TextStyle(
                          fontSize:22
                        ),
                        decoration:InputDecoration(
                          filled:true,  
                          fillColor:const Color.fromRGBO(220, 228, 255, 1),
                          border:OutlineInputBorder(
                            borderRadius:BorderRadius.circular(10)
                          )
                        ),
                    ),
                  ),
                  const SizedBox(height:10),
                  SizedBox(
                    height:50,
                    width:360,
                    child: TextField(
                      controller:nameController,
                        style:const TextStyle(
                          fontSize:22
                        ),
                        decoration:InputDecoration(
                          filled:true,  
                          fillColor:const Color.fromRGBO(220, 228, 255, 1),
                          border:OutlineInputBorder(
                            borderRadius:BorderRadius.circular(10)
                          )
                        ),
                    ),
                  ),
                  const SizedBox(
                    height:250,
                  ),
                  ElevatedButton(
                    style:ButtonStyle(
                      backgroundColor:WidgetStateProperty.all(Colors.blue),
                      minimumSize:WidgetStateProperty.all(Size.fromHeight(50))
                     
                    ),
                    onPressed:()async{
                      profileModel obj2 = profileModel(
                        name:nameController.text.trim(),
                        id : 1,
                        email :"adad",
                        pass : "asd"

                      );
                     
                      updateData(profileModel obj2)async{
                        dynamic localDB = await database;
                       await localDB.update(
                            "Profile",
                             obj2.ml(),
                             where:"id=?",
                             whereargs:[obj2.id]
                        );

                      }
                      print(data);
                      setState((){});
                    },
                    child:const Text("Press me")
                  )
                 
                  
                ],
              ),
            )
          ]
        ),
      ),
      bottomNavigationBar:Container(
          height:70,
          decoration:const BoxDecoration(
                 color:Color.fromARGB(255, 217, 228, 236),
            borderRadius:BorderRadius.only(topLeft:Radius.circular(25),topRight:Radius.circular(25))

          ),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children:[
              GestureDetector(
                  onTap:(){
                    Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) =>const homePage()),
                      (Route<dynamic> route) => false,
                  );
                  },
                  child: const Padding(  
                    padding: EdgeInsets.only(top:6,right:20),
                    child: Icon(
                      Icons.home_outlined,
                      color: Color.fromARGB(255, 61, 26, 218),
                      size: 30,
                      
                    ),
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
                  child: const Padding(
                  padding: EdgeInsets.only(left:0.0,top:7,right:30),
                  child: Icon(
                    Icons.favorite_border_outlined,
                    color: Color.fromARGB(255, 61, 26, 218),
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
                 child: const Padding(
                  padding: EdgeInsets.only(left:0.0,top:7,right:30),
                  child: Icon(
                    Icons.article_outlined,
                    color: Color.fromARGB(255, 61, 26, 218),
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
                 child: const Padding(
                  padding: EdgeInsets.only(left:0.0,top:7,right:20),
                  child: Icon(
                    Icons.card_travel,
                    color: Color.fromARGB(255, 61, 26, 218),
                    size: 25,
                  ),
                               ),
               ),
              Padding(
                padding: const EdgeInsets.only(left:0.0,top:7,right:10),
                child: Container(
                  height:45,
                  width:45,
                  decoration:const BoxDecoration(
                      color:Colors.white,
                    shape:BoxShape.circle,
                  ),
                
                  child: const Center(
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 34,
                    ),
                  ),
                ),
              ),


            ]
          )
        )

    
    );
  }
}