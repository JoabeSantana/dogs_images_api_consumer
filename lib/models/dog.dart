class Dog {
  
  Dog({required this.image});
  
  String image;

  factory Dog.fromJson(Map<String, dynamic> json){
    return Dog(image: json['message']);
  }
}