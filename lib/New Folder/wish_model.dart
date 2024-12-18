

class Productdet{
 final String img;
 final String title;
 final String description;
 final String price;
 final String discount;
 final String id;

  Productdet({
    required this. img,
    required this.title,
    required this.description,
    required this.price,
    required this.discount,
    required this.id,


  });
  

    factory Productdet.fromMap(Map<String, dynamic> map) {
    return Productdet(
      id: map['id'],
      title: map['title'],
      img: map['img'],
      description: map['description'],
      price: map['price'],
      discount: map['discount'],
    );
  }
}
       
        

   


