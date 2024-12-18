import 'package:flutter/material.dart';
import 'package:grouponproject/durgesh/payment_last.dart';
import 'package:pinput/pinput.dart';

class Validation extends StatefulWidget {
  const Validation({super.key,required this.price,required this.img,required this.name});
  final double price;
  final String img;
  final String name;
  @override
  State<Validation> createState() => _ValidationState();
}

class _ValidationState extends State<Validation> {
final TextEditingController _pinController = TextEditingController();
  String message = '';
  
    @override
  void dispose() {
    _pinController.dispose(); // Dispose controller when not needed
    super.dispose();
  }

  void _validatePin() {
       if (_pinController.text.length < 4) {
      // Show snackbar if PIN is less than 4 digits
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Enter a four-digit PIN"),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      setState(() {
        // Check if the entered PIN is "1234"
        message = (_pinController.text == '1234') ? "Correct" : "Wrong";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            SizedBox(height: 30,),
            Row(
                children: [
                    Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Padding(padding: EdgeInsets.only(left: 10),
                           child:Text("Union Bank Of India",style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                           ),),),
                           Padding(padding: EdgeInsets.only(left: 10),
                           child:  Text("XXXX0671",style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                           ),),
                           )
                          
                        ],
                    ),
                    
                    Spacer(),
                    SizedBox(
                        height: 50,
                        width: 90,
                        child:ClipRRect( child:Image.asset("assets/UPI.jpg",fit: BoxFit.cover,)),
                    ),
                     SizedBox(width: 20,),
                ],
            ),
            SizedBox(height: 20,),
           Container(
            color: const Color.fromARGB(255, 230, 230, 230),
            width: MediaQuery.of(context).size.width,
            child:  Column(
                children: [
                    Row(
                        children: [
                            Padding(padding: EdgeInsets.only(left: 10),
                            child: Text("TO:",style: TextStyle(fontSize: 18)),
                            ),
                            Spacer(),
                            Text("Flipkart",style:TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                            ),),
                            SizedBox(width: 50,),
                        ],
                    ),
                     Row(
                        children: [
                            Padding(padding: EdgeInsets.only(left: 10),
                            child: Text("Sending:",style: TextStyle(fontSize: 18),),
                            ),
                            Spacer(),
                            Text("\u20B9${widget.price}",style:TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                            ),),
                            SizedBox(width: 22),
                             Icon(Icons.keyboard_arrow_down),
                            SizedBox(width: 20,),
                        ],
                    )
                ]
            ,),
           ),
           SizedBox(height: 20,),
           Center(
            child: Text("ENTER 4-DIGIT UPI  PIN",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
           ),
           Pinput(
            length: 4,
            controller: _pinController,
            obscureText: true,
            obscuringWidget: Text(".",
              style:TextStyle(
                fontSize:40,
                fontWeight:FontWeight.bold
              )
            ),
            defaultPinTheme:PinTheme(
                width: 50,
                height: 50,
                
                decoration: BoxDecoration(
                  border:Border(
                    bottom: BorderSide(
                        color: Colors.black
                    )
                  )
                )
            ),
            
            // onChanged: (value){
            //     setState(() {
            //       code = value;
            //     });
            // },
            onCompleted: (value){
            _validatePin();
            Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) =>  PaymentLast(price:widget.price,img:widget.img,name:widget.name)),
                      (Route<dynamic> route) => false,
                  );
            },
            onSubmitted: (value) {
              setState(() {
                message = (value == '1234') ? "Correct" : "Wrong"; // Check PIN and update message
              });
            },
          ),
          SizedBox(height: 20),
          Text(
            message, // Display correct or wrong message
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          SizedBox(height: 20),
          Center(
            child: Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 236, 178),
                    borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.error,size: 40,color: Colors.orange,),
                    Text('''You are transferring money from your\n Union Bank account to Flipkart ''',)
                  ],
                )
            ))
          
        ],
    ),
    );
  }
}