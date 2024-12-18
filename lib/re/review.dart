import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:grouponproject/Settings.dart";
import "package:grouponproject/voucher.dart";

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State createState() => _HistoryPage();
}

class _HistoryPage extends State<HistoryPage> {
  bool isLoading = true; // Add a loading state
  QuerySnapshot? responce;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future fetchData() async {
    setState(() {
      isLoading = true; // Set loading to true while fetching data
    });
    responce = await FirebaseFirestore.instance.collection("Order").get();
    setState(() {
      isLoading = false; // Set loading to false once data is fetched
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        flexibleSpace: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45, left: 10),
              child: Row(
                children: [
                  Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                          color: Colors.amber,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 111, 111, 111),
                                blurStyle: BlurStyle.outer,
                                blurRadius: 20.0)
                          ]),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                          "https://i.pinimg.com/236x/db/1f/9a/db1f9a3eaca4758faae5f83947fa807c.jpg",
                          fit: BoxFit.cover)),
                  const SizedBox(width: 20),
                  Container(
                      height: 50,
                      width: 120,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: const Center(
                          child: Text(
                        "History",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      )))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45, left: 40),
              child: Row(children: [
                Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(192, 208, 247, 0.612)),
                    child: GestureDetector(
                        child: const Icon(Icons.discount_outlined,
                            color: Color.fromARGB(255, 33, 79, 243)),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Voucher()),
                          );
                        })),
                const SizedBox(width: 10),
                Container(
                    height: 45,
                    width: 45,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(192, 208, 247, 0.612)),
                    child: GestureDetector(
                        child: const Icon(Icons.sort,
                            color: Color.fromARGB(255, 33, 79, 243)),
                        onTap: () {})),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder:(context)=>const Settings())
                    // );
                  },
                  child: Container(
                      height: 45,
                      width: 45,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(192, 208, 247, 0.612)),
                      child: const Icon(Icons.settings_outlined,
                          color: Color.fromARGB(255, 33, 79, 243))),
                )
              ]),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          // Show a loader while data is loading
          isLoading
              ? Center(child: CircularProgressIndicator())
              : Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: responce!.docs.length, // Example item count
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Image.asset(responce!.docs[index]
                                  ["image"]), // Replace with actual image
                            ),
                            title: Text(
                              'Order #${index + 1}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(responce!.docs[index]["name"]),
                                SizedBox(height: 5),
                                Text('April 06'),
                              ],
                            ),
                            trailing: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(0, 66, 224, 1),
                                // Background color
                                foregroundColor: Colors.white, // Text color
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9),
                                  // Border radius of 18
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
                              child: const Text('Review'),
                            ),
                          ),
                        );
                      },
                    ),
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
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Review', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/sample.jpg'), // Replace with actual image
            ),
            title: Text('Order #92287157'),
            subtitle: Text('Lorem ipsum dolor sit amet consectetur.'),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              5,
              (index) => const Icon(Icons.star_border, color: Colors.amber, size: 36),
            ),
          ),
          const SizedBox(height: 20),
          const TextField(
            decoration: InputDecoration(
              hintText: 'Your comment',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
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
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text('Say it!'),
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
          const CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.check, color: Colors.white, size: 40),
          ),
          const SizedBox(height: 20),
          const Text('Done!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text('Thank you for your review'),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => const Icon(Icons.star, color: Colors.amber, size: 30),
            ),
          ),
        ],
      ),
    );
  }
}
