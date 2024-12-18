import "package:flutter/material.dart";

class MyActivityPage extends StatelessWidget {
  const MyActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('My Activity'),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   iconTheme: IconThemeData(color: Colors.black),
      // ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 40,
              width: 331,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(16,8,16,8),
                    height: 35,
                    width: 115,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 66, 224, 1), // Replace with your desired background color
                      borderRadius: BorderRadius.circular(18) // This makes the container round
                    ),
                    child: Text("My Activity", style: TextStyle(color: Colors.white),),
                  ),
                  SizedBox(width: 80,),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(229, 235, 252, 1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.qr_code_outlined,color: Color.fromRGBO(0, 66, 224, 1),),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(229, 235, 252, 1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.message_outlined,color: Color.fromRGBO(0, 66, 224, 1),),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(229, 235, 252, 1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.settings_suggest_outlined,color: Color.fromRGBO(0, 66, 224, 1),),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Text('Hello, Amanda!', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Container(
              height: 70,
              width: 335,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color.fromRGBO(249, 249, 249, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Announcement', style: TextStyle(fontWeight: FontWeight.bold)),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 66, 224, 1), // Replace with your desired background color
                      shape: BoxShape.circle, // This makes the container round
                    ),
                    height: 30,
                    width: 30,
                    child: Icon(Icons.arrow_forward,color: Colors.white,),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Recently viewed', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) => CircleAvatar(radius: 30)),
            ),
            SizedBox(height: 20),
            Text('My Orders', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Row(
              children: [
                OrderStatusButton(label: 'To Pay'),
                OrderStatusButton(label: 'To Receive', onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ToReceivePage()),
                  );
                }),
                OrderStatusButton(label: 'To Review', onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoryPage()),
                  );
                }),
                //OrderStatusButton(label: 'To Review'),
              ],
            ),
            SizedBox(height: 20),
            Text('Stories', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(5, (index) => Placeholder(fallbackHeight: 100, fallbackWidth: 60)),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
      //     BottomNavigationBarItem(icon: Icon(Icons.receipt), label: 'Orders'),
      //     BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      //   ],
      // ),
    );
  }
}

// Order Status Button
class OrderStatusButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const OrderStatusButton({super.key, required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8),
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Color.fromRGBO(229, 235, 252, 1),
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text(label, style: TextStyle(color: Color.fromRGBO(0, 66, 224, 1))),
        ),
      ),
    );
  }
}

