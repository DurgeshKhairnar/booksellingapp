import 'package:flutter/material.dart';
import 'package:grouponproject/dabase.dart';
import 'package:grouponproject/vaibhav/userModel.dart';


class Signup extends StatefulWidget{
  const Signup({super.key});

  @override
  State createState ()=> _SignupState();
}

class _SignupState extends State with TickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState(){
    super.initState();
    controller = AnimationController(vsync:this,duration:Duration(seconds:2));

    animation = CurvedAnimation(parent:controller,curve:Curves.easeInOut);

    controller.repeat(reverse:true);
  }

    final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();





  @override
  Widget build(BuildContext context){
     
    return Scaffold(
       backgroundColor:Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const Text(
              "Create",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Account",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),

            ScaleTransition(
              scale:animation,
              child: SizedBox(
                height:150,
                width:150,
                child:Image.network("https://www.shutterstock.com/image-vector/sign-page-abstract-concept-vector-600nw-2348868849.jpg")
              ),
            ),
            
            const Spacer(),
            Container(
              height: 53,
              width: 335,
              decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(50),
                color: const Color.fromARGB(198, 244, 241, 241)
              ),
              child: TextField(
                controller :passwordController,
                decoration: InputDecoration(
                   border: InputBorder.none,
                  hintText: "     Email",
                   hintStyle:TextStyle(
                    color:Color.fromARGB(255, 193, 193, 193),
                    fontSize:17
                  ),
                  filled:false,
                  fillColor:Color.fromARGB(255, 215, 211, 211)
                 
                ),
              ),
            ),
        
            const SizedBox(
              height: 10,
            ),
        
            Container(
              height: 53,
              width: 335,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromARGB(198, 244, 241, 241)
              ),
              child: TextField(
                controller:passwordController,
                decoration: InputDecoration(
                   border: InputBorder.none,
                  hintText: "     Password",
                  hintStyle:TextStyle(
                    color:Color.fromARGB(255, 193, 193, 193),
                    fontSize:17
                  ),
                  suffixIcon:Icon(Icons.remove_red_eye_outlined),
                  filled:false,
                  fillColor:Color.fromARGB(255, 215, 211, 211)
                 
                ),
              ),
            ),
        
            const SizedBox(
              height: 10,
            ),
        
            Container(
              height: 53,
              width: 335,
              decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(50),
                color: const Color.fromARGB(198, 244, 241, 241)
              ),
               child: const TextField(
                decoration: InputDecoration(
                   border: InputBorder.none,
                  hintText: "     Mobile No",
                   hintStyle:TextStyle(
                    color:Color.fromARGB(255, 193, 193, 193),
                    fontSize:17
                  ),
                  filled:false,
                  fillColor:Color.fromARGB(255, 215, 211, 211)
                 
                ),
              ),
            ),
        
            const SizedBox(
              height: 50,
            ),
        
            GestureDetector(
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
                height: 63,
                width: 335,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:const Color.fromARGB(255, 35, 101, 253),
                ),
                child: const Center(
                  child: Text("SignUp",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
        
             Center(
              child: GestureDetector(
                  onTap:(){
                    Navigator.pop(context);
                  },
                child: Text("Cancel",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 70,
            ),

          ]
        ),
      ),
    );
  }
}