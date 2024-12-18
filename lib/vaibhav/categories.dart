import 'package:flutter/material.dart';

class Categories extends StatefulWidget{
  const Categories({super.key});

  @override
  State createState ()=> _CategoriesState();
}

class _CategoriesState extends State{
  @override
  Widget build(BuildContext context){

    
    return Scaffold(
       backgroundColor:Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 50,left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const  Row(
              children: [
                 Text("All Categories",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: Icon(Icons.clear),
                ),
        
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 36,
                    width: 114,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color:const Color.fromRGBO(0, 76, 255, 1),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                      color:const Color.fromARGB(255, 208, 218, 243),
                      
                    ),
                    child: const Center(
                      child: Text("All",
                      style: TextStyle(
                        fontSize: 18
                      ),
                    )),
                  ),
              
                  Container(
                    height: 36,
                    width: 114,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[300],
                    ),
                    child:const Center(
                      child: Text("Female",
                      style: TextStyle(
                        fontSize: 18
                      ),
                    )),
                  ),
              
                  Container(
                    height: 36,
                    width: 114,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[300]
                    ),
                    child: const Center(
                      child: Text("Male",
                      style: TextStyle(
                        fontSize: 18
                      ),
                    )),
                  ),
              
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Container(
              height: 60,
              width: 370,
              decoration: BoxDecoration(
                boxShadow: [
                 BoxShadow(
                   color: Colors.black.withOpacity(0.2),
                   blurRadius: 10.0,
                   spreadRadius: 2.0,
                   offset: const Offset(5, 5)
                  )
                ],
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                
                  Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      
                    ),
                    clipBehavior: Clip.antiAlias,
                    margin: const EdgeInsets.all(8),
                    child: Image.network('https://www.techprevue.com/wp-content/uploads/2016/09/fashion-online-shopping-sites.jpg',
                      fit: BoxFit.fitHeight,
                      
                    )
                  ),

                  const SizedBox(
                    width: 20,
                  ),

                  

                  const Text("Clothing",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),

                  const Icon(Icons.arrow_drop_down_outlined,
                    size: 50,
                  ),

                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Row(
              
              children: [
                Container(
                  height: 50,
                  width: 175,
                  
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: const Color.fromRGBO(245, 169, 169, 1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(child: Text("Dresses",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600
                    ),
                  )),
                ),
                const SizedBox(
                  width:10,
                ),
                Container(
                  height: 50,
                  width: 175,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: const Color.fromRGBO(245, 169, 169, 1),
                      width: 1
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(child: Text("Pants",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600
                    ),
                  )),
                ),
              ],
            ),
            const SizedBox(height: 10,),

            Row(
              
              children: [
                Container(
                  height: 50,
                  width: 175,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: const Color.fromRGBO(245, 169, 169, 1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: const Center(child: Text("Skirts",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600
                    ),
                  )),

                  
                ),
                const SizedBox(
                  width:10,
                ),
                Container(
                  height: 50,
                  width: 175,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: const Color.fromRGBO(245, 169, 169, 1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(child: Text("Shorts",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600
                    ),
                  )),
                ),
              ],
            ),
            const SizedBox(height: 10,),

            Row(
              
              children: [
                Container(
                  height: 50,
                  width: 175,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: const Color.fromRGBO(245, 169, 169, 1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(child: Text("Jackets",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600
                    ),
                  )),
                  
                ),
                const SizedBox(
                  width:10,
                ),
                Container(
                  height: 50,
                  width: 175,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: const Color.fromRGBO(245, 169, 169, 1),
                      width:1
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(child: Text("Hoodies",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600
                    ),
                  )),
                ),
              ],
            ),
            const SizedBox(height: 10,),

            Row(
              
              children: [
                Container(
                  height: 50,
                  width: 175,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: const Color.fromRGBO(245, 169, 169, 1),
                      width: 1
                    ),
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: const Center(child: Text("Shirts",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600
                    ),
                  )),
                ),

                const SizedBox(
                  width: 10,
                ),


                Container(
                  height: 50,
                  width: 175,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: const Color.fromRGBO(245, 169, 169, 1),
                      width: 1
                    ),
                    borderRadius: BorderRadius.circular(15)
                  ),

                  child: const Center(child: Text("Polo",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600
                    ),
                  )),
                ),
              ],
            ),
            const SizedBox(height: 10,),

            Row(
              
              children: [
                Container(
                  height: 52,
                  width: 175,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: const Color.fromRGBO(245, 169, 169, 1),
                      width: 1
                    ),
                    borderRadius: BorderRadius.circular(15)
                  ),

                  child: const Center(child: Text("T-Shirts",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600
                    ),
                  )),
                  
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 52,
                  width: 175,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: const Color.fromRGBO(245, 169, 169, 1),
                      width: 1
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(child: Text("Tunics",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600
                    ),
                  )),
                ),
              ],
            ),
            const SizedBox(height: 10,),

            Container(
              height: 60,
              width: 370,
            
              decoration: BoxDecoration(
                boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  offset: const Offset(5, 5)
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
              ),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network('https://www.mikepawleysports.com.au/img/product/brooks-addiction-13-2e-extra-wide-womens-running-shoes-bluetealpurple-cactus-us-9-1330-1600.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(
                    width: 20,
                  ),

                  const Text("Shoe",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Spacer(),

                  const Icon(Icons.arrow_drop_down,size: 50,),

                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),

            const SizedBox(
              height:10,
            ),

            Container(
              height: 60,
              width: 370,
              
              decoration: BoxDecoration(
                boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  offset: const Offset(5, 5)
                )
              ],
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
              ),
              
              
            ),

            const SizedBox(
              height:10,
            ),


            Container(
              height: 60,
              width: 370,
              
              decoration: BoxDecoration(
                boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  offset: const Offset(5, 5)
                )
              ],
              color: Colors.grey[200],
              ),
            ),

            const SizedBox(
              height:10,
            ),


            Container(
              height: 60,
              width: 370,
              
              decoration: BoxDecoration(
                boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  offset: const Offset(5, 5)
                )
              ],
              color: Colors.grey[200],
              ),
            ),

            const SizedBox(
              height:10,
            ),


            Container(
              height: 60,
              width: 370,
              
              decoration: BoxDecoration(
                boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  offset: const Offset(5, 5)
                )
              ],
              color: Colors.grey[200],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}