
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouponproject/durgesh/pin_validation.dart';
import 'package:grouponproject/home/homeModel.dart';
import './wish_modal.dart';



class Payment extends StatefulWidget {
  Payment({super.key, required this.proInfo,required this.disc,required this.data1,required this.data3});

 final homeModel proInfo;
 String? data1;
 String? data3;
  double disc ;
  @override
  _Payment createState() => _Payment(proInfo:proInfo,disc:disc,data1:data1!,data2:data3!);
}

class _Payment extends State {

  _Payment({required this.proInfo,required this.disc,required this.data1,required this.data2});
   final homeModel proInfo;
   double disc;
   String? data1;
 String? data2;

  int count = 1;

    void Showbottomsheet1(){
      showModalBottomSheet(
        isScrollControlled: true,
        context: context, builder: (context){
          return Padding(
            padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
              Text("UPI",style: GoogleFonts.raleway(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            
            const SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
            ),
            Padding(padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                GestureDetector(
                  onTap:(){
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Validation(price:proInfo.price-disc-8,img:proInfo.image,name:proInfo.name)),  
                  );
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                     
                    ),
                    child:ClipRRect(
                     borderRadius: BorderRadius.circular(25),
                     child: Image.asset("assets/phonepay.png",fit: BoxFit.cover,),
                    ),
                  ),
                ),
                const SizedBox(width: 15,),
                Text("PhonePay",style: GoogleFonts.raleway(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                  
              ],
            ),
            ),
             Center(child:  SizedBox(
                      height: 1, // Line height
                      width:  MediaQuery.of(context).size.width, // Full width of the screen
                      child: const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                    ),),
                    Padding(padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                   
                  ),
                  child:ClipRRect(
                   borderRadius: BorderRadius.circular(25),
                   child: Image.asset("assets/images.jpeg",fit: BoxFit.cover,),
                  ),
                ),
                const SizedBox(width: 15,),
                Text("GooglePay",style: GoogleFonts.raleway(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                  
              ],
            ),
            ),
             Center(child:  SizedBox(
                      height: 1, // Line height
                      width:  MediaQuery.of(context).size.width, // Full width of the screen
                      child: const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                    ),),
                     Padding(padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                   
                  ),
                  child:ClipRRect(
                   borderRadius: BorderRadius.circular(25),
                   child: Image.asset("assets/Preview.png",fit: BoxFit.fill,),
                  ),
                ),
                const SizedBox(width: 15,),
                Text("UPI ID",style: GoogleFonts.raleway(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                  
              ],
            ),
            ),
              ],
            ), 
          );
        });
    }
    void Showbottomsheet() {
   
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                 Text("Voucher",style: GoogleFonts.raleway(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                 ),),
                 Container(
              height:125,
              width:370,
              decoration: BoxDecoration(
                color:const Color.fromARGB(255, 255, 246, 246),
                borderRadius:const BorderRadius.all(
                  Radius.circular(13),
                ),
                border:Border.all(
                  color:const Color.fromARGB(255, 240, 166, 161),
                  width:2
                )
              ),
              child:Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:[
                  Padding(
                    padding: const EdgeInsets.only(left:15,top:7),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Voucher",
                              style:GoogleFonts.raleway(
                                color:const Color.fromARGB(255, 245, 120, 112),
                                fontWeight:FontWeight.bold,
                                fontSize : 20
                              ) 
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Text(
                              "1 day left",
                               style:GoogleFonts.raleway(
                                color:const Color.fromARGB(255, 245, 120, 112),
                                fontWeight:FontWeight.w600,
                                fontSize : 12
                              ) 
                            ),
                            const SizedBox(
                              width:10
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: Container(
                                height:25,
                                width:80,
                                 decoration:const BoxDecoration(
                                    color:Color.fromARGB(255, 244, 150, 143),
                                    borderRadius:BorderRadius.all(Radius.circular(5))
                                ),
                                child:const Center(
                                  child: Text(
                                    "Valid up to 2024",
                                    style:TextStyle(
                                      fontSize:10,  
                                    )
                                  ),
                                )
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height:20
                  ),
                   Row(
                    children: [
                      const SizedBox(
                        width :10
                      ),
                      const Icon(
                        Icons.shop,
                        color:Colors.blue
                      ),
                       const SizedBox(
                        width :8
                      ),
                       Text(
                        "First Purches",
                        style:GoogleFonts.raleway(
                          fontWeight:FontWeight.bold,
                          fontSize:20
                        )
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "5% off for your next order",
                          style:TextStyle(
                            fontSize:13,
                            fontWeight : FontWeight.w500  
                          )
                        ),
                        Container(
                          height:30,
                          width:100,
                          decoration:const BoxDecoration(
                            color:Color.fromARGB(255, 33, 79, 243),
                            borderRadius:BorderRadius.all(Radius.circular(10))
                          ),
                          child:Center(
                            child:  Text(
                              "Collected",
                              style:GoogleFonts.raleway(
                                color:Colors.white
                              )
                            ),
                          )
                        )
                      ],
                    ),
                  )
                ]
              )
            ),
            const SizedBox(
              height:20
            ),
            Container(
              height:125,
              width:370,
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius:const BorderRadius.all(
                  Radius.circular(13),
                ),
                border:Border.all(
                   color:const Color.fromARGB(255, 33, 79, 243),
                  width:2
                )
              ),
              child:Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:[
                  Padding(
                    padding: const EdgeInsets.only(left:15,top:7),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Voucher",
                              style:GoogleFonts.raleway(
                                color:const Color.fromARGB(255, 33, 79, 243),
                                fontWeight:FontWeight.bold,
                                fontSize : 20
                              ) 
                            ),
                          ],
                        ),

                        Row(
                          children: [
                           
                            Padding(
                              padding: const EdgeInsets.only(right:8.0),
                              child: Container(
                                height:25,
                                width:80,
                                 decoration:const BoxDecoration(
                                    color:Color.fromARGB(255, 234, 250, 255),
                                    borderRadius:BorderRadius.all(Radius.circular(5))
                                ),
                                child:const Center(
                                  child: Text(
                                    "Valid up to 2025",
                                    style:TextStyle(
                                      fontSize:10,  
                                    )
                                  ),
                                )
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height:20
                  ),
                   Row(
                    children: [
                      const SizedBox(
                        width :10
                      ),
                      const Icon(
                        Icons.shop,
                        color:Colors.blue
                      ),
                       const SizedBox(
                        width :8
                      ),
                       Text(
                        "Gift From Customer care",
                        style:GoogleFonts.raleway(
                          fontWeight:FontWeight.bold,
                          fontSize:20
                        )
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "10% off for your next order",
                          style:TextStyle(
                            fontSize:13,
                            fontWeight : FontWeight.w500  
                          )
                        ),
                        GestureDetector(
                          onTap:(){

                          },
                          child: Container(
                            height:30,
                            width:100,
                            decoration:const BoxDecoration(
                              color:Color.fromARGB(255, 33, 79, 243),
                              borderRadius:BorderRadius.all(Radius.circular(10))
                            ),
                            child:Center(
                              child:  Text(
                                "Collected",
                                style:GoogleFonts.raleway(
                                  color:Colors.white
                                )
                              ),
                            )
                          ),
                        )
                      ],
                    ),
                  )
                ]
              )
            ),
            const SizedBox(height: 10,),
          ]
        ),          );
        });
  }


    //int totolDiscount = widget.proInfo.price-widget.disc-8; 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Payment",
                style: GoogleFonts.raleway(
                    textStyle:
                        const TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(13),
              child: Container(
                width: 360,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(249, 249, 249, 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Shipping Address",
                        style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SizedBox(
                            width: 250,
                            child: const Text(
                                "Core2web,Nahre,pune Maharashtra",
                                maxLines: 2),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(0, 75, 254, 1)),
                          child: const Icon(
                            Icons.edit_rounded,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
           
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Payment",
                    style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w700)),
                  ),
                ),
                // SizedBox(width: 20),
                const Spacer(),
              GestureDetector(
                onTap: (){
                    Showbottomsheet();
                    setState(() {});
                },
                child:   Container(
                  width: 120,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: const Color.fromRGBO(0, 75, 254, 1))),
                  alignment: Alignment.center,
                  child: Text(
                    "Add Vouchers",
                    style: GoogleFonts.raleway(
                        color: const Color.fromRGBO(0, 75, 254, 1)),
                  ),
                ),
              ),
                const SizedBox(width: 10),
              ],
            ),
            SizedBox(
              height: 180,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 122,
                              height: 102,
                              child: Image.asset(proInfo.image),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  proInfo.name,
                                  style: GoogleFonts.nunitoSans(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(children: [
                                  Container(
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(229, 235, 252, 1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Text(data1!,
                                            style: GoogleFonts.raleway()),
                                      )),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(229, 235, 252, 1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Text(
                                          data2!,
                                          style: GoogleFonts.raleway(),
                                        ),
                                      )),
                                  const SizedBox(
                                    width: 40,
                                  ),
                                  
                                  Text(
                                    "\u{20B9}${proInfo.price}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ])
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: Container(
                width: 360,
                height: 250,
                decoration:
                    const BoxDecoration( color: Color.fromRGBO(249, 249, 249, 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Price Detail",
                        style: GoogleFonts.raleway(
                            textStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Text(
                          "Price (1 item)",
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                        ),
                        const Spacer(),
                        Text(
                          "\u{20B9}${proInfo.price}",
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Text(
                          "Discount",
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                        ),
                        const Spacer(),
                        Text(
                          //"-\u{20B9}${widget.disc}",
                          "\u{20B9}$disc",
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Text(
                          "Vouchers for you",
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                        ),
                        const Spacer(),
                        Text(
                          "-\u{20B9}5",
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Text(
                          "Platfrom Fee",
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                        ),
                        const Spacer(),
                        Text(
                          "-\u{20B9}3",
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                      const SizedBox(
                          height: 15,
                        ),
                   const Center(child:  SizedBox(
                      height: 1, // Line height
                      width: 330, // Full width of the screen
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                    ),),
                     const SizedBox(
                          height: 15,
                        ),
                      Row(
                      children: [
                        const SizedBox(width: 20),
                        Text(
                          "Total Amount",
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700)),
                        ),
                        const Spacer(),
                        Text(
                          "\u{20B9}${proInfo.price-disc-8}",
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w700)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                     Row(
                      children: [
                        const SizedBox(width: 20),
                        Text(
                          "You will saved \u{20B9}${disc+8} on this order",
                          style: GoogleFonts.raleway(
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),color: Colors.green),
                        ),
                       
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),
             Center(child:  SizedBox(
                      height: 1, // Line height
                      width:  MediaQuery.of(context).size.width, // Full width of the screen
                      child: const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                    ),),
            SizedBox(
              width : MediaQuery.of(context).size.width,
              height : 70,
             
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  const Icon(Icons.credit_card,size: 30,),
                  const SizedBox(width: 20),
                  Text("Credit/Debit/ATM Card",style: GoogleFonts.raleway(fontWeight: FontWeight.w500),),
                  const Spacer(),
                  const Icon(Icons.arrow_right_outlined,size: 40,),
                  const SizedBox(width: 10),
                ],
              ),
            ),
             Center(child:  SizedBox(
                      height: 1, // Line height
                      width:  MediaQuery.of(context).size.width, // Full width of the screen
                      child: const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                    ),),
            SizedBox(
              width : MediaQuery.of(context).size.width,
              height : 70,
             
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  const Icon(Icons.account_balance,size: 30,),
                  const SizedBox(width: 20),
                  Text("Net Banking",style: GoogleFonts.raleway(fontWeight: FontWeight.w500),),
                  const Spacer(),
                  const Icon(Icons.arrow_right_outlined,size: 40,),
                  const SizedBox(width: 10),
                ],
              ),
            ),
             Center(child:  SizedBox(
                      height: 1, // Line height
                      width:  MediaQuery.of(context).size.width, // Full width of the screen
                      child: const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                    ),),
            SizedBox(
              width : MediaQuery.of(context).size.width,
              height : 70,
             
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  const Icon(Icons.account_balance_wallet,size: 30,),
                  const SizedBox(width: 20),
                  Text("Wallets",style: GoogleFonts.raleway(fontWeight: FontWeight.w500),),
                  const Spacer(),
                  const Icon(Icons.arrow_right_outlined,size: 40,),
                  const SizedBox(width: 10),
                ],
              ),
            ),
             Center(child:  SizedBox(
                      height: 1, // Line height
                      width:  MediaQuery.of(context).size.width, // Full width of the screen
                      child: const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                    ),),
           GestureDetector(
            onTap: (){
              setState(() {
                Showbottomsheet1();
              });
            },
            child:  Container(
              width : MediaQuery.of(context).size.width,
              height : 70,
             color: Colors.white,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  const Icon(Icons.payment,size: 30,),
                  const SizedBox(width: 20),
                  Text("UPI",style: GoogleFonts.raleway(fontWeight: FontWeight.w500),),
                  const Spacer(),
                  const Icon(Icons.arrow_right_outlined,size: 40,),
                  const SizedBox(width: 10),
                ],
              ),
            ),
           ),
             const SizedBox(height: 20,),
             
          ],
        ),
      ),
    );
  }
}
