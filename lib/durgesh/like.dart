import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grouponproject/durgesh/addto_cart.dart';
import 'package:grouponproject/home/homePage.dart';
import 'package:grouponproject/mainModule/mainModule.dart';
import 'package:grouponproject/profile_page.dart';

class like extends StatefulWidget {
  const like({super.key});

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<like> {

  @override
  initState(){
    super.initState();
      _loadWishlist();  
  }
  late QuerySnapshot response;
  Future<void> _loadWishlist() async {
   response = await FirebaseFirestore.instance.collection("favo").get();
  setState(() {
    wishlist = response.docs.map((doc) {
      return WishlistItem(
        name: doc["name"],
        price: doc["price"],
        image: doc["image"],
        isFavorite: doc["favo"],
      );
    }).toList();
  });
}
  // Sample data
  List<WishlistItem> wishlist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 249, 200, 54),
        title: Text(
          "My Wishlist",
          style:TextStyle(
            color:Colors.blue
          )
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              setState(() {
                wishlist.clear();
              });
            },
          ),
        ],
      ),
      body: wishlist.isEmpty
          ? Center(
              child: Text(
                "Your wishlist is empty.",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: wishlist.length,
              itemBuilder: (context, index) {
                final item = wishlist[index];
               
               return Card(
  margin: EdgeInsets.all(16.0),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  elevation: 6,
  child: InkWell(
    onTap: () {
      print("Card Tapped");
    },
    child: AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey.shade200],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Badge Section
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                  item.image,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Tag Badge
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Best Seller",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Product Details
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    
                    Text(
                      item.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              onPressed: () async {
                String identity;
                QuerySnapshot re = await FirebaseFirestore.instance.collection("watch").get();
                for (int i = 0; i < re.docs.length; i++) {
                  if (response.docs[index]["name"] == re.docs[i]["name"]) {
                    identity = re.docs[i].id;
                    FirebaseFirestore.instance.collection("watch").doc(identity).update({
                      "favo": false,
                    });
                  }
                }
                setState(() {
                  FirebaseFirestore.instance.collection("favo").doc(response.docs[index].id).delete();
                  wishlist.removeAt(index);
                });
              },
            ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "\$${item.price.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: List.generate(4, (index) {
                        return Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 18,
                        );
                      }),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                // Divider Line
                Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Free Delivery Text
                    Row(
                      children: [
                        Icon(Icons.local_shipping, color: Colors.blue, size: 20),
                        SizedBox(width: 6),
                        Text(
                          "Free Delivery",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    // Buy Now Button
                    ElevatedButton(
                      onPressed: () {
                        print("Buy Now Clicked");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "Buy Now",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);

               
               
               /* return Card(
  margin: EdgeInsets.all(16.0),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  elevation: 4,
  child: Container(
    height: 180,
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // First Row: Image, Title, and Favorite Icon
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                item.image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    "\$${item.price.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            // Favorite Icon
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              onPressed: () async {
                String identity;
                QuerySnapshot re = await FirebaseFirestore.instance.collection("watch").get();
                for (int i = 0; i < re.docs.length; i++) {
                  if (response.docs[index]["name"] == re.docs[i]["name"]) {
                    identity = re.docs[i].id;
                    FirebaseFirestore.instance.collection("watch").doc(identity).update({
                      "favo": false,
                    });
                  }
                }
                setState(() {
                  FirebaseFirestore.instance.collection("favo").doc(response.docs[index].id).delete();
                  wishlist.removeAt(index);
                });
              },
            ),
          ],
        ),
        SizedBox(height: 8),
        // Rating Row and Buy Now Button
        Row(
          children: [
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 20),
                Icon(Icons.star, color: Colors.orange, size: 20),
                Icon(Icons.star, color: Colors.orange, size: 20),
                Icon(Icons.star, color: Colors.orange, size: 20),
              ],
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle Buy Now action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber, // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                "Buy Now",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        // Free Delivery Text
        Text(
          "Free Delivery",
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    ),
  ),
);*/

              
              },
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
              GestureDetector(
                onTap:(){
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder:(context)=>homePage()),
                    (Route route) =>false
                    
                  );
                },
                child: Padding(  
                  padding: const EdgeInsets.only(top:17,right:20,left:15),
                  child: Column(
                    children: [
                      Center(
                        child: Icon(
                          Icons.home_outlined,
                          color: Colors.black,
                          size: 30, 
                        ),
                      ),
                     
                    ],
                  ),
                ),
              ),
                GestureDetector(
                  
                  child: Padding(
                  padding: EdgeInsets.only(left:0.0,top:17,right:30),
                  child: Column(
                    children:[ 
                      
                      Icon(
                      Icons.favorite_border_outlined,
                      color:Colors.blue,
                      size: 25,
                    ),
                    Container(
                      height:5,
                      width:20,
                      color:Colors.blue,
                    )
                    ]
                  ),
                                ),
                ),
               GestureDetector(
                onTap:()async{

                    

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

class WishlistItem {
  final String name;
  final String image;
  final int price;
  bool isFavorite;

  WishlistItem({
    required this.name,
    required this.image,
    required this.price,
    this.isFavorite = true,
  });
}


