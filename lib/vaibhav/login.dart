import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grouponproject/dabase.dart';
import 'package:grouponproject/home/homePage.dart';



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State createState() => _OpenAppAnimationState();
}

class _OpenAppAnimationState extends State<Login>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController and animations
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    // Slide animation from bottom to center
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1), // Start just below the screen
      end: Offset(0, 0),   // End at the center
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Fade-in animation from 0 (transparent) to 1 (fully visible)
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    // Start the animation when the widget is built
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 211, 110),
      body: Stack(
        fit: StackFit.expand,
        children:[
          Image.asset(
            'assets/hoo1.png',
            fit: BoxFit.cover,
          ),
           Center(
          child: SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                // Blur effect using BackdropFilter
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Adjust blur intensity
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2), // Semi-transparent color overlay
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              controller:usernameController,
                              obscureText: false,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.5), // Semi-transparent input background
                                prefixIcon: const Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                hintText: "Username",
                                label: Text("Username"),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              controller:passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.5),
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                suffixIcon: const Icon(Icons.visibility),
                                hintText: "Password",
                                label: Text("Password"),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.blue,
                                    width: 2.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          GestureDetector(
                            onTap:()async{ 
                               final username = usernameController.text;
                                  final password = passwordController.text;
        
                                  final dbHelper = DatabaseHelper.instance;
                                  final user = await dbHelper.getUser(username, password);
        
                                  if (user != null) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text("Login successful!")),
                                              );
                                              Navigator.push(
                                     context,
                                     MaterialPageRoute(builder:(context)=>homePage())
                                   );
                                              // Navigate to the next screen
                                            } else {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text("Invalid credentials!")),
                                        );
                                  } 
                              
                            },
                            child: Container(
                              width: 320,
                              height: 62,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 14, 136, 236),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text(
                                  "Login in",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text("Don't have an account?"),
                          SizedBox(height: 10),
                          Text(
                            "Sign up",
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
            ),
          ),
        ),
        ]
      ),
    );
  }
}
