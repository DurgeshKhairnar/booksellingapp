
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:grouponproject/home/PlashScreen.dart";
import "package:sqflite/sqflite.dart";
import "package:path/path.dart";
import "profile_model.dart";

dynamic database;
TextEditingController nameController = TextEditingController();
List<Map> data = [];

insertName(profileModel obj)async{

  Database localDB = await database;

  int id = await localDB.insert(
    "Profile",
    obj.ml(),
    conflictAlgorithm:ConflictAlgorithm.replace
  );
}

getName()async{
   Database localDB = await database;

   data=await localDB.query(
    "Profile",
   );

  return data;
}

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:const FirebaseOptions(
      apiKey:"AIzaSyBIIgYeN2miqv0qB0dEcsMPx--obxfcXNA",
      appId:"1:440089533608:android:116a1ae87ea4744bb9b69d",
      messagingSenderId:"440089533608",
      projectId:"groupby-91b72"
    )
  );


 database = openDatabase(
      join(await getDatabasesPath(),"ProfileDB.db"),
      version : 1,
      onCreate:(db,version)async{
        await db.execute(
          '''
            create table Profile(
              name TEXT,
              id INTEGER PRIMARY KEY,
              email TEXT,
              pass TEXT
            )
          '''
        );
      }
  );

  profileModel obj = profileModel(
    id : 1,
    name : "Durgesh",
    email : "durgeshdeore2002@gmail.com",
    pass : "123"
  );

  insertName(obj);
  print(await getName());
  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget{

  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return   MaterialApp(
      debugShowCheckedModeBanner:false,
      home:Splash()
    );
  }
}



