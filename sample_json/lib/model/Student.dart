class Student{
  String? id;
  String? first_name;
  String? last_name;
  String? email;
  String? password;


  Student({required this.id,required this.first_name,required this.last_name,required this.email,required this.password});

  Student.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    first_name=json['first_name'];
    last_name=json['last_name'];
    email=json['email'];
    password=json['password'];
  }
}
