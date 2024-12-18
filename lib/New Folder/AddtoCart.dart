import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouponproject/New Folder/wish_model.dart';


class AddtoCart extends StatefulWidget {
  const AddtoCart({super.key});

  @override
  State<AddtoCart> createState() => _AddtoCartState();
}

class _AddtoCartState extends State<AddtoCart> {
  final Map<String, int> productCount = {};
  int sum = 0;
  int? index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Cart",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("cart").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                "No items in the cart",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey),
              ),
            );
          }

          final cartList = snapshot.data!.docs.map((doc) {
            return Productdet(
              img: doc['img'] ?? '',
              title: doc['title'] ?? '',
              description: doc['description'] ?? '',
              price: doc['price'] ?? '0',
              discount: doc['discount'] ?? '0',
              id: doc.id,
            );
          }).toList();

          sum = calculateTotalSum(cartList.cast<Productdet>());
         
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  itemCount: cartList.length,
                  itemBuilder: (context, index) {
                    final product = cartList[index];
                    productCount.putIfAbsent(product.id, () => 1);
                    int count = productCount[product.id]!;
                    int price = int.tryParse(product.price) ?? 0;
                    int total = price * count;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.grey.shade200,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    product.img,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) => const Icon(
                                      Icons.image_not_supported,
                                      size: 60,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          product.title,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () async {
                                            await deleteFromCart(product.id);
                                            
                                          },
                                          icon: const Icon(
                                            Icons.clear,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      product.description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Text(
                                          "\u20B9$total", // Display total price
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const Spacer(),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (productCount[product.id]! > 1) {
                                                productCount[product.id] = productCount[product.id]! - 1;
                                              }
                                            });
                                          },
                                          child: const Icon(
                                            Icons.remove_circle_outline,
                                            color: Color.fromRGBO(0, 76, 255, 1),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          decoration: const BoxDecoration(
                                            color: Color.fromRGBO(229, 235, 252, 1),
                                          ),
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Text("${productCount[product.id]}"),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              productCount[product.id] = productCount[product.id]! + 1;
                                            });
                                          },
                                          child: const Icon(
                                            Icons.add_circle_outline,
                                            color: Color.fromRGBO(0, 76, 255, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 0),
                        blurRadius: 1,
                        spreadRadius: 1,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 20),
                      Text(
                        "Total : \u20B9 $sum", // Display the total sum
                        style: GoogleFonts.raleway(fontSize: 25),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () async {
                          if (cartList.isNotEmpty) {
                            await addAllToFavorites(cartList.cast<Productdet>(), context);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>  Payment(proInfo:,disc:20),
                            //   ),
                            // );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('No items in the cart to checkout')),
                            );
                          }
                        },
                        child: Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Checkout",
                            style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  int calculateTotalSum(List<Productdet> cartList) {
    int total = 0;
    for (var product in cartList) {
      int price = int.tryParse(product.price) ?? 0;
      int count = productCount[product.id] ?? 1;
      total += price * count;
    }
    return total;
  }

  Future<void> deleteFromCart(String productId) async {
    try {
      final cartCollection = FirebaseFirestore.instance.collection('cart');
      await cartCollection.doc(productId).delete();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Item removed from cart')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error removing item: $e')),
      );
    }
  }

Future<void> addAllToFavorites(List<Productdet> cartList, BuildContext context) async {
  try {
    final paymentCollection = FirebaseFirestore.instance.collection('payment');

    for (var product in cartList) {
      final snapshot = await paymentCollection.where('id', isEqualTo: product.id).get();

      if (snapshot.docs.isEmpty) {
        await paymentCollection.add({
          'img': product.img,
          'title': product.title,
          'description': product.description,
          'price': product.price,
          'discount': product.discount,
          'id': product.id,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${product.title} added to payment')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${product.title} is already in the payment list')),
        );
      }
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error during checkout: $e')),
    );
  }
}


  
}





























// List<Wish> wishlist = [
//   Wish(
//     img: "assets/shirt1.jpg",
//     title: "Allen Solly",
//     prize: 150,
//     color: "White",
//     size: "M",
//   ),
//     Wish(img: "assets/shirt2.jpg",
//    title: "Allen Solly",
//     prize: 150,
//      color: "White",
//       size: "M",
//   ),
//   //   Wish(img: "assets/shirt3.jpg",
//   //  title: "Allen Solly",
//   //   prize: 150,
//   //    color: "White",
//   //     size: "M",
//   // ),
//   //  Wish(img: "assets/shirt3.jpg",
//   //  title: "Allen Solly",
//   //   prize: 150,
//   //    color: "White",
//   //     size: "M",
//   // ),
  
// ];
// class AddToCartWidget extends StatefulWidget {
//   const AddToCartWidget({super.key});

//   @override
//   _AddToCartWidgetState createState() => _AddToCartWidgetState();
// }

// class _AddToCartWidgetState extends State<AddToCartWidget> {

