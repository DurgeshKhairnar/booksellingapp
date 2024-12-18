import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:grouponproject/dabase.dart';
import 'package:grouponproject/vaibhav/login.dart';
import 'package:grouponproject/vaibhav/userModel.dart';

class GlassMorphismContainer extends StatefulWidget {
  const GlassMorphismContainer({super.key});

  @override
  _GlassMorphismContainerState createState() => _GlassMorphismContainerState();
}

class _GlassMorphismContainerState extends State<GlassMorphismContainer> {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/imglogin.jpg',
            fit: BoxFit.cover,
          ),
          
          // Glassmorphism Effect Container
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),  // Rounded corners
                child: Container(
                  width: 350,
                  height: 450,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 71, 71, 71).withOpacity(0.3),  // Semi-transparent background
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),  // Light border to enhance glass effect
                      width: 5,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),  // Blur effect
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          // Welcome Text
                          const Text(
                            'Welcome ',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                          // Email or Username TextField
                          _buildTextField("Email or Username"),

                          // Password TextField
                          _buildTextField2("Password"),

                          // Login Button
                          _buildLoginButton(),

                          // Sign up option
                          _buildSignUpOption(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build the TextField
  Widget _buildTextField(String hint) {
    return Container(
      height: 60,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.5), // Slightly transparent background for the input fields
      ),
      child: TextField(

        controller: usernameController,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none, // Remove the default border
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
Widget _buildTextField2(String hint) {
    return Container(
      height: 60,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withOpacity(0.5), // Slightly transparent background for the input fields
      ),
      child: TextField(

        controller: passwordController,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none, // Remove the default border
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  // Helper method to build the Login button
  Widget _buildLoginButton() {
    return GestureDetector(
      onTap:()async{
            final username = usernameController.text;
                final password = passwordController.text;

                final user = User(username: username, password: password);
                final dbHelper = DatabaseHelper.instance;

                await dbHelper.addUser(user);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("User registered successfully!")),
                );
      },
      child: Container(
        height: 60,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue, // Login button color
        ),
        child: const Center(
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build the Sign-up option
  Widget _buildSignUpOption(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        children: [
          const Text(
            "Don't have an account? ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: const Text(
              "Login",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
