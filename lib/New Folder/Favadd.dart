import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grouponproject/New%20Folder/AddtoCart.dart';
import 'package:grouponproject/New%20Folder/wish_model.dart';
import 'package:grouponproject/ProductDetail/Product.dart';

 // Assuming this contains your product model

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  final Map<String, bool> cart = {}; // Track items in the cart locally
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Wish List",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("favorites").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                "No favorites available",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey),
              ),
            );
          }

          final favoriteList = snapshot.data!.docs.map((doc) {
            return Productdet(
              img: doc['img'],
              title: doc['title'],
              description: doc['description'],
              price: doc['price'],
              discount: doc['discount'],
              id: doc.id, // Use doc.id as the product ID for Firestore
            );
          }).toList();

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            itemCount: favoriteList.length,
            itemBuilder: (context, index) {
              final product = favoriteList[index];
               final isCarted = cart[product.id] ?? false; // Track cart status locally

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
                                      await deletecart(product.id);
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "\u20B9${product.price}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () async {
                                      setState(() {
                                        cart[product.id] = !isCarted;
                                         Navigator.push(context,MaterialPageRoute(builder:(context)=>const AddtoCart()));
                                      });

                                      try {
                                        if (!isCarted) {
                                          await addTocart(product); // Add to cart
                                        } else {
                                          await deletecart(product.id); // Remove from cart
                                        }
                                      } catch (e) {
                                        debugPrint('Error toggling cart: $e');
                                      }
                                    },
                                    child: Icon(
                                      isCarted ? Icons.shopping_cart : Icons.shopping_cart_outlined,
                                      color: isCarted ? Colors.blue : Colors.grey,
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
          );
        },
      ),
    );
  }

  Future<void> deletecart(String productId) async {
    try {
      await FirebaseFirestore.instance.collection('favorites').doc(productId).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Item removed from favorites')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error removing item from cart: $e')),
      );
    }
  }

  Future<void> addTocart(Productdet product) async {
    try {
      await FirebaseFirestore.instance.collection('cart').doc(product.id).set({
        'img': product.img,
        'title': product.title,
        'description': product.description,
        'price': product.price,
        'discount': product.discount,
        'id': product.id,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${product.title} added to cart')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding to cart: $e')),
      );
    }
  }
}