// int count = 1;


// List<String> imagepath = [
//   "assets/shirt1.jpg",
//   "assets/shirt2.jpg",
//   "assets/shirt3.jpg",
//   "assets/shirt4.jpg",
//   "assets/shirt5.jpg",
// ];

// @override
//   Widget build(BuildContext context){
//   return Scaffold(
//     backgroundColor: Colors.white,
//     body: SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//      child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//              const SizedBox(
//           height: 40,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 20),
//           child: Text(
//             "cart",
//             style: GoogleFonts.raleway(
//                 textStyle:
//                     const TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
//           ),
//         ),
//         (wishlist.isEmpty)? Wish.shopping_bag() : ListView.builder(
//             shrinkWrap: true,
//             scrollDirection: Axis.vertical,
//             physics: const BouncingScrollPhysics(),
//             itemCount: wishlist.length,
//             itemBuilder: (context, int index) {
//               int prize = wishlist[index].prize;
//               int total = prize * count;
//               return Padding(
//                 padding: const EdgeInsets.all(5),
//                 child: Container(
//                    width: 70,
//                       height: 100,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.white,
//                            boxShadow: const [
//                           BoxShadow(
//                             offset: Offset(0, 0),
//                             color: Colors.grey,
//                             spreadRadius: 1,
//                             blurRadius: 1
//                           )
//                          ]
//                           ),
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         width: 122,
//                         height: 102,
//                         child: Image.asset(wishlist[index].img),
//                       ),
//                       SizedBox(
//                         width: 260,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               wishlist[index].title,
//                               style: GoogleFonts.nunitoSans(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           const SizedBox(height: 7,),
//                             Row(children: [
//                                Container(
//                                   alignment: Alignment.center,
//                                   decoration: const BoxDecoration(
//                                     color: Color.fromRGBO(229,235,252,1),
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(5),
//                                     child: Text(wishlist[index].color,style: GoogleFonts.raleway()),
//                                   )),
//                                   const SizedBox(width: 5,),
//                               Container(
//                                   alignment: Alignment.center,
//                                   decoration: const BoxDecoration(
//                                     color: Color.fromRGBO(229,235,252,1),
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(5),
//                                     child: Text(wishlist[index].size,style: GoogleFonts.raleway(),),
//                                   )),
                                  
//                             ]),
//                             const SizedBox(height: 7,),
                        
//                               Row(
//                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                   "\u{20B9}$total",
//                                   style: const TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                 ),
//                              const SizedBox(width: 100),
//                             // Spacer(),
                            
                            
//                                 ],
//                               ),
                         
                         
                         
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             }),
//         const SizedBox(height: 5),
//         Row(
//           children: [
//             const SizedBox(width: 20),
//             Text(
//               "Form Your Wishlist",
//               style: GoogleFonts.raleway(
//                   textStyle:
//                       const TextStyle(fontSize: 21, fontWeight: FontWeight.w700)),
//             ),    
//           ],
//         ),
//         SizedBox(
//         height: 250,
//               child:
//             ListView.builder(
//             shrinkWrap: true,
//             scrollDirection: Axis.vertical,
//             physics: const BouncingScrollPhysics(),
//             itemCount: wishlist.length,
//             itemBuilder: (context, int index) {
//               return Padding(
//                 padding: const EdgeInsets.all(5),
//                 child: Container(
//                     decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: Colors.white,
//                            boxShadow: const [
//                           BoxShadow(
//                             offset: Offset(0, 0),
//                             color: Colors.grey,
//                             spreadRadius: 1,
//                             blurRadius: 1
//                           )
//                          ]
//                           ),
//                   child: Row(
//                     children: [
//                       SizedBox(
//                         width: 122,
//                         height: 102,
//                         child: Image.asset(wishlist[index].img),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             wishlist[index].title,
//                             style: GoogleFonts.nunitoSans(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                           Text(
//                             "\u{20B9}${wishlist[index].prize}",
//                             style: const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                           Row(children: [
//                              Container(
//                                 alignment: Alignment.center,
//                                 decoration: const BoxDecoration(
//                                   color: Color.fromRGBO(229,235,252,1),
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(5),
//                                   child: Text(wishlist[index].color,style: GoogleFonts.raleway()),
//                                 )),
//                                 const SizedBox(width: 5,),
//                             Container(
//                                 alignment: Alignment.center,
//                                 decoration: const BoxDecoration(
//                                   color: Color.fromRGBO(229,235,252,1),
//                                 ),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(5),
//                                   child: Text(wishlist[index].size,style: GoogleFonts.raleway(),),
//                                 )),
//                                 const SizedBox(width: 150,),
//                                 const Icon(Icons.shopping_cart_checkout,color: Color.fromRGBO(0,76,255,1),)
//                           ])
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             }),
//             )
//       ],
//      ),
//     ),
//   );
// }
// }
 
 

