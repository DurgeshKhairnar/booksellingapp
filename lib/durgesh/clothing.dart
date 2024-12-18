
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:grouponproject/ProductDetail/Product.dart';
import 'package:grouponproject/durgesh/addto_cart.dart';
import 'package:grouponproject/durgesh/like.dart';
import 'package:grouponproject/home/homeModel.dart';
import 'package:grouponproject/mainModule/mainModule.dart';
import 'package:grouponproject/profile_page.dart';

class cloting extends StatefulWidget {
  const cloting({super.key,required this.data,required this.name});
  final String name;
  final List<homeModel> data;

  @override
  State<cloting> createState() => _clotingState();
}
  
//


class _clotingState extends State<cloting> {
  

 Future<void> updateBooleanValue(String documentId, bool newValue) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    await firestore.collection("watch").doc(documentId).update({
      'favo': newValue,
    });
    print("Boolean value updated successfully!");
  } catch (e) {
    print("Error updating boolean value: $e");
  }
}

   
  @override
  Widget build(BuildContext context) {
    // Track favorites by product ID
   
 
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(    
        children: [
            const SizedBox(height: 20,),
            Row(
              children: [
                const SizedBox(width: 30,),
                Text(
                  widget.name,
                  style:const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),),
                const Spacer(),
                const Icon(Icons.close,size: 30,),
                 const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 10),
          
             const SizedBox(height: 15),
          Expanded(
            child: GridView.builder( 
            shrinkWrap: true, 
            physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
               mainAxisSpacing:20,
               crossAxisSpacing: 5,
               childAspectRatio: 2/ 3.40,
              ), 
              itemBuilder:(BuildContext context,int index){
                 bool favBool = widget.data[index].favo;
                return Padding(padding: const EdgeInsets.only(left: 10,right: 10),
                child: 
                 Container(
                        //height:400,
                        decoration: BoxDecoration(
                          color: Colors.white,
                         boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2), // Shadow color
                          spreadRadius: 2, // Spread radius
                          blurRadius: 8, // Blur radius
                          offset: const Offset(4, 4), // Shadow position
                        ),
                      ],
                          borderRadius: BorderRadius.circular(10)
                        ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap:(){
            
                               updateUserRecord(){
                                  DocumentReference userRef = FirebaseFirestore.instance.collection(widget.name).doc();
                                  userRef.update({
                                      "index":index,
                                  });
                                 
                               }
                               
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder:(context)=>Product(proInfo:widget.data[index],no:index,name:widget.name))
                              );
                            },
                            child: Container(
                              width: 150,
                              height: 165,
                              decoration: BoxDecoration( 
                                
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: ClipRRect(
                                 borderRadius: BorderRadius.circular(10),
                                 child:Image.asset(widget.data[index].image,fit: BoxFit.cover,),
                              )
                            ),
                          ),
                          ),
                         Row(
                          children: [
                             Padding(padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            widget.data[index].name
                          ,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                          ),
                          const Spacer(),
                            IconButton(
                              icon:Icon(Icons.favorite_outlined),
                              color: widget.data[index].favo ? Colors.red : const Color.fromARGB(255, 188, 187, 187),
                              onPressed:()async{
            
                                 bool currentFavState = widget.data[index].favo;
            
                                if(widget.data[index].favo == false){

                                  Map<String,dynamic> favInfo = {
                                    "name":widget.data[index].name,
                                    "image":widget.data[index].image,
                                    "price":widget.data[index].price,
                                    "index":index,
                                    "favo":widget.data[index].favo
                                  };
                                  FirebaseFirestore.instance.collection("favo").add(favInfo);

                                  await updateBooleanValue(widget.data[index].id, !currentFavState);
                                  setState((){
                                     widget.data[index].favo = !currentFavState;
                                  });

                                }
                              }   
                            ),   
                                                       
                          const SizedBox(width: 10,),
                          ],
                         ),
                           Row(
                          children: [
                             const Padding(padding: EdgeInsets.only(left: 12),
                          child: Text("78%",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Color.fromARGB(255, 29, 153, 33)),),
                          ),
                          const SizedBox(width: 5),
                          Text("\u20B9${widget.data[index].price}",style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 17,))
                          ],
                         ),
                         const Padding(padding: EdgeInsets.only(left: 12),
                         child: Text("Hot Deal",style: TextStyle(
                          color: Color.fromARGB(255, 16, 153, 20),
                          fontWeight: FontWeight.bold
                         ),),
                         ),
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: const Row(
                            children: [
                              Icon(Icons.star,color: Colors.orange,),
                              Icon(Icons.star,color: Colors.orange,),
                              Icon(Icons.star,color: Colors.orange,),
                              Icon(Icons.star,color: Colors.orange,), 
                                                 
                            ],
                           ),
                        ),
                         const Padding(padding: EdgeInsets.only(left: 12),
                         child: Text("Free dilevery")  ,
                         )  
                        ],
                      ),
                 )
                );
              }),
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
                    const Center(
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
                  MaterialPageRoute(builder: (context) =>  like()),
                      (Route<dynamic> route) => false,
                  );
                  },
                  child: const Padding(
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
                  MaterialPageRoute(builder: (context) => const mainModule()),
                      (Route<dynamic> route) => false,
                  );
                  },
                 child: const Padding(
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
                 child: const Padding(
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
                  MaterialPageRoute(builder: (context) => const Profile()),
                      (Route<dynamic> route) => false,
                  );
                },
                child: const Padding(
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