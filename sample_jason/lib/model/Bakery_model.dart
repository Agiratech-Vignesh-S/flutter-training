class Bakery {
  String? id;
  List<String>? type;
  String? name;
  double? ppu;
  Batters? batters;
  Bakery({
    this.id,
    this.type,
    this.name,
    this.ppu,
    this.batters,
  });
  factory Bakery.fromJson(Map<String, dynamic> json) {
    List<String> type = List.from(json['type']);
    return Bakery(
        id: json['id'],
        type: type,
        name: json['name'],
        ppu: json['ppu'],
        batters: Batters.fromJson(json['batters']));
  }
}

class Batters {
  String? Batters_id;
  String? Batters_type;
  Batters({
    required this.Batters_id,
    required this.Batters_type,
  });
  factory Batters.fromJson(Map<String, dynamic> json) {
    return Batters(Batters_id: json['id'], Batters_type: json['type']);
  }
}