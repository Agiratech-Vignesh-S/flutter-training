import 'package:placeholder/model/Albummodel.dart';
import 'package:placeholder/model/Albummodel.dart';

import 'Albummodel.dart';

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
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;
  Detail({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });
  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
        albumId: json['albumId'],
        id: json['id'],
        title: json['title'],
        url: json['url'],
        thumbnailUrl: json['thumbnailUrl']);
  }
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'albumId': albumId,
    'url': url,
    'thumbnailUrl': thumbnailUrl
  };
}