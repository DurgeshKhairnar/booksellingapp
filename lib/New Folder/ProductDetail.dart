import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grouponproject/New Folder/wish_model.dart';


 // Assuming this contains the Product model

class ProductDetail extends StatefulWidget {
  final Productdet product;

  const ProductDetail({super.key, required this.product});

  @override
  State createState() => _ProductDetailState(product:product);
}

class _ProductDetailState extends State<ProductDetail> {
  Map<String, bool> cart = {};
  Map<String, bool> favorite= {}; // Track items added to the cart by product ID
  late bool isCarted;
   late bool isFav;

   _ProductDetailState({required this.product});
   final Productdet product;

  @override
  void initState() {
    super.initState();
    // Initialize the cart state for the current product
    isCarted = cart[product.id] ?? false;
    isFav = favorite[product.id] ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.img,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product.title,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Price: \u20B9${product.price}",
                    style: const TextStyle(fontSize: 20, color: Colors.green),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Discount: ${product.discount}%",
                    style: const TextStyle(fontSize: 16, color: Colors.red),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Description",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isCarted = !isCarted; // Toggle the cart state
                          });
                          if (isCarted) {
                            addTocart(product); // Add to cart
                          } else {
                            removeFromCart(product.id); // Remove from cart
                          }
                        },
                        child: Text(isCarted ? "Remove from Cart" : "Add to Cart"),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                         setState(() {
                            isFav = !isFav; // Toggle the cart state
                          });
                          if (isFav) {
                            addToFav(product); // Add to cart
                          } else {
                            removeFromFav(product.id); // Remove from cart
                          }
                        },
                        child: Text(isFav ? "Remove from Wishlist" : "Add to Wishlist"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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

    Future<void> addToFav(Productdet product) async {
    try {
      await FirebaseFirestore.instance.collection('favorites').doc(product.id).set({
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
 Future<void> removeFromFav(String productId) async {
    try {
      await FirebaseFirestore.instance.collection('favorites').doc(productId).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product removed from cart')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error removing from cart: $e')),
      );
    }
  }
  Future<void> removeFromCart(String productId) async {
    try {
      await FirebaseFirestore.instance.collection('cart').doc(productId).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product removed from cart')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error removing from cart: $e')),
      );
    }
  }
}
