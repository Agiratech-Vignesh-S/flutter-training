class Countries {
  List<Country>? data;

  Countries({this.data});

  factory Countries.fromJson(Map<String, dynamic> json) {
    List coun = List.from(json['data']);
    List<Country> datas = coun
        .map(
          (e) => Country.fromJson(e),
        ).toList();

    return Countries(data: datas);
  }

  Map<String, dynamic> toJson() => {
        'data': data,
      };
}

class Country {
  String? country;

  Country({
    this.country,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() => {
        'country': country,
      };
}
