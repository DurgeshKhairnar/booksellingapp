class profileModel{

  final String name;
  final int id;
  final String email;
  final String pass;

  profileModel(
    {
      required this.name,
      required this.id,
      required this.email,
      required this.pass

    }
  );

  Map<String,dynamic> ml(){
    return {
      "name" : name,
      "id" : id,
      "email" : email,
      "pass" : pass,
    };
  }
}