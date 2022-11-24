class Album {
  List<Detail>? details;
  Album({
    this.details,
  });
  factory Album.fromJson(List<dynamic> json) {
    List<Detail> alb = json.map((e) => Detail.fromJson(e)).toList();

    return Album(details: alb);
  }
}

class Detail {
  int? userId;
  int? id;
  String? title;


  Detail({
    this.userId,
    this.id,
    this.title,
  });
  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
        userId: json['UserId'],
        id: json['id'],
        title: json['title']);
  }
  Map<String, dynamic> toJson() => {
    'UserId': userId,
    'id': id,
    'title': title,

  };
}

