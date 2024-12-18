import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _selectedFile;

  bool isNameEditable = false;
  bool isEmailEditable = false;
  bool isNumberEditable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Your Profile"),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                _selectedFile = await _imagePicker.pickImage(source: ImageSource.gallery);
                if (_selectedFile != null) {
                  log("File = ${_selectedFile!.path}");
                  setState(() {});
                }
              },
              child: Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        color: Colors.grey,
                        blurRadius: 5,
                        spreadRadius: 2,
                      )
                    ]),
                child: (_selectedFile == null)
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset("assets/avtar.png"),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.file(
                          File(_selectedFile!.path),
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      enabled: isNameEditable,
                      decoration: InputDecoration(
                        labelText: 'Enter Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  isNameEditable
                      ? ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isNameEditable = false;
                              log("Saved Name: ${nameController.text}");
                            });
                          },
                          child: Icon(Icons.check),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isNameEditable = true;
                            });
                          },
                          child: Icon(Icons.edit_outlined),
                        ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Email Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      enabled: isEmailEditable,
                      decoration: InputDecoration(
                        labelText: 'Enter Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  isEmailEditable
                      ? ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isEmailEditable = false;
                              log("Saved Email: ${emailController.text}");
                            });
                          },
                          child: const Icon(Icons.check),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isEmailEditable = true;
                            });
                          },
                          child: const Icon(Icons.edit_outlined),
                        ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            // Number Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: numberController,
                      keyboardType: TextInputType.number,
                      enabled: isNumberEditable,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly, // Allows only digits
                        LengthLimitingTextInputFormatter(10), 
                      ],
                      decoration: InputDecoration(
                        labelText: 'Enter Mobile Number',
                        prefixText: '+91',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  isNumberEditable
                      ? ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isNumberEditable = false;
                              log("Saved Number: ${numberController.text}");
                            });
                          },
                          child: const Icon(Icons.check),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isNumberEditable = true;
                            });
                          },
                          child: const Icon(Icons.edit_outlined),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
