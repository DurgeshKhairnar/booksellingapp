import 'package:flutter/material.dart';

class Bag extends StatefulWidget {
  const Bag({super.key});

  @override
  State<Bag> createState() => _BagState();
}
List<String> list = [
     "assets/bag.jpg",
     "assets/bag.jpg",
     "assets/bag.jpg",
     "assets/bag.jpg",
     "assets/bag.jpg",     
];
class _BagState extends State<Bag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      body: ListView(
        
        children: [
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 30,),
                Text("Bags",style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),),
                Spacer(),
                Icon(Icons.close,size: 30,),
                 SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 20),
          GridView.builder(
           shrinkWrap: true, // Allows GridView to take up only needed space
          physics: NeverScrollableScrollPhysics(),
            itemCount: list.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
             mainAxisSpacing:20,
             crossAxisSpacing: 10,
             childAspectRatio: 2/ 3.40,
            ), 
            itemBuilder:(BuildContext context,int index){
              return Padding(padding: EdgeInsets.only(left: 10,right: 10),
              child: 
               Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                       boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2), // Shadow color
                        spreadRadius: 2, // Spread radius
                        blurRadius: 8, // Blur radius
                        offset: Offset(4, 4), // Shadow position
                      ),
                    ],
                        borderRadius: BorderRadius.circular(10)
                      ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.all(10),
                        child: Container(
                          width: 150,
                          height: 181,
                          decoration: BoxDecoration( 
                            
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: ClipRRect(
                             borderRadius: BorderRadius.circular(10),
                             child:Image.asset(list[index],fit: BoxFit.cover,),
                          )
                        ),
                        ),
                       Row(
                        children: [
                           Padding(padding: EdgeInsets.only(left: 5),
                        child: Text("Like Style",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                        ),
                        Spacer(),
                        Icon(Icons.favorite_outline),
                        SizedBox(width: 10,),
                        ],
                       ),
                         Row(
                        children: [
                           Padding(padding: EdgeInsets.only(left: 5),
                        child: Text("78%",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: const Color.fromARGB(255, 29, 153, 33)),),
                        ),
                        SizedBox(width: 5),
                        Text("\u20B9499",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,))
                        ],
                       ),
                       Padding(padding: EdgeInsets.only(left: 5),
                       child: Text("Hot Deal",style: TextStyle(
                        color: const Color.fromARGB(255, 16, 153, 20),
                        fontWeight: FontWeight.bold
                       ),),
                       ),
                       Row(
                        children: [
                          Icon(Icons.star,color: Colors.orange,),
                          Icon(Icons.star,color: Colors.orange,),
                          Icon(Icons.star,color: Colors.orange,),
                          Icon(Icons.star,color: Colors.orange,), 
                                             
                        ],
                       ),
                       Padding(padding: EdgeInsets.only(left: 5),
                       child: Text("Free dilevery")  ,
                       )  
                      ],
                    ),
               )
              );
            })
        ],
      ),
    );
  }
}