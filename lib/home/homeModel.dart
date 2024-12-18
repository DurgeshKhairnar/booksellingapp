class homeModel{
  String image;
  String name;
  int price;
  String id;
  bool favo;
  String proName;
  

  homeModel({
    required this.image,
    required this.name,
    required this.price,
    required this.id,
    required this.favo,
    required this.proName,

 
  });


  Map<String,dynamic> datawa (){
    return{
      "name":name,
      "image":image,
      "price":price,
      "id":id,
      "favo":favo,
      "proInfo":proName
    };
  }
}