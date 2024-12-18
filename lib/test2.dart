import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Mock data
  final List<Map<String, String>> data = [
    {"name": "John Doe", "image": "assets/sample.jpg"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Profile", style: GoogleFonts.raleway(fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGreetingSection(),
            _buildRewardSection(),
            _buildRecentlyViewed(),
            _buildMyOrders(),
            _buildStories(),
          ],
        ),
      ),
    );
  }

  // Greeting Section with animation
  Widget _buildGreetingSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 15, bottom: 20),
      child: Row(
        children: [
          Text(
            "Hello, ",
            style: GoogleFonts.raleway(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: 1.0,
            child: Text(
              data[0]["name"]!,
              style: GoogleFonts.raleway(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            " !!!",
            style: GoogleFonts.raleway(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Reward Section with shadow effect
  Widget _buildRewardSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 10,
                      offset: Offset(0, 5), // Shadow position
                    )
                  ],
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: Icon(Icons.favorite, size: 40, color: Colors.blue),
              ),
              Positioned(
                right: 0,
                child: Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 16),
                ),
              ),
            ],
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "You just got a reward!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  "Lorem ipsum dolor sit amet, consetetur sadipscing elitr.",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Recently Viewed Section with animation
  Widget _buildRecentlyViewed() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Recently Viewed", style: GoogleFonts.trochut(fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          AnimatedList(
            initialItemCount: 5,
            itemBuilder: (context, index, animation) {
              return _buildRecentlyViewedItem(index, animation);
            },
          ),
        ],
      ),
    );
  }

  // Build each item in Recently Viewed with fade-in animation
  Widget _buildRecentlyViewedItem(int index, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue.withOpacity(0.2),
          ),
          child: Icon(Icons.image, color: Colors.white),
        ),
      ),
    );
  }

  // My Orders Section
  Widget _buildMyOrders() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("My Orders", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
//              _buildOrderButton("To Pay"),
              // _buildOrderButton("To Receive"),
              // _buildOrderButton("To Review"),
            ],
          ),
        ],
      ),
    );
  }

  // Order Button with scale effect
  static Widget _buildOrderButton(String label) {
    return GestureDetector(
      onTap: () {
        // Navigate to corresponding page
      },
      child: AnimatedScale(
        scale: 1.05,
        duration: Duration(milliseconds: 300),
        child: Container(
          height: 43,
          width: 110,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 211, 217, 248),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(color: Color.fromARGB(255, 33, 44, 243), fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }

  // Stories Section with animated transitions
  Widget _buildStories() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Stories", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildStoryItem("Live", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyrG1pMPPbEBCmqbsiMsdYaRtB2klNo8FGyg&s", Colors.green),
                _buildStoryItem("Sale", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOyn7I-op_iQylQuW_AVpUF5U2N-iNzKfYWw&s", Colors.red),
                _buildStoryItem("Discount", "https://img.freepik.com/free-photo/woman-with-shopping-bags-studio-yellow-background-isolated_1303-14286.jpg", Colors.pink),
                _buildStoryItem("New Arrivals", "https://img.freepik.com/premium-photo/female-models-smiling-woman-peeking-into-shopping-bag-adult-woman-posing-with-shopping-bags-abst_1283069-5886.jpg", Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Individual Story Item with fade-in and scaling animation
  Widget _buildStoryItem(String label, String imageUrl, Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: GestureDetector(
        onTap: () {
          // Open the story or show details
        },
        child: AnimatedScale(
          scale: 1.05,
          duration: Duration(milliseconds: 300),
          child: Stack(
            children: [
              Container(
                height: 180,
                width: 115,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
              Positioned(
                top: 5,
                left: 5,
                child: Container(
                  height: 25,
                  width: 50,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      label,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
