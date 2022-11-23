import 'package:placeholder/model/Albummodel.dart';
import 'package:placeholder/model/Albummodel.dart';


class Album {
  List<Detail>? Details;
  Album({
    this.Details,
  });
  factory Album.fromJson(List<dynamic> json) {
    List<Detail> alb = json.map((e) => Detail.fromJson(e)).toList();

    return Album(Details: alb);
  }
}

class Detail {
  int? user_id;
  int? id;
  String? title;


  Detail({
    this.user_id,
    this.id,
    this.title,
  });
  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
        user_id: json['UserId'],
        id: json['id'],
        title: json['title']);
  }
  Map<String, dynamic> toJson() => {
    'UserId': user_id,
    'id': id,
    'title': title,

  };
  @override
 toStirng() {
    return this.id;
  }
}