// To Receive Page
class ToReceivePage extends StatelessWidget {
  const ToReceivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('To Receive'),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   iconTheme: IconThemeData(color: Colors.black),
      // ),
      body: Column(
        children: [
          SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 40,
              width: 331,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(16,8,16,8),
                    height: 35,
                    width: 115,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 66, 224, 1), // Replace with your desired background color
                      borderRadius: BorderRadius.circular(18) // This makes the container round
                    ),
                    child: Text("To Receive", style: TextStyle(color: Colors.white),),
                  ),
                  SizedBox(width: 80,),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(229, 235, 252, 1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.qr_code_outlined,color: Color.fromRGBO(0, 66, 224, 1),),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(229, 235, 252, 1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.message_outlined,color: Color.fromRGBO(0, 66, 224, 1),),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(229, 235, 252, 1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.settings_suggest_outlined,color: Color.fromRGBO(0, 66, 224, 1),),
                  )
                ],
              ),
            ),
          SizedBox(
            height: 600,
            child: ListView.builder(
              itemCount: 5, // Mock data count
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(backgroundImage: AssetImage('assets/sample.jpg')), // Replace with actual images
                  title: Text('Order #92287157',style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text('Standard Delivery\n3 items'),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(0, 66, 224, 1), // Background color
                      foregroundColor: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9), // Border radius of 18
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TrackOrderPage()),
                      );
                    },
                    child: Text('Track'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Track Order Page
class TrackOrderPage extends StatelessWidget {
  const TrackOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: Text('Track Your Order'),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   iconTheme: IconThemeData(color: Colors.black),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 40,
              width: 331,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(16,8,16,8),
                    height: 35,
                    width: 115,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 66, 224, 1), // Replace with your desired background color
                      borderRadius: BorderRadius.circular(18) // This makes the container round
                    ),
                    child: Text("To Receive", style: TextStyle(color: Colors.white),),
                  ),
                  SizedBox(width: 80,),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(229, 235, 252, 1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.qr_code_outlined,color: Color.fromRGBO(0, 66, 224, 1),),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(229, 235, 252, 1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.message_outlined,color: Color.fromRGBO(0, 66, 224, 1),),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(229, 235, 252, 1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.settings_suggest_outlined,color: Color.fromRGBO(0, 66, 224, 1),),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(5),
              height:52,
              width:335,
              child: Text(
                '''Tracking Number: 
              LGS-i92927839300763731''', 
              style: TextStyle(fontWeight: FontWeight.bold))
            ),
            SizedBox(height: 20),
            Stepper(
              currentStep: 2,
              steps: [
                Step(
                  title: Text('Packed'),
                  content: Text('Your parcel is packed and will be handed over to our delivery partner.'),
                  isActive: true,
                ),
                Step(
                  title: Text('On the Way to Logistic Facility'),
                  content: Text('On the way to the logistic facility.'),
                  isActive: true,
                ),
                Step(
                  title: Text('Arrived at Logistic Facility'),
                  content: Text('Arrived at the logistic facility.'),
                  isActive: true,
                ),
                Step(
                  title: Text('Shipped'),
                  content: Text('Expected on April 20.'),
                  isActive: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// History Page
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('History'),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   iconTheme: IconThemeData(color: Colors.black),
      // ),
      body: Column(
        children: [
          SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 40,
              width: 331,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(30,8,8,8),
                    height: 35,
                    width: 115,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 66, 224, 1), // Replace with your desired background color
                      borderRadius: BorderRadius.circular(18) // This makes the container round
                    ),
                    child: Text("History", style: TextStyle(color: Colors.white),),
                  ),
                  SizedBox(width: 80,),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(229, 235, 252, 1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.qr_code_outlined,color: Color.fromRGBO(0, 66, 224, 1),),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(229, 235, 252, 1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.message_outlined,color: Color.fromRGBO(0, 66, 224, 1),),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(229, 235, 252, 1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.settings_suggest_outlined,color: Color.fromRGBO(0, 66, 224, 1),),
                  )
                ],
              ),
            ),

          SizedBox(
            height: 600,
            child: ListView.builder(
              itemCount: 5, // Example item count
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/sample.jpg'), // Replace with actual image
                    ),
                    title: Text('Order #92287157',style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Lorem ipsum dolor sit amet consectetur.'),
                        SizedBox(height: 5),
                        Text('April 06'),
                      ],
                    ),
                    // trailing: OutlinedButton(
                    //   ,
                    //   child: Text('Review'),
                    // ),
                    trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(0, 66, 224, 1), // Background color
                      foregroundColor: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9), // Border radius of 18
                      ),
                    ),
                    onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return ReviewBottomSheet();
                          },
                        );
                      },
                    child: Text('Review'),
                  ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Review Bottom Sheet
class ReviewBottomSheet extends StatelessWidget {
  const ReviewBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Review', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/sample.jpg'), // Replace with actual image
            ),
            title: Text('Order #92287157'),
            subtitle: Text('Lorem ipsum dolor sit amet consectetur.'),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              5,
              (index) => Icon(Icons.star_border, color: Colors.amber, size: 36),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: 'Your comment',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Close the bottom sheet
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ReviewSuccessDialog();
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: Size(double.infinity, 50),
            ),
            child: Text('Say it!'),
          ),
        ],
      ),
    );
  }
}

// Review Success Dialog
class ReviewSuccessDialog extends StatelessWidget {
  const ReviewSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.check, color: Colors.white, size: 40),
          ),
          SizedBox(height: 20),
          Text('Done!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Text('Thank you for your review'),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => Icon(Icons.star, color: Colors.amber, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
