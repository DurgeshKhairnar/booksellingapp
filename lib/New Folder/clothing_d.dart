import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouponproject/New%20Folder/Favadd.dart';
import 'package:grouponproject/New%20Folder/ProductDetail.dart';
import 'package:grouponproject/ProductDetail/Product.dart';


class Get extends StatefulWidget {
  const Get({super.key});

  @override
  State<Get> createState() => _GetState();
}

class _GetState extends State<Get> {
Map<String, bool> favorites = {}; // Track favorites by product ID

  @override
  void initState() {
    super.initState();
    fetchFavorites(); // Load initial favorites
  }
  
  Future<void> fetchFavorites() async {
    try {
      final snapshot = await FirebaseFirestore.instance.collection('favorites').get();
      setState(() {
        favorites = {
          for (var doc in snapshot.docs) doc['id']: true, // Mark products as favorite
        };
      });
    } catch (e) {
      debugPrint('Error fetching favorites: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 40),
          const SizedBox(height: 20),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("products").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No product available"));
                }

                final productlist = snapshot.data!.docs.map((doc) {
                  return {
                    "id": doc.id,
                    ...doc.data() as Map<String, dynamic>,
                  };
                }).toList();

                return GridView.builder(
                  itemCount: productlist.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 15,
                    childAspectRatio: 2 / 3.40,
                  ),
                  itemBuilder: (context, index) {
                    final product = productlist[index];
                    final isFav = favorites[product['id']] ?? false;

                    return GestureDetector(
                      onTap: () {
    Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ProductDetail(
      product: Product.fromMap(product), // Create a Product instance
    ),
  ),
);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 0),
                              color: Colors.grey,
                              spreadRadius: 1,
                              blurRadius: 1,
                            )
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Product Image
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(product['img']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      product['title'],
                                      style: GoogleFonts.raleway(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(width: 50),
                                  GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                        favorites[product['id']] = !isFav;
                                        Navigator.push(context,MaterialPageRoute(builder: (context)=>const Favorite()));
                                      });

                                      try {
                                        if (!isFav) {
                                          await addToFavorites(product);
                                        } else {
                                          await deleteFromFavorites(product['id']);
                                        }
                                      } catch (e) {
                                        debugPrint('Error toggling favorite: $e');
                                      }
                                    },
                                    child: Icon(
                                      isFav ? Icons.favorite : Icons.favorite_border,
                                      color: isFav ? Colors.red : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Flexible(child:Text("ssdsdssdsdsdssdsdsdsss",maxLines: 1,overflow:TextOverflow.ellipsis ,) ),
                              Text("\u20B9${product['price']}"),
                              Text("${product['discount']}% off"),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> deleteFromFavorites(String productId) async {
    await FirebaseFirestore.instance.collection('favorites').doc(productId).delete();
  }

  Future<void> addToFavorites(Map<String, dynamic> product) async {
    await FirebaseFirestore.instance.collection('favorites').doc(product['id']).set(product);
  }
}
